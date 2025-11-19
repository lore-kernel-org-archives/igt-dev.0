Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0858CF256C
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 03:41:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B27310E560;
	Wed, 19 Nov 2025 03:41:33 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD3F10E560;
 Wed, 19 Nov 2025 03:41:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8918139673317088444=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Switch_to_use_kernel_sta?=
 =?utf-8?q?ndard_fault_injection_in_i915_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 19 Nov 2025 03:41:31 -0000
Message-ID: <176352369121.6922.15653248171268852196@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251118143301.510707-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20251118143301.510707-1-juhapekka.heikkila@gmail.com>
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

--===============8918139673317088444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Switch to use kernel standard fault injection in i915 (rev5)
URL   : https://patchwork.freedesktop.org/series/155764/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8632_full -> IGTPW_14079_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14079_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14079_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14079_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_drm_fdinfo@memory-info-resident:
    - shard-tglu:         [PASS][1] -> [SKIP][2] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-4/igt@i915_drm_fdinfo@memory-info-resident.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@i915_drm_fdinfo@memory-info-resident.html

  * igt@i915_module_load@fault-injection@i915_driver_mmio_probe (NEW):
    - shard-tglu:         NOTRUN -> [FAIL][3] +5 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html
    - shard-glk:          NOTRUN -> [FAIL][4] +5 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-glk6/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html
    - shard-mtlp:         NOTRUN -> [FAIL][5] +11 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-4/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html

  * igt@i915_module_load@fault-injection@intel_connector_register (NEW):
    - shard-rkl:          NOTRUN -> [FAIL][6] +3 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@i915_module_load@fault-injection@intel_connector_register.html
    - shard-snb:          NOTRUN -> [FAIL][7] +5 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-snb7/igt@i915_module_load@fault-injection@intel_connector_register.html

  * {igt@i915_module_load@fault-injection@intel_gt_init-enodev} (NEW):
    - shard-dg2:          NOTRUN -> [FAIL][8] +10 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@i915_module_load@fault-injection@intel_gt_init-enodev.html

  * {igt@i915_module_load@fault-injection@uc_fw_rsa_data_create} (NEW):
    - shard-tglu:         NOTRUN -> [SKIP][9] +5 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@i915_module_load@fault-injection@uc_fw_rsa_data_create.html

  * igt@runner@aborted:
    - shard-dg1:          NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-15/igt@runner@aborted.html

  
#### Warnings ####

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-mtlp:         [SKIP][11] ([i915#4212]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-8/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-4/igt@kms_addfb_basic@tile-pitch-mismatch.html
    - shard-dg2:          [SKIP][13] ([i915#4212]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-7/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@kms_addfb_basic@tile-pitch-mismatch.html

  
New tests
---------

  New tests have been introduced between IGT_8632_full and IGTPW_14079_full:

### New IGT tests (12) ###

  * igt@gem_ccs@large-ctrl-surf-copy:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@i915_module_load@fault-injection:
    - Statuses : 1 dmesg-fail(s) 5 fail(s)
    - Exec time: [60.29, 82.83] s

  * igt@i915_module_load@fault-injection@__fw_domain_init:
    - Statuses : 2 fail(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@i915_module_load@fault-injection@__uc_init:
    - Statuses : 2 fail(s) 4 skip(s)
    - Exec time: [0.0, 2.61] s

  * igt@i915_module_load@fault-injection@i915_driver_early_probe:
    - Statuses : 6 fail(s)
    - Exec time: [0.00, 0.02] s

  * igt@i915_module_load@fault-injection@i915_driver_hw_probe:
    - Statuses : 6 fail(s)
    - Exec time: [0.00, 0.02] s

  * igt@i915_module_load@fault-injection@i915_driver_mmio_probe:
    - Statuses : 1 dmesg-fail(s) 5 fail(s)
    - Exec time: [0.00, 22.80] s

  * igt@i915_module_load@fault-injection@i915_pci_probe:
    - Statuses : 6 fail(s)
    - Exec time: [0.00, 0.02] s

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - Statuses : 6 fail(s)
    - Exec time: [0.00, 0.02] s

  * igt@i915_module_load@fault-injection@intel_gt_init-enodev:
    - Statuses : 2 fail(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@i915_module_load@fault-injection@intel_guc_ct_init:
    - Statuses : 2 fail(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@i915_module_load@fault-injection@uc_fw_rsa_data_create:
    - Statuses : 2 fail(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_14079_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-tglu:         NOTRUN -> [SKIP][15] ([i915#6230])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@api_intel_bb@crc32.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#11078])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-19/igt@device_reset@cold-reset-bound.html
    - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#11078])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-7/igt@device_reset@cold-reset-bound.html
    - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#11078]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-3/igt@device_reset@cold-reset-bound.html
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#11078])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-6/igt@device_reset@cold-reset-bound.html
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#11078])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@device_reset@cold-reset-bound.html

  * igt@drm_buddy@drm_buddy:
    - shard-glk10:        NOTRUN -> [DMESG-WARN][21] ([i915#15095]) +1 other test dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-glk10/igt@drm_buddy@drm_buddy.html

  * igt@fbdev@info:
    - shard-rkl:          [PASS][22] -> [SKIP][23] ([i915#14544] / [i915#1849] / [i915#2582])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-2/igt@fbdev@info.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@fbdev@info.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#14544] / [i915#7697])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#14544] / [i915#3555] / [i915#9323])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-tglu-1:       NOTRUN -> [SKIP][26] ([i915#9323])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [PASS][27] -> [INCOMPLETE][28] ([i915#13356])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-8/igt@gem_ccs@suspend-resume.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][29] -> [INCOMPLETE][30] ([i915#12392] / [i915#13356])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-8/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#7697])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#8555])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-close.html
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#8555])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][34] ([i915#1099]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-snb5/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#280])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-4/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#280])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#280])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-14/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-tglu:         NOTRUN -> [SKIP][38] ([i915#280])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-2/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-mtlp:         NOTRUN -> [SKIP][39] ([i915#280])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-3/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#4812]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-19/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-tglu:         NOTRUN -> [SKIP][41] ([i915#4525])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_big@single:
    - shard-tglu:         NOTRUN -> [ABORT][42] ([i915#11713])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-10/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-tglu-1:       NOTRUN -> [SKIP][43] ([i915#6334]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_fence@concurrent:
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#4812]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@gem_exec_fence@concurrent.html
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4812])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-5/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#3539] / [i915#4852]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-5/igt@gem_exec_flush@basic-wb-pro-default.html
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#3539] / [i915#4852])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-16/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#3281]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-19/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_reloc@basic-wc-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#3281]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@gem_exec_reloc@basic-wc-gtt.html

  * igt@gem_exec_reloc@basic-write-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#3281])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-3/igt@gem_exec_reloc@basic-write-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#3281]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][52] ([i915#14544] / [i915#3281]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4537] / [i915#4812])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4860])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-6/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4860])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-7/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu-1:       NOTRUN -> [SKIP][56] ([i915#4613] / [i915#7582])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#4613]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-tglu-1:       NOTRUN -> [SKIP][58] ([i915#4613])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-glk:          NOTRUN -> [SKIP][59] ([i915#4613])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-glk6/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][60] ([i915#4613]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-9/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_mmap_gtt@coherency:
    - shard-tglu-1:       NOTRUN -> [SKIP][61] +35 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4077]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-17/igt@gem_mmap_gtt@cpuset-basic-small-copy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#4077]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@gem_mmap_gtt@cpuset-medium-copy.html

  * igt@gem_mmap_wc@write:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#4083])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@gem_mmap_wc@write.html
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4083])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-12/igt@gem_mmap_wc@write.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4083]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-8/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#3282]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-12/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#3282]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pread@uncached:
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#14544] / [i915#3282]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_pread@uncached.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          [PASS][70] -> [SKIP][71] ([i915#14544] / [i915#4270])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-8/igt@gem_pxp@create-protected-buffer.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][72] ([i915#12917] / [i915#12964]) +1 other test timeout
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-rkl:          [PASS][73] -> [TIMEOUT][74] ([i915#12917] / [i915#12964])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-8/igt@gem_pxp@create-regular-context-2.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4270]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-13/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu:         NOTRUN -> [SKIP][76] ([i915#13398]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][77] ([i915#12964]) +1 other test timeout
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4270]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-7/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#5190] / [i915#8428]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-8/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#4079]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-17/igt@gem_render_tiled_blits@basic.html
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4079])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@gem_render_tiled_blits@basic.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#4885])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-14/igt@gem_softpin@evict-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#4885])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-5/igt@gem_softpin@evict-snoop.html
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#4885])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-5/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4077]) +10 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-6/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglu:         NOTRUN -> [SKIP][86] ([i915#3297])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-4/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#3297])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-8/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#3297])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-5/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#3297] / [i915#3323])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-tglu-1:       NOTRUN -> [SKIP][90] ([i915#2527] / [i915#2856]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#2527] / [i915#2856]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-8/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#14544] / [i915#2527])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#2856])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@gen9_exec_parse@shadow-peek.html
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#2527]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@gen9_exec_parse@shadow-peek.html
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#2527])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-18/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_drm_fdinfo@isolation@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#14073]) +5 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-16/igt@i915_drm_fdinfo@isolation@bcs0.html

  * igt@i915_drm_fdinfo@isolation@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#14073]) +6 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@i915_drm_fdinfo@isolation@rcs0.html
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#14073]) +7 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-5/igt@i915_drm_fdinfo@isolation@rcs0.html

  * igt@i915_drm_fdinfo@virtual-busy-hang-all:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#14118]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@i915_drm_fdinfo@virtual-busy-hang-all.html
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#14118])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-19/igt@i915_drm_fdinfo@virtual-busy-hang-all.html

  * igt@i915_module_load@fault-injection (NEW):
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][101] ([i915#12964]) +1 other test dmesg-fail
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@i915_module_load@fault-injection.html

  * {igt@i915_module_load@fault-injection@intel_guc_ct_init} (NEW):
    - shard-snb:          NOTRUN -> [SKIP][102] +90 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-snb7/igt@i915_module_load@fault-injection@intel_guc_ct_init.html

  * igt@i915_module_load@load:
    - shard-tglu-1:       ([PASS][103], [PASS][104], [PASS][105]) -> ([PASS][106], [SKIP][107]) ([i915#14785])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-1/igt@i915_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-1/igt@i915_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-1/igt@i915_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@i915_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@i915_module_load@load.html
    - shard-dg1:          ([PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132]) -> ([SKIP][133], [PASS][134], [SKIP][135], [SKIP][136], [PASS][137], [SKIP][138], [PASS][139], [PASS][140], [PASS][141], [SKIP][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [SKIP][150], [PASS][151]) ([i915#14785])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-16/igt@i915_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-15/igt@i915_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-14/igt@i915_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-12/igt@i915_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-15/igt@i915_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-15/igt@i915_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-18/igt@i915_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-19/igt@i915_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-12/igt@i915_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-12/igt@i915_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-17/igt@i915_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-12/igt@i915_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-13/igt@i915_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-18/igt@i915_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-14/igt@i915_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-17/igt@i915_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-14/igt@i915_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-16/igt@i915_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-13/igt@i915_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-13/igt@i915_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-19/igt@i915_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-18/igt@i915_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-17/igt@i915_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-16/igt@i915_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-19/igt@i915_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-12/igt@i915_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-13/igt@i915_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-13/igt@i915_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-14/igt@i915_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-14/igt@i915_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-15/igt@i915_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-15/igt@i915_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-15/igt@i915_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-16/igt@i915_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-16/igt@i915_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-17/igt@i915_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-17/igt@i915_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-17/igt@i915_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-18/igt@i915_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-18/igt@i915_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-18/igt@i915_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-19/igt@i915_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-19/igt@i915_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-12/igt@i915_module_load@load.html
    - shard-tglu:         ([PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172]) -> ([PASS][173], [PASS][174], [PASS][175], [SKIP][176], [PASS][177], [PASS][178], [SKIP][179], [SKIP][180], [PASS][181], [SKIP][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [SKIP][187], [PASS][188]) ([i915#14785])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-8/igt@i915_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-5/igt@i915_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-7/igt@i915_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-6/igt@i915_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-9/igt@i915_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-2/igt@i915_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-3/igt@i915_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-9/igt@i915_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-10/igt@i915_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-3/igt@i915_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-10/igt@i915_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-2/igt@i915_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-5/igt@i915_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-10/igt@i915_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-7/igt@i915_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-9/igt@i915_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-6/igt@i915_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-3/igt@i915_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-4/igt@i915_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-2/igt@i915_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-4/igt@i915_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-9/igt@i915_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-10/igt@i915_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-10/igt@i915_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-2/igt@i915_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-2/igt@i915_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@i915_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@i915_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-4/igt@i915_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@i915_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@i915_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-6/igt@i915_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-6/igt@i915_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-7/igt@i915_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-7/igt@i915_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-8/igt@i915_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-9/igt@i915_module_load@load.html
    - shard-glk:          ([PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198]) -> ([SKIP][199], [SKIP][200], [SKIP][201], [SKIP][202], [SKIP][203])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-glk3/igt@i915_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-glk5/igt@i915_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-glk6/igt@i915_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-glk9/igt@i915_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-glk5/igt@i915_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-glk1/igt@i915_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-glk6/igt@i915_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-glk3/igt@i915_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-glk1/igt@i915_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-glk9/igt@i915_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-glk1/igt@i915_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-glk3/igt@i915_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-glk5/igt@i915_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-glk6/igt@i915_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-glk9/igt@i915_module_load@load.html
    - shard-mtlp:         ([PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228]) -> ([PASS][229], [PASS][230], [SKIP][231], [PASS][232], [SKIP][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [SKIP][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [SKIP][244], [SKIP][245], [PASS][246], [PASS][247], [PASS][248]) ([i915#14785])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-2/igt@i915_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-7/igt@i915_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-3/igt@i915_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-4/igt@i915_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-8/igt@i915_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-3/igt@i915_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-4/igt@i915_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-2/igt@i915_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-6/igt@i915_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-2/igt@i915_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-4/igt@i915_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-3/igt@i915_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-5/igt@i915_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-2/igt@i915_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-8/igt@i915_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-5/igt@i915_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-7/igt@i915_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-3/igt@i915_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-8/igt@i915_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-6/igt@i915_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-8/igt@i915_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-6/igt@i915_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-7/igt@i915_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-6/igt@i915_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-5/igt@i915_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@i915_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@i915_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@i915_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-3/igt@i915_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-3/igt@i915_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-4/igt@i915_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-4/igt@i915_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-4/igt@i915_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-5/igt@i915_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-5/igt@i915_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-6/igt@i915_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-6/igt@i915_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-6/igt@i915_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-7/igt@i915_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-7/igt@i915_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-7/igt@i915_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-8/igt@i915_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-8/igt@i915_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-8/igt@i915_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-8/igt@i915_module_load@load.html
    - shard-dg2:          ([PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273]) -> ([PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [SKIP][286], [PASS][287], [SKIP][288], [PASS][289], [SKIP][290], [PASS][291], [SKIP][292], [PASS][293], [PASS][294]) ([i915#14785])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-4/igt@i915_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-6/igt@i915_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-4/igt@i915_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-7/igt@i915_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-1/igt@i915_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-3/igt@i915_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-5/igt@i915_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-5/igt@i915_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-7/igt@i915_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-11/igt@i915_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-11/igt@i915_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-3/igt@i915_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-8/igt@i915_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-11/igt@i915_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-8/igt@i915_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-8/igt@i915_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-1/igt@i915_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-6/igt@i915_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-1/igt@i915_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-5/igt@i915_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-11/igt@i915_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-7/igt@i915_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-4/igt@i915_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-3/igt@i915_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-6/igt@i915_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@i915_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@i915_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@i915_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@i915_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@i915_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@i915_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@i915_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@i915_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@i915_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@i915_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@i915_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-4/igt@i915_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-4/igt@i915_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-5/igt@i915_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-5/igt@i915_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-6/igt@i915_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-6/igt@i915_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-7/igt@i915_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-7/igt@i915_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-8/igt@i915_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-8/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-no-display:
    - shard-snb:          [PASS][295] -> [DMESG-WARN][296] ([i915#14545])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-snb1/igt@i915_module_load@reload-no-display.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-snb6/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-tglu-1:       NOTRUN -> [SKIP][297] ([i915#8399])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#8399])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-7/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu-1:       NOTRUN -> [WARN][299] ([i915#13790] / [i915#2681]) +1 other test warn
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#14498])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-mtlp:         NOTRUN -> [SKIP][301] +3 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-rkl:          [PASS][302] -> [ABORT][303] ([i915#15060])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-8/igt@i915_pm_rpm@system-suspend.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][304] ([i915#11681] / [i915#6621])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-13/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@thresholds:
    - shard-dg2:          NOTRUN -> [SKIP][305] ([i915#11681])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@i915_pm_rps@thresholds.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#11681])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-12/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu-1:       NOTRUN -> [SKIP][307] ([i915#6245])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-mtlp:         NOTRUN -> [SKIP][308] ([i915#6188])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-6/igt@i915_query@query-topology-coherent-slice-mask.html
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#6188])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu-1:       NOTRUN -> [SKIP][310] ([i915#5723])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][311] ([i915#4817])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#4215])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-16/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#4212])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-6/igt@kms_addfb_basic@clobberred-modifier.html
    - shard-dg1:          NOTRUN -> [SKIP][314] ([i915#4212])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-13/igt@kms_addfb_basic@clobberred-modifier.html
    - shard-mtlp:         NOTRUN -> [SKIP][315] ([i915#4212])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-7/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu-1:       NOTRUN -> [SKIP][316] ([i915#12454] / [i915#12712])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-snb:          [PASS][317] -> [SKIP][318]
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-snb4/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-snb7/igt@kms_addfb_basic@tile-pitch-mismatch.html
    - shard-glk:          [PASS][319] -> [SKIP][320]
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-glk3/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-glk6/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-mtlp:         NOTRUN -> [SKIP][321] ([i915#3555])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg2:          NOTRUN -> [SKIP][322] ([i915#9531])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#9531])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#9531])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-14/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu:         NOTRUN -> [SKIP][325] ([i915#9531])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-dg2:          [PASS][326] -> [FAIL][327] ([i915#5956]) +1 other test fail
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-5/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][328] ([i915#5286]) +3 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][329] ([i915#5286]) +4 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#5286]) +3 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][331] ([i915#4538] / [i915#5286]) +2 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-13/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          [PASS][332] -> [SKIP][333] ([i915#14544]) +75 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2:          NOTRUN -> [SKIP][334] ([i915#5190])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#4538] / [i915#5190]) +5 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
    - shard-dg1:          NOTRUN -> [SKIP][336] ([i915#4538]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-19/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][337] ([i915#6187])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][338] +7 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [SKIP][339] +29 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-glk10/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][340] ([i915#10307] / [i915#6095]) +158 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-a-dp-3.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][341] ([i915#12313])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][342] ([i915#6095]) +44 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][343] ([i915#6095]) +29 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][344] ([i915#14098] / [i915#6095]) +24 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [ABORT][345] ([i915#12796] / [i915#15132])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][346] -> [INCOMPLETE][347] ([i915#12796]) +1 other test incomplete
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][348] ([i915#12796]) +1 other test incomplete
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-glk10/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][349] ([i915#6095]) +20 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-dp-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][350] ([i915#12313]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][351] ([i915#12313])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-14/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][352] ([i915#12313])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][353] ([i915#6095]) +22 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][354] +106 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-glk6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][355] ([i915#6095]) +125 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][356] ([i915#6095]) +39 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][357] ([i915#12313]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][358] ([i915#10307] / [i915#10434] / [i915#6095])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          NOTRUN -> [SKIP][359] ([i915#14544] / [i915#3742])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu-1:       NOTRUN -> [SKIP][360] ([i915#3742]) +1 other test skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][361] ([i915#13781]) +3 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][362] ([i915#3742])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][363] ([i915#13783]) +3 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg1:          NOTRUN -> [SKIP][364] +19 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-19/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@gamma:
    - shard-tglu:         NOTRUN -> [SKIP][365] ([i915#2575]) +19 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][366] ([i915#11151] / [i915#7828]) +3 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
    - shard-rkl:          NOTRUN -> [SKIP][367] ([i915#11151] / [i915#7828]) +2 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][368] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-tglu:         NOTRUN -> [SKIP][369] ([i915#11151] / [i915#7828]) +4 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][370] ([i915#11151] / [i915#7828]) +2 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-dg1:          NOTRUN -> [SKIP][371] ([i915#11151] / [i915#7828]) +3 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-13/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-mtlp:         NOTRUN -> [SKIP][372] ([i915#11151] / [i915#7828]) +2 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-7/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_color@ctm-0-75:
    - shard-rkl:          [PASS][373] -> [SKIP][374] ([i915#12655] / [i915#14544]) +5 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-5/igt@kms_color@ctm-0-75.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_color@ctm-0-75.html

  * igt@kms_color@deep-color:
    - shard-tglu:         NOTRUN -> [SKIP][375] ([i915#3555] / [i915#9979])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-9/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic:
    - shard-tglu-1:       NOTRUN -> [SKIP][376] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][377] ([i915#7118] / [i915#9424])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-5/igt@kms_content_protection@atomic-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][378] ([i915#7116] / [i915#9424])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-14/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-mtlp:         NOTRUN -> [SKIP][379] ([i915#6944] / [i915#9424])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-7/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][380] ([i915#3116])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_content_protection@dp-mst-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][381] ([i915#3299])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-14/igt@kms_content_protection@dp-mst-type-0.html
    - shard-dg2:          NOTRUN -> [SKIP][382] ([i915#3299])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-8/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][383] ([i915#14544]) +43 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-tglu:         NOTRUN -> [SKIP][384] ([i915#6944] / [i915#9424])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-4/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][385] ([i915#9424])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][386] ([i915#9424])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-15/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][387] ([i915#7118] / [i915#7162] / [i915#9424])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-tglu:         NOTRUN -> [SKIP][388] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][389] ([i915#13049])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-dg2:          NOTRUN -> [SKIP][390] ([i915#13049])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][391] ([i915#13049])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-19/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][392] ([i915#3555]) +3 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][393] ([i915#8814]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][394] ([i915#3555])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-4/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [FAIL][395] ([i915#13566]) +1 other test fail
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][396] ([i915#12964]) +8 other tests dmesg-warn
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][397] ([i915#3555])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][398] ([i915#3555]) +4 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][399] ([i915#13049])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-tglu:         [PASS][400] -> [FAIL][401] ([i915#13566]) +3 other tests fail
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
    - shard-rkl:          [PASS][402] -> [FAIL][403] ([i915#13566]) +2 other tests fail
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][404] ([i915#13566])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][405] ([i915#13049]) +2 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-6/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-tglu-1:       NOTRUN -> [FAIL][406] ([i915#13566]) +1 other test fail
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [ABORT][407] ([i915#15132])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@kms_cursor_crc@cursor-suspend@pipe-b-hdmi-a-1.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][408] ([i915#4103] / [i915#4213]) +1 other test skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][409] ([i915#4103] / [i915#4213]) +1 other test skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - shard-tglu:         NOTRUN -> [SKIP][410] ([i915#4103])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][411] ([i915#4103])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - shard-rkl:          [PASS][412] -> [SKIP][413] ([i915#11190] / [i915#14544]) +2 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-8/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-rkl:          [PASS][414] -> [FAIL][415] ([i915#15277])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][416] ([i915#13046] / [i915#5354]) +5 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][417] ([i915#4103])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][418] ([i915#9723])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          NOTRUN -> [SKIP][419] ([i915#13691])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu:         NOTRUN -> [SKIP][420] ([i915#1769] / [i915#3555] / [i915#3804])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][421] ([i915#3804])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          [PASS][422] -> [SKIP][423] ([i915#3555]) +1 other test skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-8/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          [PASS][424] -> [SKIP][425] ([i915#1257])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-11/igt@kms_dp_aux_dev.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-7/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-tglu-1:       NOTRUN -> [SKIP][426] ([i915#13749])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg1:          NOTRUN -> [SKIP][427] ([i915#13748])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-17/igt@kms_dp_link_training@uhbr-mst.html
    - shard-tglu:         NOTRUN -> [SKIP][428] ([i915#13748])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-2/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-tglu:         NOTRUN -> [SKIP][429] ([i915#13707])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-10/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          NOTRUN -> [SKIP][430] ([i915#3555] / [i915#3840])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-8/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg2:          NOTRUN -> [SKIP][431] ([i915#3555] / [i915#3840])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@kms_dsc@dsc-with-output-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][432] ([i915#3555] / [i915#3840])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-15/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][433] ([i915#14544] / [i915#3955])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-2x:
    - shard-tglu:         NOTRUN -> [SKIP][434] ([i915#1839])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-2/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2:          NOTRUN -> [SKIP][435] ([i915#9337])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][436] ([i915#3637] / [i915#9934]) +4 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-10/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][437] ([i915#9934]) +1 other test skip
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-tglu:         NOTRUN -> [SKIP][438] ([i915#9934])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][439] ([i915#8381])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-4/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][440] ([i915#9934]) +1 other test skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][441] ([i915#3637] / [i915#9934])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@kms_flip@2x-flip-vs-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][442] ([i915#14544] / [i915#9934]) +1 other test skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][443] ([i915#3637] / [i915#9934]) +5 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][444] ([i915#9934]) +1 other test skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-18/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-rkl:          [PASS][445] -> [SKIP][446] ([i915#14544] / [i915#3637]) +8 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg1:          [PASS][447] -> [DMESG-WARN][448] ([i915#4423]) +1 other test dmesg-warn
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-13/igt@kms_flip@flip-vs-suspend.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-16/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-rkl:          [PASS][449] -> [ABORT][450] ([i915#15132]) +2 other tests abort
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-7/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a4:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][451] ([i915#4423])
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-16/igt@kms_flip@flip-vs-suspend@d-hdmi-a4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-rkl:          [PASS][452] -> [SKIP][453] ([i915#14544] / [i915#3555]) +5 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][454] ([i915#2672] / [i915#3555]) +3 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][455] ([i915#2587] / [i915#2672]) +5 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][456] ([i915#2672] / [i915#3555])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][457] ([i915#2587] / [i915#2672] / [i915#3555])
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][458] ([i915#2672]) +2 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][459] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][460] ([i915#2672] / [i915#8813])
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][461] ([i915#2672]) +1 other test skip
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][462] ([i915#2672] / [i915#3555])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][463] ([i915#2587] / [i915#2672]) +1 other test skip
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][464] ([i915#14544] / [i915#3555]) +2 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][465] ([i915#2672] / [i915#3555]) +2 other tests skip
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][466] ([i915#2587] / [i915#2672]) +2 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][467] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][468] ([i915#2672] / [i915#3555] / [i915#8813]) +4 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][469] ([i915#15104]) +1 other test skip
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-rkl:          [PASS][470] -> [DMESG-WARN][471] ([i915#12917] / [i915#12964]) +1 other test dmesg-warn
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [PASS][472] -> [SKIP][473] ([i915#14544] / [i915#1849] / [i915#5354]) +14 other tests skip
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][474] ([i915#1825]) +13 other tests skip
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][475] ([i915#5354]) +18 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][476] ([i915#8708]) +1 other test skip
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][477] ([i915#15104]) +1 other test skip
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
    - shard-rkl:          NOTRUN -> [SKIP][478] ([i915#15102])
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][479] ([i915#15102]) +19 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][480] ([i915#15102] / [i915#3458]) +8 other tests skip
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][481] ([i915#10433] / [i915#15102] / [i915#3458])
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][482] ([i915#1825]) +12 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][483] ([i915#8708]) +4 other tests skip
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][484] ([i915#8708]) +3 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][485] ([i915#5439])
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu-1:       NOTRUN -> [SKIP][486] ([i915#9766])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][487] ([i915#15104]) +1 other test skip
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][488] ([i915#15102]) +15 other tests skip
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][489] ([i915#15102])
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][490] ([i915#15102] / [i915#3023]) +6 other tests skip
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][491] ([i915#14544] / [i915#1849] / [i915#5354]) +11 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][492] +51 other tests skip
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][493] ([i915#15102] / [i915#3458]) +9 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][494] ([i915#3555] / [i915#8228]) +3 other tests skip
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          NOTRUN -> [SKIP][495] ([i915#3555] / [i915#8228])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-tglu-1:       NOTRUN -> [SKIP][496] ([i915#3555] / [i915#8228])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][497] ([i915#3555] / [i915#8228])
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-18/igt@kms_hdr@static-swap.html
    - shard-dg2:          [PASS][498] -> [SKIP][499] ([i915#3555] / [i915#8228])
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-11/igt@kms_hdr@static-swap.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@kms_hdr@static-swap.html

  * igt@kms_invalid_mode@zero-hdisplay:
    - shard-rkl:          NOTRUN -> [SKIP][500] ([i915#14544] / [i915#3555] / [i915#8826])
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_invalid_mode@zero-hdisplay.html

  * igt@kms_invalid_mode@zero-vdisplay:
    - shard-rkl:          [PASS][501] -> [SKIP][502] ([i915#14544] / [i915#3555] / [i915#8826])
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-4/igt@kms_invalid_mode@zero-vdisplay.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_invalid_mode@zero-vdisplay.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          [PASS][503] -> [SKIP][504] ([i915#12388])
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-11/igt@kms_joiner@basic-force-big-joiner.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@kms_joiner@basic-force-big-joiner.html
    - shard-tglu-1:       NOTRUN -> [SKIP][505] ([i915#12388])
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][506] ([i915#12339])
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][507] ([i915#10656] / [i915#12388])
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][508] ([i915#13522])
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][509] +8 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-7/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-rkl:          NOTRUN -> [SKIP][510] ([i915#14712])
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
    - shard-dg1:          NOTRUN -> [SKIP][511] ([i915#14712])
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-14/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_plane@pixel-format:
    - shard-rkl:          [PASS][512] -> [SKIP][513] ([i915#14544] / [i915#8825])
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-8/igt@kms_plane@pixel-format.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane@pixel-format.html

  * igt@kms_plane@planar-pixel-format-settings:
    - shard-rkl:          [PASS][514] -> [SKIP][515] ([i915#14544] / [i915#9581])
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-2/igt@kms_plane@planar-pixel-format-settings.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane@planar-pixel-format-settings.html

  * igt@kms_plane@plane-position-hole:
    - shard-rkl:          NOTRUN -> [SKIP][516] ([i915#14544] / [i915#8825])
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_alpha_blend@constant-alpha-mid:
    - shard-rkl:          NOTRUN -> [SKIP][517] ([i915#14544] / [i915#7294]) +1 other test skip
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_alpha_blend@constant-alpha-mid.html

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
    - shard-rkl:          [PASS][518] -> [SKIP][519] ([i915#14544] / [i915#7294])
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-5/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][520] ([i915#13958])
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-tglu:         NOTRUN -> [SKIP][521] ([i915#13958])
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-7/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-tglu:         NOTRUN -> [SKIP][522] ([i915#14259])
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-4/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][523] ([i915#13046] / [i915#5354] / [i915#9423])
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a:
    - shard-rkl:          [PASS][524] -> [SKIP][525] ([i915#12247] / [i915#14544]) +4 other tests skip
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][526] ([i915#12247]) +2 other tests skip
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
    - shard-rkl:          [PASS][527] -> [SKIP][528] ([i915#14544] / [i915#8152]) +1 other test skip
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:
    - shard-rkl:          [PASS][529] -> [SKIP][530] ([i915#12247] / [i915#14544] / [i915#8152]) +5 other tests skip
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][531] ([i915#14544] / [i915#6953] / [i915#8152])
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][532] ([i915#12247] / [i915#14544]) +1 other test skip
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-rkl:          [PASS][533] -> [SKIP][534] ([i915#12247] / [i915#14544] / [i915#3555] / [i915#6953] / [i915#8152])
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][535] ([i915#14544] / [i915#3555] / [i915#6953] / [i915#8152])
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-rkl:          [PASS][536] -> [SKIP][537] ([i915#12247] / [i915#14544] / [i915#6953] / [i915#8152])
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][538] ([i915#12247] / [i915#14544] / [i915#8152]) +1 other test skip
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@fade:
    - shard-dg1:          NOTRUN -> [SKIP][539] ([i915#5354])
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-17/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][540] ([i915#9812])
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][541] ([i915#9812]) +1 other test skip
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-7/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][542] ([i915#4281])
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu-1:       NOTRUN -> [SKIP][543] ([i915#8430])
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][544] ([i915#14544] / [i915#1849])
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          [PASS][545] -> [SKIP][546] ([i915#12916] / [i915#14544])
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][547] ([i915#15073])
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          NOTRUN -> [SKIP][548] ([i915#12916] / [i915#14544])
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html
    - shard-dg1:          NOTRUN -> [SKIP][549] ([i915#15073])
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-16/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          [PASS][550] -> [SKIP][551] ([i915#15073])
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [PASS][552] -> [SKIP][553] ([i915#15073])
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-rkl:          [PASS][554] -> [SKIP][555] ([i915#14544] / [i915#6524])
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-4/igt@kms_prime@basic-crc-vgem.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][556] ([i915#11520]) +7 other tests skip
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-glk:          NOTRUN -> [SKIP][557] ([i915#11520]) +2 other tests skip
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-glk6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][558] ([i915#9808])
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][559] ([i915#12316]) +3 other tests skip
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-glk10:        NOTRUN -> [SKIP][560] ([i915#11520]) +1 other test skip
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-glk10/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][561] ([i915#11520] / [i915#14544])
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][562] ([i915#11520]) +1 other test skip
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][563] ([i915#11520]) +3 other tests skip
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-12/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][564] ([i915#11520]) +5 other tests skip
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-4/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
    - shard-snb:          NOTRUN -> [SKIP][565] ([i915#11520]) +2 other tests skip
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-snb7/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-tglu-1:       NOTRUN -> [SKIP][566] ([i915#11520]) +4 other tests skip
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][567] ([i915#9732]) +13 other tests skip
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][568] ([i915#1072] / [i915#9732]) +10 other tests skip
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@kms_psr@fbc-pr-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][569] ([i915#1072] / [i915#9732]) +6 other tests skip
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-18/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][570] ([i915#1072] / [i915#14544] / [i915#9732])
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][571] ([i915#9732]) +14 other tests skip
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-10/igt@kms_psr@fbc-psr2-cursor-mmap-cpu.html

  * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][572] ([i915#4077] / [i915#9688]) +1 other test skip
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-5/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][573] ([i915#1072] / [i915#9732]) +8 other tests skip
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][574] ([i915#5289])
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-mtlp:         NOTRUN -> [SKIP][575] ([i915#12755])
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@kms_rotation_crc@primary-rotation-90.html
    - shard-dg2:          NOTRUN -> [SKIP][576] ([i915#12755])
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_setmode@basic:
    - shard-tglu-1:       NOTRUN -> [FAIL][577] ([i915#15106]) +2 other tests fail
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-mtlp:         [PASS][578] -> [FAIL][579] ([i915#15106]) +2 other tests fail
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-4/igt@kms_setmode@basic@pipe-b-edp-1.html
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_sharpness_filter@filter-basic:
    - shard-tglu:         NOTRUN -> [SKIP][580] ([i915#15232]) +1 other test skip
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@kms_sharpness_filter@filter-basic.html

  * igt@kms_sharpness_filter@filter-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][581] ([i915#15232]) +1 other test skip
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@kms_sharpness_filter@filter-suspend.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-tglu-1:       NOTRUN -> [SKIP][582] ([i915#15232]) +1 other test skip
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaler:
    - shard-dg2:          NOTRUN -> [SKIP][583] ([i915#15232])
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@kms_sharpness_filter@invalid-filter-with-scaler.html
    - shard-dg1:          NOTRUN -> [SKIP][584] ([i915#15232])
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-15/igt@kms_sharpness_filter@invalid-filter-with-scaler.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][585] ([i915#15232])
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-7/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][586] ([i915#8623])
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          NOTRUN -> [SKIP][587] ([i915#3555] / [i915#9906])
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@kms_vrr@negative-basic.html
    - shard-tglu-1:       NOTRUN -> [SKIP][588] ([i915#3555] / [i915#9906])
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-rkl:          NOTRUN -> [SKIP][589] ([i915#9906])
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-8/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglu:         NOTRUN -> [SKIP][590] ([i915#2437])
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-2/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-rkl:          NOTRUN -> [SKIP][591] ([i915#2437])
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][592] ([i915#2437] / [i915#9412]) +1 other test skip
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@perf@non-zero-reason:
    - shard-dg2:          NOTRUN -> [FAIL][593] ([i915#9100]) +1 other test fail
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-4/igt@perf@non-zero-reason.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][594] ([i915#2435])
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-5/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@event-wait:
    - shard-mtlp:         NOTRUN -> [SKIP][595] ([i915#8807])
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-4/igt@perf_pmu@event-wait.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][596] ([i915#3555] / [i915#8807])
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-4/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@module-unload:
    - shard-tglu-1:       NOTRUN -> [FAIL][597] ([i915#14433])
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [PASS][598] -> [FAIL][599] ([i915#4349]) +1 other test fail
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@perf_pmu@rc6-suspend:
    - shard-rkl:          [PASS][600] -> [ABORT][601] ([i915#15131])
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-5/igt@perf_pmu@rc6-suspend.html
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@perf_pmu@rc6-suspend.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-rkl:          [PASS][602] -> [SKIP][603] ([i915#14544] / [i915#3708])
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-4/igt@prime_vgem@basic-fence-flip.html
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@prime_vgem@basic-fence-flip.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-rkl:          NOTRUN -> [SKIP][604] ([i915#9917])
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-7/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg2:          NOTRUN -> [SKIP][605] ([i915#9917])
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@sysfs_preempt_timeout@invalid:
    - shard-tglu:         [PASS][606] -> [SKIP][607] ([i915#2575]) +63 other tests skip
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-5/igt@sysfs_preempt_timeout@invalid.html
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@sysfs_preempt_timeout@invalid.html

  * igt@vgem_basic@dmabuf-export:
    - shard-rkl:          [PASS][608] -> [DMESG-WARN][609] ([i915#12964]) +32 other tests dmesg-warn
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-4/igt@vgem_basic@dmabuf-export.html
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@vgem_basic@dmabuf-export.html

  
#### Possible fixes ####

  * igt@fbdev@write:
    - shard-rkl:          [SKIP][610] ([i915#14544] / [i915#2582]) -> [PASS][611]
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@fbdev@write.html
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-5/igt@fbdev@write.html

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          [ABORT][612] ([i915#15131]) -> [PASS][613] +2 other tests pass
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-4/igt@gem_eio@in-flight-suspend.html
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [INCOMPLETE][614] ([i915#13356]) -> [PASS][615] +1 other test pass
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-7/igt@gem_exec_suspend@basic-s0@smem.html
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-7/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         [ABORT][616] ([i915#14809]) -> [PASS][617] +1 other test pass
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-6/igt@gem_mmap_offset@clear-via-pagefault.html
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-3/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-rkl:          [SKIP][618] ([i915#14544] / [i915#4270]) -> [PASS][619]
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-rkl:          [TIMEOUT][620] ([i915#12917] / [i915#12964]) -> [PASS][621]
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-5/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-8/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-snb:          [ABORT][622] ([i915#14849]) -> [PASS][623]
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-snb6/igt@gem_workarounds@suspend-resume-fd.html
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-snb1/igt@gem_workarounds@suspend-resume-fd.html
    - shard-tglu:         [ABORT][624] ([i915#14849]) -> [PASS][625]
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-3/igt@gem_workarounds@suspend-resume-fd.html
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@kms_addfb_basic@no-handle:
    - shard-dg1:          [DMESG-WARN][626] ([i915#4391] / [i915#4423]) -> [PASS][627]
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-19/igt@kms_addfb_basic@no-handle.html
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-12/igt@kms_addfb_basic@no-handle.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg2:          [FAIL][628] ([i915#5956]) -> [PASS][629] +1 other test pass
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-rkl:          [FAIL][630] ([i915#13566]) -> [PASS][631]
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_edge_walk@64x64-left-edge:
    - shard-rkl:          [SKIP][632] ([i915#14544]) -> [PASS][633] +23 other tests pass
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_cursor_edge_walk@64x64-left-edge.html
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-8/igt@kms_cursor_edge_walk@64x64-left-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-rkl:          [DMESG-WARN][634] ([i915#12964]) -> [PASS][635] +28 other tests pass
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:
    - shard-mtlp:         [ABORT][636] ([i915#13562]) -> [PASS][637]
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-7/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-snb:          [TIMEOUT][638] ([i915#14033] / [i915#14350]) -> [PASS][639]
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-snb4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-snb1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [TIMEOUT][640] ([i915#14033]) -> [PASS][641]
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-snb4/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-snb1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-dpms-on-nop:
    - shard-rkl:          [SKIP][642] ([i915#14544] / [i915#14553]) -> [PASS][643]
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_flip@flip-vs-dpms-on-nop.html
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_flip@flip-vs-dpms-on-nop.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          [SKIP][644] ([i915#14544] / [i915#3637]) -> [PASS][645]
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-rkl:          [SKIP][646] ([i915#14544] / [i915#3555]) -> [PASS][647] +1 other test pass
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          [FAIL][648] ([i915#6880]) -> [PASS][649]
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
    - shard-rkl:          [SKIP][650] ([i915#14544] / [i915#1849] / [i915#5354]) -> [PASS][651] +7 other tests pass
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          [SKIP][652] ([i915#3555] / [i915#8228]) -> [PASS][653]
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-8/igt@kms_hdr@static-toggle-suspend.html
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@uint-max-clock:
    - shard-rkl:          [SKIP][654] ([i915#14544] / [i915#3555] / [i915#8826]) -> [PASS][655]
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_invalid_mode@uint-max-clock.html
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_invalid_mode@uint-max-clock.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-dg1:          [DMESG-WARN][656] ([i915#4423]) -> [PASS][657]
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-13/igt@kms_plane_alpha_blend@alpha-transparent-fb.html
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-13/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          [SKIP][658] ([i915#6953] / [i915#9423]) -> [PASS][659]
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-7/igt@kms_plane_scaling@intel-max-src-size.html
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-rkl:          [SKIP][660] ([i915#14544] / [i915#3555] / [i915#8152]) -> [PASS][661]
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
    - shard-rkl:          [SKIP][662] ([i915#12247] / [i915#14544]) -> [PASS][663] +2 other tests pass
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-rkl:          [SKIP][664] ([i915#12247] / [i915#14544] / [i915#6953] / [i915#8152]) -> [PASS][665]
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b:
    - shard-rkl:          [SKIP][666] ([i915#12247] / [i915#14544] / [i915#8152]) -> [PASS][667] +3 other tests pass
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b.html
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [SKIP][668] ([i915#15073]) -> [PASS][669]
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-rkl:          [SKIP][670] ([i915#15073]) -> [PASS][671]
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-4/igt@kms_pm_rpm@dpms-non-lpsp.html
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-5/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-mtlp:         [FAIL][672] ([i915#4349]) -> [PASS][673]
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-5/igt@perf_pmu@busy-double-start@ccs0.html
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-5/igt@perf_pmu@busy-double-start@ccs0.html

  
#### Warnings ####

  * igt@api_intel_bb@crc32:
    - shard-rkl:          [SKIP][674] ([i915#6230]) -> [SKIP][675] ([i915#14544] / [i915#6230])
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-2/igt@api_intel_bb@crc32.html
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          [SKIP][676] ([i915#8411]) -> [SKIP][677] ([i915#14544] / [i915#8411]) +2 other tests skip
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-7/igt@api_intel_bb@object-reloc-keep-cache.html
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-rkl:          [SKIP][678] ([i915#14544] / [i915#8411]) -> [SKIP][679] ([i915#8411])
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          [SKIP][680] ([i915#11078] / [i915#14544]) -> [SKIP][681] ([i915#11078])
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-7/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          [SKIP][682] ([i915#14544] / [i915#9323]) -> [SKIP][683] ([i915#9323])
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-3/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu:         [SKIP][684] ([i915#9323]) -> [SKIP][685] ([i915#2575])
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-6/igt@gem_ccs@block-multicopy-compressed.html
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          [SKIP][686] ([i915#3555] / [i915#9323]) -> [SKIP][687] ([i915#14544] / [i915#3555] / [i915#9323])
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy.html
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          [SKIP][688] ([i915#9323]) -> [SKIP][689] ([i915#14544] / [i915#9323])
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-7/igt@gem_ccs@suspend-resume.html
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_ccs@suspend-resume.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          [SKIP][690] ([i915#6335]) -> [SKIP][691] ([i915#14544] / [i915#6335]) +1 other test skip
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-5/igt@gem_create@create-ext-cpu-access-sanity-check.html
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          [SKIP][692] ([i915#14544] / [i915#8562]) -> [SKIP][693] ([i915#8562])
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@gem_create@create-ext-set-pat.html
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          [SKIP][694] ([i915#280]) -> [SKIP][695] ([i915#14544] / [i915#280])
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-7/igt@gem_ctx_sseu@engines.html
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          [SKIP][696] ([i915#4525]) -> [SKIP][697] ([i915#14544] / [i915#4525]) +2 other tests skip
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-8/igt@gem_exec_balancer@parallel-balancer.html
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-rkl:          [SKIP][698] ([i915#3281]) -> [SKIP][699] ([i915#14544] / [i915#3281]) +11 other tests skip
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-2/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
    - shard-rkl:          [SKIP][700] ([i915#14544] / [i915#3281]) -> [SKIP][701] ([i915#3281]) +3 other tests skip
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          [SKIP][702] ([i915#7276]) -> [SKIP][703] ([i915#14544] / [i915#7276])
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-8/igt@gem_exec_schedule@semaphore-power.html
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          [SKIP][704] ([i915#4613]) -> [SKIP][705] ([i915#14544] / [i915#4613]) +4 other tests skip
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify.html
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-rkl:          [SKIP][706] ([i915#14544] / [i915#4613]) -> [SKIP][707] ([i915#4613])
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          [SKIP][708] ([i915#3282]) -> [SKIP][709] ([i915#14544] / [i915#3282]) +11 other tests skip
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          [SKIP][710] ([i915#14544] / [i915#3282]) -> [SKIP][711] ([i915#3282]) +3 other tests skip
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@gem_pwrite@basic-exhaustion.html
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          [SKIP][712] ([i915#13717]) -> [TIMEOUT][713] ([i915#12917] / [i915#12964])
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-context.html
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-rkl:          [TIMEOUT][714] ([i915#12917] / [i915#12964]) -> [SKIP][715] ([i915#14544] / [i915#4270])
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@gem_pxp@reject-modify-context-protection-off-3.html
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          [SKIP][716] ([i915#3297] / [i915#3323]) -> [SKIP][717] ([i915#14544] / [i915#3297] / [i915#3323])
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.html
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          [SKIP][718] ([i915#3282] / [i915#3297]) -> [SKIP][719] ([i915#14544] / [i915#3282] / [i915#3297])
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-5/igt@gem_userptr_blits@forbidden-operations.html
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-rkl:          [SKIP][720] ([i915#14544] / [i915#3297]) -> [SKIP][721] ([i915#3297])
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@gem_userptr_blits@readonly-unsync.html
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-8/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-rkl:          [SKIP][722] ([i915#3281] / [i915#3297]) -> [SKIP][723] ([i915#14544] / [i915#3281] / [i915#3297])
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-8/igt@gem_userptr_blits@relocations.html
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          [SKIP][724] ([i915#3297]) -> [SKIP][725] ([i915#14544] / [i915#3297]) +1 other test skip
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-after-close.html
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-rkl:          [SKIP][726] -> [SKIP][727] ([i915#14544]) +27 other tests skip
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-7/igt@gen7_exec_parse@chained-batch.html
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          [SKIP][728] ([i915#14544] / [i915#2527]) -> [SKIP][729] ([i915#2527]) +1 other test skip
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@gen9_exec_parse@bb-chained.html
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-rkl:          [SKIP][730] ([i915#2527]) -> [SKIP][731] ([i915#14544] / [i915#2527]) +4 other tests skip
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-7/igt@gen9_exec_parse@unaligned-access.html
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          [SKIP][732] ([i915#8399]) -> [SKIP][733] ([i915#14544] / [i915#8399])
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-2/igt@i915_pm_freq_api@freq-reset.html
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          [SKIP][734] ([i915#14544] / [i915#8399]) -> [SKIP][735] ([i915#8399])
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@i915_pm_freq_api@freq-reset-multiple.html
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-5/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          [SKIP][736] ([i915#14544] / [i915#6590]) -> [SKIP][737] ([i915#6590]) +1 other test skip
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@i915_pm_freq_mult@media-freq@gt0.html
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_power@sanity:
    - shard-rkl:          [SKIP][738] ([i915#7984]) -> [SKIP][739] ([i915#14544] / [i915#7984])
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-7/igt@i915_power@sanity.html
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-rkl:          [SKIP][740] ([i915#6245]) -> [SKIP][741] ([i915#14544] / [i915#6245])
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-3/igt@i915_query@hwconfig_table.html
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@i915_query@hwconfig_table.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          [SKIP][742] ([i915#7707]) -> [SKIP][743] ([i915#14544] / [i915#7707])
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-7/igt@intel_hwmon@hwmon-read.html
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@intel_hwmon@hwmon-read.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          [SKIP][744] ([i915#5286]) -> [SKIP][745] ([i915#14544]) +9 other tests skip
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-dg1:          [SKIP][746] ([i915#4423] / [i915#4538] / [i915#5286]) -> [SKIP][747] ([i915#4538] / [i915#5286])
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-17/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-19/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-tglu:         [SKIP][748] ([i915#5286]) -> [SKIP][749] ([i915#2575])
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][750] ([i915#14544]) -> [SKIP][751] ([i915#5286]) +2 other tests skip
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          [SKIP][752] ([i915#3638]) -> [SKIP][753] ([i915#14544]) +6 other tests skip
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][754] ([i915#12313]) -> [SKIP][755] ([i915#14544]) +2 other tests skip
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-rkl:          [SKIP][756] ([i915#14544]) -> [SKIP][757] ([i915#14098] / [i915#6095]) +5 other tests skip
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu:         [SKIP][758] ([i915#6095]) -> [SKIP][759] ([i915#2575])
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][760] ([i915#12805]) -> [SKIP][761] ([i915#14544])
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-rkl:          [INCOMPLETE][762] ([i915#12796]) -> [ABORT][763] ([i915#15132])
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-rkl:          [SKIP][764] ([i915#14098] / [i915#6095]) -> [SKIP][765] ([i915#14544]) +13 other tests skip
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][766] ([i915#6095]) -> [SKIP][767] ([i915#14098] / [i915#6095])
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-b-hdmi-a-2.html
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-rkl:          [SKIP][768] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][769] ([i915#11151] / [i915#7828])
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-dg1:          [SKIP][770] ([i915#11151] / [i915#7828]) -> [SKIP][771] ([i915#11151] / [i915#4423] / [i915#7828])
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-15/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-rkl:          [SKIP][772] ([i915#11151] / [i915#7828]) -> [SKIP][773] ([i915#11151] / [i915#14544] / [i915#7828]) +10 other tests skip
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-dg1:          [SKIP][774] ([i915#11151] / [i915#4423] / [i915#7828]) -> [SKIP][775] ([i915#11151] / [i915#7828])
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-13/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-16/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-tglu:         [SKIP][776] ([i915#11151] / [i915#7828]) -> [SKIP][777] ([i915#2575]) +1 other test skip
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-7/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@lic-type-0:
    - shard-rkl:          [SKIP][778] ([i915#9424]) -> [SKIP][779] ([i915#14544])
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-4/igt@kms_content_protection@lic-type-0.html
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          [SKIP][780] ([i915#14544]) -> [SKIP][781] ([i915#7118])
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_content_protection@srm.html
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-rkl:          [SKIP][782] ([i915#14544]) -> [SKIP][783] ([i915#3555])
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-rkl:          [DMESG-FAIL][784] ([i915#12964]) -> [DMESG-WARN][785] ([i915#12964])
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-5/igt@kms_cursor_crc@cursor-random-128x42.html
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          [SKIP][786] ([i915#13049]) -> [SKIP][787] ([i915#14544]) +3 other tests skip
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x512.html
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          [SKIP][788] ([i915#3555]) -> [SKIP][789] ([i915#14544]) +2 other tests skip
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          [SKIP][790] ([i915#14544]) -> [SKIP][791] ([i915#13049])
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          [SKIP][792] ([i915#4103]) -> [SKIP][793] ([i915#11190] / [i915#14544])
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-rkl:          [SKIP][794] ([i915#14544]) -> [SKIP][795] +6 other tests skip
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu:         [SKIP][796] ([i915#4103]) -> [SKIP][797] ([i915#2575])
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          [SKIP][798] ([i915#3555] / [i915#3804]) -> [SKIP][799] ([i915#14544])
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [799]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_aux_dev:
    - shard-rkl:          [SKIP][800] ([i915#1257] / [i915#14544]) -> [SKIP][801] ([i915#1257])
   [800]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_dp_aux_dev.html
   [801]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-rkl:          [SKIP][802] ([i915#13749]) -> [SKIP][803] ([i915#14544])
   [802]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-2/igt@kms_dp_link_training@non-uhbr-sst.html
   [803]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-rkl:          [SKIP][804] ([i915#13748]) -> [SKIP][805] ([i915#14544])
   [804]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-8/igt@kms_dp_link_training@uhbr-mst.html
   [805]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-rkl:          [SKIP][806] ([i915#13707]) -> [SKIP][807] ([i915#14544]) +1 other test skip
   [806]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-4/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [807]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-pwrite:
    - shard-rkl:          [SKIP][808] ([i915#14544]) -> [DMESG-WARN][809] ([i915#12964]) +1 other test dmesg-warn
   [808]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_draw_crc@draw-method-pwrite.html
   [809]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_draw_crc@draw-method-pwrite.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          [SKIP][810] ([i915#14544]) -> [SKIP][811] ([i915#3840])
   [810]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html
   [811]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu:         [SKIP][812] ([i915#3840] / [i915#9053]) -> [SKIP][813] ([i915#2575])
   [812]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [813]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][814] ([i915#14544] / [i915#3955]) -> [SKIP][815] ([i915#3955])
   [814]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html
   [815]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-rkl:          [SKIP][816] ([i915#4854]) -> [SKIP][817] ([i915#14544] / [i915#4854])
   [816]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-5/igt@kms_feature_discovery@chamelium.html
   [817]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr2:
    - shard-rkl:          [SKIP][818] ([i915#658]) -> [SKIP][819] ([i915#14544] / [i915#658])
   [818]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-7/igt@kms_feature_discovery@psr2.html
   [819]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          [SKIP][820] ([i915#14544] / [i915#9934]) -> [SKIP][821] ([i915#9934]) +3 other tests skip
   [820]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms.html
   [821]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-tglu:         [SKIP][822] ([i915#3637] / [i915#9934]) -> [SKIP][823] ([i915#2575]) +2 other tests skip
   [822]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-9/igt@kms_flip@2x-plain-flip-ts-check.html
   [823]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-rkl:          [SKIP][824] ([i915#9934]) -> [SKIP][825] ([i915#14544] / [i915#9934]) +10 other tests skip
   [824]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [825]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          [INCOMPLETE][826] ([i915#6113]) -> [SKIP][827] ([i915#14544] / [i915#3637])
   [826]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-8/igt@kms_flip@flip-vs-suspend.html
   [827]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          [SKIP][828] ([i915#2672] / [i915#3555]) -> [SKIP][829] ([i915#14544] / [i915#3555]) +4 other tests skip
   [828]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [829]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-tglu:         [SKIP][830] ([i915#2672] / [i915#3555]) -> [SKIP][831] ([i915#2575]) +2 other tests skip
   [830]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [831]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-rkl:          [SKIP][832] ([i915#14544] / [i915#3555]) -> [SKIP][833] ([i915#2672] / [i915#3555])
   [832]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
   [833]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu:
    - shard-rkl:          [DMESG-WARN][834] ([i915#12964]) -> [SKIP][835] ([i915#14544]) +1 other test skip
   [834]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu.html
   [835]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-tglu:         [SKIP][836] -> [SKIP][837] ([i915#2575]) +16 other tests skip
   [836]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [837]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][838] ([i915#15102]) -> [SKIP][839] ([i915#14544]) +3 other tests skip
   [838]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
   [839]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-rkl:          [SKIP][840] ([i915#14544]) -> [SKIP][841] ([i915#15102]) +2 other tests skip
   [840]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
   [841]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-tglu:         [SKIP][842] ([i915#15102]) -> [SKIP][843] ([i915#2575]) +2 other tests skip
   [842]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [843]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-rkl:          [SKIP][844] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][845] ([i915#15102] / [i915#3023]) +9 other tests skip
   [844]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
   [845]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][846] -> [SKIP][847] ([i915#14544] / [i915#1849] / [i915#5354]) +1 other test skip
   [846]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html
   [847]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][848] ([i915#1825]) -> [SKIP][849] ([i915#14544] / [i915#1849] / [i915#5354]) +51 other tests skip
   [848]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
   [849]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][850] ([i915#10433] / [i915#15102] / [i915#3458]) -> [SKIP][851] ([i915#15102] / [i915#3458]) +3 other tests skip
   [850]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [851]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-rkl:          [SKIP][852] ([i915#15102] / [i915#3023]) -> [SKIP][853] ([i915#14544] / [i915#1849] / [i915#5354]) +22 other tests skip
   [852]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html
   [853]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html
    - shard-dg1:          [SKIP][854] ([i915#15102] / [i915#3458] / [i915#4423]) -> [SKIP][855] ([i915#15102] / [i915#3458])
   [854]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html
   [855]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-dg1:          [SKIP][856] ([i915#4423]) -> [SKIP][857]
   [856]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html
   [857]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-rkl:          [SKIP][858] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][859] ([i915#1825]) +12 other tests skip
   [858]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html
   [859]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          [SKIP][860] ([i915#3555] / [i915#8228]) -> [SKIP][861] ([i915#14544]) +2 other tests skip
   [860]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-2/igt@kms_hdr@bpc-switch-dpms.html
   [861]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          [SKIP][862] ([i915#12713]) -> [SKIP][863] ([i915#14544])
   [862]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-4/igt@kms_hdr@brightness-with-hdr.html
   [863]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          [SKIP][864] ([i915#10656]) -> [SKIP][865] ([i915#10656] / [i915#14544])
   [864]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-3/igt@kms_joiner@basic-big-joiner.html
   [865]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          [SKIP][866] ([i915#10656] / [i915#14544]) -> [SKIP][867] ([i915#10656])
   [866]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_joiner@invalid-modeset-big-joiner.html
   [867]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          [SKIP][868] ([i915#10656] / [i915#12388]) -> [SKIP][869] ([i915#10656] / [i915#12388] / [i915#14544])
   [868]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [869]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-rkl:          [SKIP][870] ([i915#12339]) -> [SKIP][871] ([i915#12339] / [i915#14544])
   [870]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [871]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][872] ([i915#4070] / [i915#4816]) -> [SKIP][873] ([i915#14544] / [i915#4070] / [i915#4816])
   [872]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [873]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-rkl:          [SKIP][874] ([i915#14544]) -> [SKIP][875] ([i915#14712])
   [874]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [875]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@plane-position-hole-dpms:
    - shard-rkl:          [DMESG-WARN][876] ([i915#12964]) -> [SKIP][877] ([i915#14544] / [i915#8825])
   [876]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-2/igt@kms_plane@plane-position-hole-dpms.html
   [877]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane@plane-position-hole-dpms.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-rkl:          [SKIP][878] ([i915#13958]) -> [SKIP][879] ([i915#14544])
   [878]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-5/igt@kms_plane_multiple@2x-tiling-4.html
   [879]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          [SKIP][880] ([i915#14259]) -> [SKIP][881] ([i915#14544])
   [880]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-8/igt@kms_plane_multiple@tiling-yf.html
   [881]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-tglu:         [SKIP][882] ([i915#12247]) -> [SKIP][883] ([i915#2575])
   [882]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
   [883]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:
    - shard-rkl:          [SKIP][884] ([i915#12247]) -> [SKIP][885] ([i915#12247] / [i915#14544])
   [884]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html
   [885]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-rkl:          [SKIP][886] ([i915#12247]) -> [SKIP][887] ([i915#12247] / [i915#14544] / [i915#8152]) +1 other test skip
   [886]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html
   [887]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          [SKIP][888] ([i915#5354]) -> [SKIP][889] ([i915#14544] / [i915#5354]) +1 other test skip
   [888]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-2/igt@kms_pm_backlight@bad-brightness.html
   [889]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg1:          [SKIP][890] ([i915#12343] / [i915#4423]) -> [SKIP][891] ([i915#12343])
   [890]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-17/igt@kms_pm_backlight@brightness-with-dpms.html
   [891]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-17/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [FAIL][892] ([i915#9295]) -> [SKIP][893] ([i915#15128])
   [892]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html
   [893]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-rkl:          [DMESG-WARN][894] ([i915#12964]) -> [SKIP][895] ([i915#12916] / [i915#14544])
   [894]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-5/igt@kms_pm_rpm@basic-pci-d3-state.html
   [895]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [SKIP][896] ([i915#14544] / [i915#15073]) -> [SKIP][897] ([i915#15073])
   [896]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp.html
   [897]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          [SKIP][898] ([i915#6524]) -> [SKIP][899] ([i915#14544] / [i915#6524])
   [898]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-2/igt@kms_prime@d3hot.html
   [899]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg1:          [SKIP][900] ([i915#11520] / [i915#4423]) -> [SKIP][901] ([i915#11520])
   [900]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-15/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [901]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-16/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-tglu:         [SKIP][902] ([i915#11520]) -> [SKIP][903] ([i915#2575]) +1 other test skip
   [902]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-10/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
   [903]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][904] ([i915#11520]) -> [SKIP][905] ([i915#11520] / [i915#14544]) +13 other tests skip
   [904]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
   [905]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          [SKIP][906] ([i915#11520] / [i915#14544]) -> [SKIP][907] ([i915#11520]) +5 other tests skip
   [906]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [907]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-rkl:          [SKIP][908] ([i915#9683]) -> [SKIP][909] ([i915#14544] / [i915#9683])
   [908]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [909]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-rkl:          [SKIP][910] ([i915#14544] / [i915#9683]) -> [SKIP][911] ([i915#9683])
   [910]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_psr2_su@page_flip-nv12.html
   [911]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-rkl:          [SKIP][912] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][913] ([i915#1072] / [i915#9732]) +7 other tests skip
   [912]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_psr@fbc-psr-primary-blt.html
   [913]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@fbc-psr2-primary-mmap-gtt:
    - shard-tglu:         [SKIP][914] ([i915#9732]) -> [SKIP][915] ([i915#2575]) +3 other tests skip
   [914]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-10/igt@kms_psr@fbc-psr2-primary-mmap-gtt.html
   [915]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_psr@fbc-psr2-primary-mmap-gtt.html

  * igt@kms_psr@pr-cursor-mmap-cpu:
    - shard-dg1:          [SKIP][916] ([i915#1072] / [i915#9732]) -> [SKIP][917] ([i915#1072] / [i915#4423] / [i915#9732])
   [916]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-16/igt@kms_psr@pr-cursor-mmap-cpu.html
   [917]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-12/igt@kms_psr@pr-cursor-mmap-cpu.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          [SKIP][918] ([i915#1072] / [i915#9732]) -> [SKIP][919] ([i915#1072] / [i915#14544] / [i915#9732]) +30 other tests skip
   [918]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-7/igt@kms_psr@psr2-cursor-mmap-gtt.html
   [919]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          [SKIP][920] ([i915#14544] / [i915#9685]) -> [SKIP][921] ([i915#9685]) +1 other test skip
   [920]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [921]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglu:         [SKIP][922] ([i915#5289]) -> [SKIP][923] ([i915#2575]) +1 other test skip
   [922]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [923]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-rkl:          [SKIP][924] ([i915#3555]) -> [SKIP][925] ([i915#14544] / [i915#3555]) +2 other tests skip
   [924]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-8/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [925]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - shard-rkl:          [SKIP][926] ([i915#15232]) -> [SKIP][927] ([i915#14544]) +3 other tests skip
   [926]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-7/igt@kms_sharpness_filter@filter-scaler-downscale.html
   [927]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_sharpness_filter@filter-scaler-downscale.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-tglu:         [SKIP][928] ([i915#15232]) -> [SKIP][929] ([i915#2575])
   [928]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-7/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
   [929]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_vrr@flipline:
    - shard-rkl:          [SKIP][930] ([i915#15243] / [i915#3555]) -> [SKIP][931] ([i915#14544]) +1 other test skip
   [930]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-5/igt@kms_vrr@flipline.html
   [931]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          [SKIP][932] ([i915#11920]) -> [SKIP][933] ([i915#14544])
   [932]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-2/igt@kms_vrr@lobf.html
   [933]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-rkl:          [SKIP][934] ([i915#2437]) -> [SKIP][935] ([i915#14544] / [i915#2437])
   [934]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-2/igt@kms_writeback@writeback-invalid-parameters.html
   [935]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-rkl:          [SKIP][936] ([i915#14544] / [i915#2437] / [i915#9412]) -> [SKIP][937] ([i915#2437] / [i915#9412])
   [936]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@kms_writeback@writeback-pixel-formats.html
   [937]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          [SKIP][938] ([i915#2436]) -> [SKIP][939] ([i915#14544] / [i915#2436])
   [938]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-7/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [939]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-rkl:          [SKIP][940] ([i915#8516]) -> [SKIP][941] ([i915#14544] / [i915#8516])
   [940]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-5/igt@perf_pmu@rc6-all-gts.html
   [941]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          [SKIP][942] ([i915#3291] / [i915#3708]) -> [SKIP][943] ([i915#14544] / [i915#3291] / [i915#3708]) +1 other test skip
   [942]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-5/igt@prime_vgem@basic-write.html
   [943]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          [SKIP][944] ([i915#14544] / [i915#3708]) -> [SKIP][945] ([i915#3708])
   [944]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html
   [945]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-3/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-rkl:          [SKIP][946] ([i915#3708]) -> [SKIP][947] ([i915#14544] / [i915#3708])
   [946]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-8/igt@prime_vgem@fence-read-hang.html
   [947]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-rkl:          [SKIP][948] ([i915#9917]) -> [SKIP][949] ([i915#14544] / [i915#9917])
   [948]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-rkl-8/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [949]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-on.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12392]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12916]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12916
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522
  [i915#13562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13783]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783
  [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14350]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14350
  [i915#14433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14553
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14785]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14785
  [i915#14809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14809
  [i915#14849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14849
  [i915#15060]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15060
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15095
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15106]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106
  [i915#15128]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15128
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15232]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15277]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15277
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#4070]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6188]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6188
  [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7162]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7162
  [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
  [i915#7294]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8807]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8807
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#8826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826
  [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
  [i915#9100]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100
  [i915#9295]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
  [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9581]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9581
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
  [i915#9979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8632 -> IGTPW_14079

  CI-20190529: 20190529
  CI_DRM_17565: b603326a067916accf680fd623f4fc3c22bba487 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14079: b2a8f975bbd5430a29e6007179fd6b4764528f52 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8632: bbd6b1e5161ad8d244042f4a0d9fefcd575ccf67 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/index.html

--===============8918139673317088444==
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
<tr><td><b>Series:</b></td><td>Switch to use kernel standard fault injectio=
n in i915 (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/155764/">https://patchwork.freedesktop.org/series/155764/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14079/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14079/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8632_full -&gt; IGTPW_14079_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14079_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_14079_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/index=
.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1407=
9_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_drm_fdinfo@memory-info-resident:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-tglu-4/igt@i915_drm_fdinfo@memory-info-resident.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/s=
hard-tglu-5/igt@i915_drm_fdinfo@memory-info-resident.html">SKIP</a> +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@i915_driver_mmio_probe (NEW):</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@i915_module_load@fault-injection=
@i915_driver_mmio_probe.html">FAIL</a> +5 other tests fail</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-glk6/igt@i915_module_load@fault-injection@i=
915_driver_mmio_probe.html">FAIL</a> +5 other tests fail</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-4/igt@i915_module_load@fault-injection=
@i915_driver_mmio_probe.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register (NEW):</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@i915_module_load@fault-injection@=
intel_connector_register.html">FAIL</a> +3 other tests fail</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-snb7/igt@i915_module_load@fault-injection@i=
ntel_connector_register.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@i915_module_load@fault-injection@intel_gt_init-enodev} (NEW):</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@i915_module_load@fault-injection@=
intel_gt_init-enodev.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@i915_module_load@fault-injection@uc_fw_rsa_data_create} (NEW):</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@i915_module_load@fault-injection=
@uc_fw_rsa_data_create.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-15/igt@runner@aborted.html">FAIL</a></l=
i>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_addfb_basic@tile-pitch-mismatch:<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-mtlp-8/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212=
">i915#4212</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14079/shard-mtlp-4/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP=
</a></li>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg2-7/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212"=
>i915#4212</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14079/shard-dg2-1/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</=
a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8632_full and IGTPW_14079_ful=
l:</p>
<h3>New IGT tests (12)</h3>
<ul>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s) 5 fail(s)</li>
<li>Exec time: [60.29, 82.83] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__fw_domain_init:</p>
<ul>
<li>Statuses : 2 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>Statuses : 2 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.61] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@i915_driver_early_probe:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@i915_driver_hw_probe:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@i915_driver_mmio_probe:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s) 5 fail(s)</li>
<li>Exec time: [0.00, 22.80] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@i915_pci_probe:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_gt_init-enodev:</p>
<ul>
<li>Statuses : 2 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_guc_ct_init:</p>
<ul>
<li>Statuses : 2 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@uc_fw_rsa_data_create:</p>
<ul>
<li>Statuses : 2 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14079_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@api_intel_bb@crc32.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230"=
>i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-19/igt@device_reset@cold-reset-bound.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11078">i915#11078</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-7/igt@device_reset@cold-reset-bound.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11078">i915#11078</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-3/igt@device_reset@cold-reset-bound.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11078">i915#11078</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-6/igt@device_reset@cold-reset-bound.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/11078">i915#11078</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@device_reset@cold-reset-bound.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_buddy@drm_buddy:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-glk10/igt@drm_buddy@drm_buddy.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15095">i915#15095</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-2/igt@fbdev@info.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@fbdev@info.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_basic@multigpu-create-close.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_ccs@block-copy-compressed.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg2-8/igt@gem_ccs@suspend-resume.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@=
gem_ccs@suspend-resume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg2-8/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0=
-smem-lmem0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14079/shard-dg2-1/igt@gem_ccs@suspend-resume@xmajor-compres=
sed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/12392">i915#12392</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>=
)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@gem_close_race@multigpu-basic-thr=
eads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-cl=
ose.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8555">i915#8555</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-cl=
ose.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-snb5/igt@gem_ctx_persistence@legacy-engines=
-queued.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/1099">i915#1099</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-4/igt@gem_ctx_sseu@invalid-sseu.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/280">i915#280</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@gem_ctx_sseu@invalid-sseu.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/280">i915#280</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-14/igt@gem_ctx_sseu@invalid-sseu.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-2/igt@gem_ctx_sseu@invalid-sseu.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-3/igt@gem_ctx_sseu@invalid-sseu.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-19/igt@gem_exec_balancer@bonded-false-h=
ang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@gem_exec_balancer@parallel-out-f=
ence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-10/igt@gem_exec_big@single.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
713">i915#11713</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@gem_exec_capture@capture-invisib=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@concurrent:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@gem_exec_fence@concurrent.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4812">i915#4812</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-5/igt@gem_exec_fence@concurrent.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-5/igt@gem_exec_flush@basic-wb-pro-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-16/igt@gem_exec_flush@basic-wb-pro-defa=
ult.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-19/igt@gem_exec_reloc@basic-concurrent0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@gem_exec_reloc@basic-wc-gtt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-3/igt@gem_exec_reloc@basic-write-cpu-n=
oreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@gem_exec_reloc@basic-write-gtt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-n=
oreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-=
chain.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-6/igt@gem_fenced_exec_thrash@no-spare-=
fences-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-7/igt@gem_fenced_exec_thrash@no-spare-f=
ences-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-ra=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@gem_lmem_swapping@heavy-multi.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-m=
ulti.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-glk6/igt@gem_lmem_swapping@parallel-random-=
verify.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-9/igt@gem_lmem_swapping@parallel-rando=
m-verify-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@gem_mmap_gtt@coherency.html">SKI=
P</a> +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-17/igt@gem_mmap_gtt@cpuset-basic-small-=
copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@gem_mmap_gtt@cpuset-medium-copy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4077">i915#4077</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@gem_mmap_wc@write.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">=
i915#4083</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-12/igt@gem_mmap_wc@write.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">=
i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-prefaulted:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-8/igt@gem_mmap_wc@write-prefaulted.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4083">i915#4083</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-12/igt@gem_partial_pwrite_pread@write.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-a=
fter-reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_pread@uncached.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-8/igt@gem_pxp@create-protected-buffer.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-r=
kl-6/igt@gem_pxp@create-protected-buffer.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915=
#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_pxp@create-regular-buffer.htm=
l">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12917">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12964">i915#12964</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-8/igt@gem_pxp@create-regular-context-2.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-=
rkl-6/igt@gem_pxp@create-regular-context-2.html">TIMEOUT</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964=
">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-13/igt@gem_pxp@create-valid-protected-c=
ontext.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4270">i915#4270</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@gem_pxp@hw-rejects-pxp-buffer.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13398">i915#13398</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_pxp@regular-baseline-src-copy=
-readible.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12964">i915#12964</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-7/igt@gem_pxp@reject-modify-context-pro=
tection-off-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4270">i915#4270</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-8/igt@gem_render_copy@y-tiled-ccs-to-yf=
-tiled-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-17/igt@gem_render_tiled_blits@basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4079">i915#4079</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@gem_render_tiled_blits@basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-14/igt@gem_softpin@evict-snoop.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4885">i915#4885</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-5/igt@gem_softpin@evict-snoop.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4885">i915#4885</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-5/igt@gem_softpin@evict-snoop.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-6/igt@gem_tiled_swapping@non-threaded.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4077">i915#4077</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-4/igt@gem_userptr_blits@access-control=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-8/igt@gem_userptr_blits@coherency-sync.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-5/igt@gem_userptr_blits@coherency-unsyn=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@gem_userptr_blits@dmabuf-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@gen9_exec_parse@allowed-all.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-8/igt@gen9_exec_parse@basic-rejected-c=
tx-param.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gen9_exec_parse@batch-zero-length=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@gen9_exec_parse@shadow-peek.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2856">i915#2856</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@gen9_exec_parse@shadow-peek.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2527">i915#2527</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-18/igt@gen9_exec_parse@shadow-peek.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@bcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-16/igt@i915_drm_fdinfo@isolation@bcs0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14073">i915#14073</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@i915_drm_fdinfo@isolation@rcs0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14073">i915#14073</a>) +6 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-5/igt@i915_drm_fdinfo@isolation@rcs0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14073">i915#14073</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@i915_drm_fdinfo@virtual-busy-hang=
-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14118">i915#14118</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-19/igt@i915_drm_fdinfo@virtual-busy-han=
g-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection (NEW):</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@i915_module_load@fault-injection.=
html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/12964">i915#12964</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>{igt@i915_module_load@fault-injection@intel_guc_ct_init} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-snb7/igt@i915_module_load@fault-injection@i=
ntel_guc_ct_init.html">SKIP</a> +90 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-tglu-1:       (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8632/shard-tglu-1/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-1/igt@i915=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_8632/shard-tglu-1/igt@i915_module_load@load.html">PASS</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shar=
d-tglu-1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@i915_module_load@l=
oad.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14785">i915#14785</a>)</li>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8632/shard-dg1-16/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-15/igt@i915=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_8632/shard-dg1-14/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-12/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGT_8632/shard-dg1-15/igt@i915_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-d=
g1-15/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-18/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/=
shard-dg1-19/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-12/igt@i915_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
T_8632/shard-dg1-12/igt@i915_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-17/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGT_8632/shard-dg1-12/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-13/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_8632/shard-dg1-18/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-14/=
igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGT_8632/shard-dg1-17/igt@i915_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-=
dg1-14/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-16/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632=
/shard-dg1-13/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-13/igt@i915_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GT_8632/shard-dg1-19/igt@i915_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-18/igt@i915_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGT_8632/shard-dg1-17/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg1-16/igt@i9=
15_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGT_8632/shard-dg1-19/igt@i915_module_load@load.html">PASS</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/sh=
ard-dg1-12/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-13/igt@i915_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14079/shard-dg1-13/igt@i915_module_load@load.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-14/igt@i=
915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-14/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard=
-dg1-15/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-15/igt@i915_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14079/shard-dg1-15/igt@i915_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-16/igt@i915_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14079/shard-dg1-16/igt@i915_module_load@load.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-=
17/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-17/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_140=
79/shard-dg1-17/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-18/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14079/shard-dg1-18/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-18/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14079/shard-dg1-19/igt@i915_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/sh=
ard-dg1-19/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-12/igt@i915_module_load=
@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14785">i915#14785</a>)</li>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8632/shard-tglu-8/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-5/igt@i915=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_8632/shard-tglu-7/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-6/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGT_8632/shard-tglu-9/igt@i915_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-t=
glu-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-3/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/=
shard-tglu-9/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-10/igt@i915_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GT_8632/shard-tglu-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-10/igt@i915_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGT_8632/shard-tglu-2/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-5/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGT_8632/shard-tglu-10/igt@i915_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu=
-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_8632/shard-tglu-9/igt@i915_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/sha=
rd-tglu-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-3/igt@i915_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8=
632/shard-tglu-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-tglu-2/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8632/shard-tglu-4/igt@i915_module_load@load.html">PASS</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-9/=
igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14079/shard-tglu-10/igt@i915_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079=
/shard-tglu-10/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-2/igt@i915_module_=
load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14079/shard-tglu-2/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt=
@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@i915_module_load@load.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/sha=
rd-tglu-4/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@i915_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_14079/shard-tglu-5/igt@i915_module_load@load.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-6/igt@i915=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14079/shard-tglu-6/igt@i915_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tg=
lu-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-7/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4079/shard-tglu-8/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-9/igt@i915_modu=
le_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14785">i915#14785</a>)</li>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8632/shard-glk3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-glk5/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGT_8632/shard-glk6/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-glk9/igt@i915_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGT_8632/shard-glk5/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-glk1/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_8632/shard-glk6/igt@i915_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-glk3/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGT_8632/shard-glk1/igt@i915_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-glk9/i=
gt@i915_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_14079/shard-glk1/igt@i915_module_load@load.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
079/shard-glk3/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-glk5/igt@i915_module_lo=
ad@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14079/shard-glk6/igt@i915_module_load@load.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-glk9/igt@i91=
5_module_load@load.html">SKIP</a>)</li>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8632/shard-mtlp-2/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-7/igt@i915=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_8632/shard-mtlp-3/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-4/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGT_8632/shard-mtlp-8/igt@i915_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-m=
tlp-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-4/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/=
shard-mtlp-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-6/igt@i915_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
T_8632/shard-mtlp-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-4/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGT_8632/shard-mtlp-3/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-5/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_8632/shard-mtlp-2/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-8/=
igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGT_8632/shard-mtlp-5/igt@i915_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-=
mtlp-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-3/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632=
/shard-mtlp-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-6/igt@i915_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GT_8632/shard-mtlp-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-6/igt@i915_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGT_8632/shard-mtlp-7/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-mtlp-6/igt@i9=
15_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGT_8632/shard-mtlp-5/igt@i915_module_load@load.html">PASS</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/sh=
ard-mtlp-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@i915_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14079/shard-mtlp-2/igt@i915_module_load@load.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-3/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-3/igt@i915_module_load@load.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard=
-mtlp-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-4/igt@i915_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14079/shard-mtlp-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-5/igt@i915_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14079/shard-mtlp-5/igt@i915_module_load@load.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp=
-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-6/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_140=
79/shard-mtlp-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-7/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14079/shard-mtlp-7/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-7/ig=
t@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14079/shard-mtlp-8/igt@i915_module_load@load.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/sh=
ard-mtlp-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-8/igt@i915_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14079/shard-mtlp-8/igt@i915_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14785">i915#147=
85</a>)</li>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8632/shard-dg2-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-6/igt@i915_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGT_8632/shard-dg2-4/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-7/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_8632/shard-dg2-1/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-3/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGT_8632/shard-dg2-5/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2=
-5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_8632/shard-dg2-7/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shar=
d-dg2-11/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-11/igt@i915_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_86=
32/shard-dg2-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-8/igt@i915_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GT_8632/shard-dg2-11/igt@i915_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-8/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGT_8632/shard-dg2-8/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-1/igt@i915_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGT_8632/shard-dg2-6/igt@i915_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-1/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGT_8632/shard-dg2-5/igt@i915_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-1=
1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGT_8632/shard-dg2-7/igt@i915_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/shard=
-dg2-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGT_8632/shard-dg2-3/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8632/=
shard-dg2-6/igt@i915_module_load@load.html">PASS</a>) -&gt; (<a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@i915_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14079/shard-dg2-11/igt@i915_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-11=
/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@i915_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079=
/shard-dg2-1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@i915_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14079/shard-dg2-1/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@i9=
15_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@i915_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-d=
g2-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
079/shard-dg2-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-4/igt@i915_module_=
load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14079/shard-dg2-5/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-5/igt@i=
915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-6/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-=
dg2-6/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-7/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4079/shard-dg2-7/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-8/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14079/shard-dg2-8/igt@i915_module_load@load.html">PASS</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14785">i915#=
14785</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-snb1/igt@i915_module_load@reload-no-display.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard=
-snb6/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#145=
45</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-7/igt@i915_pm_freq_api@freq-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-fence.=
html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13790">i915#13790</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2681">i915#2681</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14498">i915#14498</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@i915_pm_rpm@gem-execbuf-stress-p=
c8.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-8/igt@i915_pm_rpm@system-suspend.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-4/=
igt@i915_pm_rpm@system-suspend.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15060">i915#15060</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-13/igt@i915_pm_rps@basic-api.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@i915_pm_rps@thresholds.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
1681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-12/igt@i915_pm_rps@thresholds-park.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@i915_query@hwconfig_table.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-6/igt@i915_query@query-topology-cohere=
nt-slice-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6188">i915#6188</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@i915_query@query-topology-coheren=
t-slice-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6188">i915#6188</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@i915_query@test-query-geometry-s=
ubslices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@i915_suspend@fence-restore-tiled2=
untiled.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-16/igt@kms_addfb_basic@basic-y-tiled-le=
gacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4215">i915#4215</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-6/igt@kms_addfb_basic@clobberred-modifi=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4212">i915#4212</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-13/igt@kms_addfb_basic@clobberred-modif=
ier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4212">i915#4212</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-7/igt@kms_addfb_basic@clobberred-modif=
ier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-=
on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12454">i915#12454</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-snb4/igt@kms_addfb_basic@tile-pitch-mismatch.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shar=
d-snb7/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a></li>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-glk3/igt@kms_addfb_basic@tile-pitch-mismatch.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shar=
d-glk6/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-3/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-4/igt@kms_atomic@plane-primary-overlay-=
mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9531">i915#9531</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@kms_atomic@plane-primary-overlay-=
mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9531">i915#9531</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-14/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9531">i915#9531</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-2/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg2-5/igt@kms_atomic_transition@plane-toggle-modeset-transi=
tion.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14079/shard-dg2-3/igt@kms_atomic_transition@plane-toggle-modeset-t=
ransition.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/5956">i915#5956</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@kms_big_fb@4-tiled-32bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/5286">i915#5286</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-13/igt@kms_big_fb@4-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180=
-async-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bp=
p-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +75 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@kms_big_fb@y-tiled-addfb.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5190">i915#5190</a>) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-19/igt@kms_big_fb@yf-tiled-64bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@kms_big_fb@yf-tiled-addfb.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6187">i915#6187</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-3/igt@kms_big_fb@yf-tiled-max-hw-stride=
-32bpp-rotate-180-async-flip.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-glk10/igt@kms_ccs@bad-pixel-format-yf-tiled=
-ccs@pipe-c-hdmi-a-1.html">SKIP</a> +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@kms_ccs@crc-primary-basic-yf-til=
ed-ccs@pipe-a-dp-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +158 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-7/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +44 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/6095">i915#6095</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-til=
ed-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +24 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">ABORT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/12796">i915#12796</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#151=
32</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@=
pipe-a-hdmi-a-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/12796">i915#12796</a>) +1 oth=
er test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-glk10/igt@kms_ccs@crc-primary-suspend-yf-ti=
led-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/12796">i915#12796</a>) +1 other test =
incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@kms_ccs@crc-primary-suspend-yf-t=
iled-ccs@pipe-c-dp-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-4/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-14/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_ccs@missing-ccs-buffer-4-tile=
d-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +22 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-glk6/igt@kms_ccs@missing-ccs-buffer-y-tiled=
-gen12-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> +106 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-mc-ccs@pipe-c-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +125 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-7/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs-cc@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-=
ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_cdclk@mode-transition.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3742">i915#3742</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-=
hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13781">i915#13781</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_cdclk@plane-scaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-b-hd=
mi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13783">i915#13783</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-19/igt@kms_chamelium_color@ctm-0-50.htm=
l">SKIP</a> +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_chamelium_color@gamma.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@kms_chamelium_edid@dp-edid-stress=
-resolution-non-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other te=
sts skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_chamelium_edid@dp-edid-stress=
-resolution-non-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_chamelium_frames@dp-crc-multi=
ple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-4/igt@kms_chamelium_hpd@hdmi-hpd-storm=
-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-after-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-13/igt@kms_chamelium_hpd@vga-hpd-fast.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-7/igt@kms_chamelium_hpd@vga-hpd-withou=
t-ddc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-5/igt@kms_color@ctm-0-75.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@km=
s_color@ctm-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-9/igt@kms_color@deep-color.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/355=
5">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9979">i915#9979</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_content_protection@atomic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/7116">i915#7116</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-5/igt@kms_content_protection@atomic-dpm=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/7118">i915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-14/igt@kms_content_protection@atomic-dp=
ms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/7116">i915#7116</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-7/igt@kms_content_protection@content-t=
ype-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_content_protection@dp-mst-typ=
e-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3116">i915#3116</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-14/igt@kms_content_protection@dp-mst-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3299">i915#3299</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-8/igt@kms_content_protection@dp-mst-typ=
e-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_content_protection@dp-mst-typ=
e-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-4/igt@kms_content_protection@lic-type-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9424">i915#9424</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-15/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/7118">i915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/7162">i915#7162</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-2/igt@kms_content_protection@uevent.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/7116">i915#7116</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-3/igt@kms_cursor_crc@cursor-offscreen-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-6/igt@kms_cursor_crc@cursor-offscreen-5=
12x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-19/igt@kms_cursor_crc@cursor-offscreen-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-=
max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-2=
56x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8814">i915#8814</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-4/igt@kms_cursor_crc@cursor-onscreen-32=
x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-=
64x21@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_cursor_crc@cursor-random-128x=
42@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +8 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_cursor_crc@cursor-random-32x1=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@kms_cursor_crc@cursor-random-32x=
32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-128x42.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/=
shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-128x42.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#1=
3566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-=
a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14079/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-h=
dmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13566">i915#13566</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-256=
x85@pipe-a-hdmi-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/13566">i915#13566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-6/igt@kms_cursor_crc@cursor-sliding-51=
2x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-64=
x21.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@kms_cursor_crc@cursor-suspend@pip=
e-b-hdmi-a-1.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other =
test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-fl=
ip-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-8/igt@kms_cursor_legacy@basic-flip-after-cursor-varying=
-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14079/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-after-cursor-v=
arying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitio=
ns-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@kms_cursor_legacy@cursor-vs-flip-=
atomic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15277">i915#15277</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-7/igt@kms_cursor_legacy@cursora-vs-flip=
b-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +5 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@kms_display_modes@extended-mode-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1769">i915#1769</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard=
-dg2-8/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg2-11/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-7/igt@kms_dp_=
aux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-ss=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-17/igt@kms_dp_link_training@uhbr-mst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13748">i915#13748</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-2/igt@kms_dp_link_training@uhbr-mst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-10/igt@kms_dp_linktrain_fallback@dsc-f=
allback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-8/igt@kms_dsc@dsc-basic.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i=
915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@kms_dsc@dsc-with-output-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3840">i915#3840</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-15/igt@kms_dsc@dsc-with-output-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-2/igt@kms_feature_discovery@display-2x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@kms_feature_discovery@dp-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9337">i915#9337</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-10/igt@kms_flip@2x-blocking-absolute-w=
f_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-m=
odeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@kms_flip@2x-flip-vs-dpms-on-nop.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-4/igt@kms_flip@2x-flip-vs-fences.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@kms_flip@2x-flip-vs-modeset-vs-ha=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@kms_flip@2x-flip-vs-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9934">i915#9934</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_flip@2x-flip-vs-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_flip@2x-plain-flip-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-18/igt@kms_flip@2x-plain-flip-ts-check-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14079/shard-rkl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3637">i915#3637</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg1-13/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-16/=
igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) +1 other te=
st dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-7/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_14079/shard-rkl-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.=
html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15132">i915#15132</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-16/igt@kms_flip@flip-vs-suspend@d-hdmi-=
a4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-li=
near-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-l=
inear-to-64bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
672">i915#2672</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>=
)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pip=
e-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#267=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8813">i915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#=
2587</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-li=
near-to-32bpp-linear-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>=
) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
672">i915#2672</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915=
#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i=
915#8813</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-1p-=
offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indf=
b-draw-mmap-cpu.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-p=
rimscrn-spr-indfb-draw-mmap-cpu.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#1=
2964</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indf=
b-draw-mmap-gtt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-p=
rimscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354"=
>i915#5354</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +13 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +18 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-rgb=
565-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/8708">i915#8708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>) +1 other =
test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr=
-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +19 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +8=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/34=
58">i915#3458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +12 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-9/igt@kms_frontbuffer_tracking@fbcpsr-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fb=
c-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-=
offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-=
offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +15 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-o=
ffscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i=
915#5354</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-shrfb-draw-render.html">SKIP</a> +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-rgb=
101010-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +9 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-7/igt@kms_hdr@bpc-switch-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@kms_hdr@invalid-metadata-sizes.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-18/igt@kms_hdr@static-swap.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8228">i915#8228</a>)</li>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg2-11/igt@kms_hdr@static-swap.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@km=
s_hdr@static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_invalid_mode@zero-hdisplay.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/8826">i915#8826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-4/igt@kms_invalid_mode@zero-vdisplay.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rk=
l-6/igt@kms_invalid_mode@zero-vdisplay.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3=
555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8826">i915#8826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg2-11/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shar=
d-dg2-3/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>=
)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_joiner@basic-force-big-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12388">i915#12388</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12339">i915#12339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@kms_joiner@invalid-modeset-force=
-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/10656">i915#10656</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/13522">i915#13522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-7/igt@kms_pipe_b_c_ivb@disable-pipe-b-e=
nable-pipe-c.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_pipe_stress@stress-xrgb8888-4=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14712">i915#14712</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-14/igt@kms_pipe_stress@stress-xrgb8888-=
4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-8/igt@kms_plane@pixel-format.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@=
kms_plane@pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-2/igt@kms_plane@planar-pixel-format-settings.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/=
shard-rkl-6/igt@kms_plane@planar-pixel-format-settings.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9581">i915#9581</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane@plane-position-hole.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8825">i915#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_alpha_blend@constant-al=
pha-mid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7294">i915#7294</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-5/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-cons=
tant.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14079/shard-rkl-6/igt@kms_plane_alpha_blend@coverage-vs-premult-vs=
-constant.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/7294">i915#7294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-4.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-7/igt@kms_plane_multiple@2x-tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-4/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@kms_plane_scaling@2x-scaler-mult=
i-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe=
-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-wit=
h-pixel-format@pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_scaling@plane-dow=
nscale-factor-0-75-with-pixel-format@pipe-a.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-2=
0x20-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-=
modifiers.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-=
0-25-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-uni=
ty-scaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-fac=
tor-0-5-unity-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#81=
52</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_scaling@planes-downscal=
e-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152=
">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pi=
pe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_scaling@planes-downscal=
e-factor-0-5-upscale-factor-0-25@pipe-a.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-=
factor-0-5.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20=
-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#35=
55</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6953">i915#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-=
factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#=
8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-down=
scale-factor-0-5.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6953">i915#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-=
factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-17/igt@kms_pm_backlight@fade.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/53=
54">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_pm_backlight@fade-with-dpms.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-7/igt@kms_pm_backlight@fade-with-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9812">i915#9812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_pm_dc@dc9-dpms.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281">=
i915#4281</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_pm_lpsp@screens-disabled.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_pm_rpm@cursor-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-r=
kl-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/12916">i915#12916</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12916">i915#12916</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-16/igt@kms_pm_rpm@modeset-lpsp-stress.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/=
shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915=
#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2=
/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-4/igt@kms_prime@basic-crc-vgem.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/ig=
t@kms_prime@basic-crc-vgem.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-2/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-glk6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-=
update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1=
:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-update-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-7/igt@kms_psr2_sf@pr-cursor-plane-move=
-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-glk10/igt@kms_psr2_sf@pr-cursor-plane-updat=
e-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-upda=
te-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_psr2_sf@psr2-overlay-plane-mo=
ve-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-12/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-4/igt@kms_psr2_sf@psr2-overlay-plane-up=
date-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-snb7/igt@kms_psr2_sf@psr2-overlay-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_psr2_sf@psr2-primary-plane-u=
pdate-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_psr@fbc-pr-sprite-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@kms_psr@fbc-pr-suspend.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-18/igt@kms_psr@fbc-pr-suspend.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9732">i915#9732</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_psr@fbc-psr-sprite-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-mmap-cpu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-10/igt@kms_psr@fbc-psr2-cursor-mmap-cp=
u.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9732">i915#9732</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-5/igt@kms_psr@psr-primary-mmap-gtt@edp=
-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4077">i915#4077</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9688">i915#9688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@kms_psr@psr-sprite-plane-onoff.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-8/igt@kms_rotation_crc@primary-4-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-2/igt@kms_rotation_crc@primary-rotatio=
n-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/12755">i915#12755</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@kms_rotation_crc@primary-rotation=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12755">i915#12755</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_setmode@basic.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106"=
>i915#15106</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-mtlp-4/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-m=
tlp-2/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i915#15106</a>) +2 =
other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@kms_sharpness_filter@filter-basi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15232">i915#15232</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@kms_sharpness_filter@filter-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15232">i915#15232</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_sharpness_filter@invalid-fil=
ter-with-plane.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15232">i915#15232</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@kms_sharpness_filter@invalid-filt=
er-with-scaler.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15232">i915#15232</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg1-15/igt@kms_sharpness_filter@invalid-fil=
ter-with-scaler.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15232">i915#15232</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-7/igt@kms_sharpness_filter@invalid-fil=
ter-with-scaling-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15232">i915#15232</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-2/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@kms_vrr@negative-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9906">i915#9906</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@kms_vrr@negative-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-8/igt@kms_vrr@seamless-rr-switch-vrr.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-2/igt@kms_writeback@writeback-check-ou=
tput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_writeback@writeback-fb-id.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-3/igt@kms_writeback@writeback-fb-id-xr=
gb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2437">i915#2437</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9412">i915#9412</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-4/igt@perf@non-zero-reason.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100=
">i915#9100</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-5/igt@perf@per-context-mode-unprivilege=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2435">i915#2435</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-4/igt@perf_pmu@event-wait.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8807=
">i915#8807</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-mtlp-4/igt@perf_pmu@event-wait@rcs0.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/8807">i915#8807</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-tglu-1/igt@perf_pmu@module-unload.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4433">i915#14433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/=
shard-rkl-6/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4=
349</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-5/igt@perf_pmu@rc6-suspend.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@pe=
rf_pmu@rc6-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15131">i915#15131</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-4/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6=
/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a=
>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-7/igt@sriov_basic@enable-vfs-autoprobe-=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-1/igt@sriov_basic@enable-vfs-bind-unbin=
d-each.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@invalid:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-tglu-5/igt@sysfs_preempt_timeout@invalid.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tg=
lu-5/igt@sysfs_preempt_timeout@invalid.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +63 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@dmabuf-export:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-4/igt@vgem_basic@dmabuf-export.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/ig=
t@vgem_basic@dmabuf-export.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +32 other t=
ests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@fbdev@write.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#25=
82</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_140=
79/shard-rkl-5/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-4/igt@gem_eio@in-flight-suspend.html">ABORT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15=
131</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
079/shard-rkl-2/igt@gem_eio@in-flight-suspend.html">PASS</a> +2 other tests=
 pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg2-7/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1335=
6">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14079/shard-dg2-7/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear-via-pagefault:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-mtlp-6/igt@gem_mmap_offset@clear-via-pagefault.html">ABORT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/148=
09">i915#14809</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14079/shard-mtlp-3/igt@gem_mmap_offset@clear-via-pagefault.html">P=
ASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-re=
fcounted.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-8/igt@gem_pxp@dm=
abuf-shared-protected-dst-is-context-refcounted.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-5/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.htm=
l">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12917">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-8/igt@gem_pxp@verify-px=
p-stale-buf-optout-execution.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-snb6/igt@gem_workarounds@suspend-resume-fd.html">ABORT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14849">=
i915#14849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14079/shard-snb1/igt@gem_workarounds@suspend-resume-fd.html">PASS</a><=
/li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-tglu-3/igt@gem_workarounds@suspend-resume-fd.html">ABORT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14849=
">i915#14849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14079/shard-tglu-6/igt@gem_workarounds@suspend-resume-fd.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@no-handle:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg1-19/igt@kms_addfb_basic@no-handle.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391">i9=
15#4391</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4423">i915#4423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14079/shard-dg1-12/igt@kms_addfb_basic@no-handle.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transitio=
n-fencing.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/5956">i915#5956</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-8/igt@kms_atomic_transition@pla=
ne-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/135=
66">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14079/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-left-edge:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_cursor_edge_walk@64x64-left-edge.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14079/shard-rkl-8/igt@kms_cursor_edge_walk@64x64-left-edge.html">PA=
SS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_cursor_legacy@flip-vs-cursor-ato=
mic.html">PASS</a> +28 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying=
-size:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-mtlp-7/igt@kms_cursor_legacy@short-flip-after-cursor-atomic=
-transitions-varying-size.html">ABORT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/13562">i915#13562</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-mtlp-6/igt@kms_c=
ursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-snb4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14033">i915#14033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14350">i915#14350</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_14079/shard-snb1/igt@kms_flip@2x-flip-vs-sus=
pend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-snb4/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-=
hdmi-a1.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14033">i915#14033</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_14079/shard-snb1/igt@kms_flip@2x-flip-vs-sus=
pend-interruptible@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_flip@flip-vs-dpms-on-nop.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14553">i915#14553</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_flip@flip-vs-dpms-on-nop.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modese=
t-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@km=
s_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-li=
near-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@km=
s_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">PASS<=
/a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indf=
b-draw-pwrite.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6880">i915#6880</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg2-3/igt@kms_frontbuffer_track=
ing@fbc-1p-primscrn-cur-indfb-draw-pwrite.html">PASS</a></li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indf=
b-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-r=
kl-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.htm=
l">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg2-8/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#=
3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14079/shard-dg2-11/igt@kms_hdr@static-toggle-suspend.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_invalid_mode@uint-max-clock.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8826">i915#8826</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_invalid_mode@uint-=
max-clock.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg1-13/igt@kms_plane_alpha_blend@alpha-transparent-fb.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4423">i915#4423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14079/shard-dg1-13/igt@kms_plane_alpha_blend@alpha-trans=
parent-fb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg2-7/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953=
">i915#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9423">i915#9423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-dg2-11/igt@kms_plane_scaling@intel-max-src-=
size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clam=
ping-pixel-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/sh=
ard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-f=
ormats.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clam=
ping-pixel-formats@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-r=
kl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-format=
s@pipe-a.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-=
factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i91=
5#8152</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14079/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-fac=
tor-0-75.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-=
factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079=
/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-=
75@pipe-b.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/sh=
ard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-4/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_140=
79/shard-rkl-5/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-mtlp-5/igt@perf_pmu@busy-double-start@ccs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i9=
15#4349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14079/shard-mtlp-5/igt@perf_pmu@busy-double-start@ccs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-2/igt@api_intel_bb@crc32.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">i915#6230</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-=
rkl-6/igt@api_intel_bb@crc32.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">i915#6230</a>)</=
li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-7/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411=
">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14079/shard-rkl-6/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8411">i915#8411</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@api_intel_bb@object-reloc-purg=
e-cache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/110=
78">i915#11078</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14079/shard-rkl-7/igt@device_reset@unbind-cold-res=
et-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9323">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14079/shard-rkl-3/igt@gem_ccs@block-multicopy-compresse=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9323">i915#9323</a>)</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-tglu-6/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323"=
>i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14079/shard-tglu-5/igt@gem_ccs@block-multicopy-compressed.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323=
">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14079/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-7/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/sh=
ard-rkl-6/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#932=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-5/igt@gem_create@create-ext-cpu-access-sanity-check.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/6335">i915#6335</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_create@create-ext-cpu-access-sanit=
y-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/6335">i915#6335</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8562">i915#8562</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14079/shard-rkl-2/igt@gem_create@create-ext-set-pat.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-7/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-=
rkl-6/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-8/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525"=
>i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14079/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-2/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281=
">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14079/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3281">i915#3281</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-cpu-no=
reloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-8/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276">i=
915#7276</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14079/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/7276">i915#7276</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14079/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4613">i915#4613</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14079/shard-rkl-2/igt@gem_lmem_swapping@verify-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/46=
13">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-uncac=
hed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_partial_pwrite_pread@writes=
-after-reads-uncached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +11 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14079/shard-rkl-2/igt@gem_pwrite@basic-exhaustion.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282=
">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i91=
5#13717</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14079/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-context.html">TIMEOUT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i9=
15#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@gem_pxp@reject-modify-context-protection-off-3.ht=
ml">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12917">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_pxp@reject-m=
odify-context-protection-off-3.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)=
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#=
3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3323">i915#3323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14079/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-5/igt@gem_userptr_blits@forbidden-operations.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
82">i915#3282</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@gem_userptr_blits@forbidden-ope=
rations.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14079/shard-rkl-8/igt@gem_userptr_blits@readonly-unsync.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-8/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#=
3281</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14079/shard-rkl-6/igt@gem_userptr_blits@relocations.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3281">i915#3281</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-after-close.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14079/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-after-clos=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-7/igt@gen7_exec_parse@chained-batch.html">SKIP</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl=
-6/igt@gen7_exec_parse@chained-batch.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +27 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14079/shard-rkl-2/igt@gen9_exec_parse@bb-chained.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">=
i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-7/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i9=
15#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14079/shard-rkl-6/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2527">i915#2527</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-2/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#83=
99</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_140=
79/shard-rkl-6/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399=
">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8399">i915#8399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14079/shard-rkl-5/igt@i915_pm_freq_api@freq-reset-mul=
tiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6590">i915#6590</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14079/shard-rkl-2/igt@i915_pm_freq_mult@media-freq@gt0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-7/igt@i915_power@sanity.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-r=
kl-6/igt@i915_power@sanity.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-3/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079=
/shard-rkl-6/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i9=
15#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-7/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/sh=
ard-rkl-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#770=
7</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i=
915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14079/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg1-17/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">=
i915#4423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-19/igt@kms_big_fb@4-tiled-6=
4bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-1=
80.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_big_fb@4-tiled-max-hw-strid=
e-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-h=
flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i=
915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14079/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
2313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14079/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-g=
en12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-tglu-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_ccs@crc-primary-basic-4-tiled-=
dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12805">i915#12805</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bm=
g-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-=
cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12796">i915#12796</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@kms_ccs@crc-primary-susp=
end-y-tiled-gen12-rc-ccs-cc.html">ABORT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_ccs@crc-sprit=
e-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +13 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe=
-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-3/igt@kms_ccs@crc-sprite-plan=
es-basic-yf-tiled-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#60=
95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_cha=
melium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#78=
28</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg1-15/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i9=
15#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14079/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd-storm.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4423">i915#4423</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i9=
15#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +10 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg1-13/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">=
i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4423">i915#4423</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-16/igt@kms_chamelium_hpd@h=
dmi-hpd-storm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-tglu-7/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_chamelium_hpd@vga-hpd-wi=
thout-ddc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-4/igt@kms_content_protection@lic-type-0.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i=
915#9424</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14079/shard-rkl-6/igt@kms_content_protection@lic-type-0.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_content_protection@srm.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
079/shard-rkl-2/igt@kms_content_protection@srm.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14079/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-5/igt@kms_cursor_crc@cursor-random-128x42.html">DMESG-F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14079/shard-rkl-2/igt@kms_cursor_crc@cursor-random-128x42.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1304=
9">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14079/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x512.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14079/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x1=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14079/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-512x512.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-l=
egacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_cursor_legacy@cursorb-vs-flipb=
-varying-size.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-tglu-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-=
toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i9=
15#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3804">i915#3804</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14079/shard-rkl-2/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-2/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">=
i915#13749</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14079/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-8/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915=
#13748</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14079/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-4/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/137=
07">i915#13707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14079/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-pwrite:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_draw_crc@draw-method-pwrite.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14079/shard-rkl-2/igt@kms_draw_crc@draw-method-pwrite.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1296=
4">i915#12964</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
079/shard-rkl-4/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-tglu-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3840">i915#3840</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9053">i915#9053</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_dsc@dsc-with-output-for=
mats-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3955">i915#3955</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14079/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i9=
15#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-5/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854">i91=
5#4854</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14079/shard-rkl-6/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-7/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/=
shard-rkl-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i91=
5#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14079/shard-rkl-2/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i91=
5#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-tglu-9/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i9=
15#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_flip@2x-plain-flip-ts-check.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_flip@2x-wf_vblank-ts-check-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-8/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915=
#6113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14079/shard-rkl-6/igt@kms_flip@flip-vs-suspend.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637=
">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4ti=
ledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@=
kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-y=
ftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@k=
ms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-=
ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-8/igt@km=
s_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672=
">i915#2672</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shr=
fb-draw-mmap-cpu.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_frontb=
uffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-tglu-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shr=
fb-draw-render.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +16 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt=
:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-=
indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_frontbuff=
er_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-=
shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-4/igt@kms_frontbuffer_tr=
acking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>=
) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_frontbuffer_tra=
cking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_frontbuffer=
_tracking@fbcpsr-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +9 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrac=
k-mmap-gtt.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-ind=
fb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-i=
ndfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5354">i915#5354</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indf=
b-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/sha=
rd-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-c=
pu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3458">i915#3458</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_f=
rontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5354">i915#5354</a>) +22 other tests skip</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-=
dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3458">i915#3458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shr=
fb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-14/igt@kms_frontbuffer_tra=
cking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pl=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-4/=
igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825"=
>i915#1825</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-2/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14079/shard-rkl-6/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#1=
2713</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4079/shard-rkl-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-3/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#1=
0656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4079/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/106=
56">i915#10656</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_joiner@invalid-modeset-b=
ig-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/10656">i915#10656</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12388">i915#12388</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_joiner@invalid-mod=
eset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/10656">i915#10656</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
2339">i915#12339</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14079/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12339">i915#12339</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4816">i915#4816</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_multipipe_modeset@b=
asic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070">i915#4070</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816">i915#48=
16</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14079/shard-rkl-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-2/igt@kms_plane@plane-position-hole-dpms.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane@plane-position-hole-dpms.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8825">i915#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-5/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i91=
5#13958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14079/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-8/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#=
14259</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14079/shard-rkl-6/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-tglu-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-wi=
th-rotation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12247">i915#12247</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_plane_scaling@pl=
ane-downscale-factor-0-75-with-rotation.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with=
-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12247">i915#12247</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_scalin=
g@plane-scaler-unity-scaling-with-rotation@pipe-a.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#122=
47</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with=
-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12247">i915#12247</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_plane_scalin=
g@plane-scaler-unity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#122=
47</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8152">i915#8152</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-2/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i91=
5#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14079/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg1-17/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12=
343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14079/shard-dg1-17/igt@kms_pm_backlight@brightness-=
with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295">i915#9295</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard=
-tglu-6/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15128">i915#15128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-5/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964=
">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14079/shard-rkl-6/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12916">i=
915#12916</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14079/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i=
915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-2/igt@kms_prime@d3hot.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl=
-6/igt@kms_prime@d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg1-15/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous=
-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-dg1-16/igt@k=
ms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/115=
20">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-tglu-10/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-u=
pdate-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-=
area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay=
-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-excee=
d-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-5/igt@kms_ps=
r2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#1=
1520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i9=
15#9683</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14079/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9683">i915#9683</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14079/shard-rkl-2/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">=
i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_psr@fbc-psr-primary-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#10=
72</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_psr@fbc-psr-primary-bl=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-tglu-10/igt@kms_psr@fbc-psr2-primary-mmap-gtt.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732"=
>i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14079/shard-tglu-5/igt@kms_psr@fbc-psr2-primary-mmap-gtt.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"=
>i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-mmap-cpu:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-dg1-16/igt@kms_psr@pr-cursor-mmap-cpu.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#10=
72</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14079/shard-dg1-12/igt@kms_psr@pr-cursor-mmap-cpu.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">=
i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4423">i915#4423</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-7/igt@kms_psr@psr2-cursor-mmap-gtt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1=
072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14079/shard-rkl-6/igt@kms_psr@psr2-cursor-mmap-gtt.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072=
">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9732">i915#9732</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overl=
ay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9685">i915#9685</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-5/igt@kms_psr_stress_t=
est@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/5289">i915#5289</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_rotation_crc@primary-yf-tiled-r=
eflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-8/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14079/shard-rkl-6/igt@kms_setmode@invalid-clone-exclusive-crtc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-7/igt@kms_sharpness_filter@filter-scaler-downscale.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15232">i915#15232</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14079/shard-rkl-6/igt@kms_sharpness_filter@filter-scaler-do=
wnscale.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-tglu-7/igt@kms_sharpness_filter@invalid-filter-with-scaling=
-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15232">i915#15232</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_14079/shard-tglu-5/igt@kms_sharpness_filter@inval=
id-filter-with-scaling-mode.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-5/igt@kms_vrr@flipline.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i9=
15#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14079/shard-rkl-6/igt@kms_vrr@flipline.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-2/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-=
6/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-2/igt@kms_writeback@writeback-invalid-parameters.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2437">i915#2437</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14079/shard-rkl-6/igt@kms_writeback@writeback-invalid-parameter=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@kms_writeback@writeback-pixel-formats.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2437">i915#2437</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9412">i915#9412</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shard-rkl-2/igt@kms_writeback@wr=
iteback-pixel-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-7/igt@perf@gen8-unprivileged-single-ctx-counters.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2436">i915#2436</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14079/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counter=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-5/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14079/shar=
d-rkl-6/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a=
>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-5/igt@prime_vgem@basic-write.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708=
">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14079/shard-rkl-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14079/shard-rkl-3/igt@prime_vgem@fence-flip-hang.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">=
i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-8/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#370=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1407=
9/shard-rkl-6/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">=
i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8632/shard-rkl-8/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917"=
>i915#9917</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14079/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8632 -&gt; IGTPW_14079</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17565: b603326a067916accf680fd623f4fc3c22bba487 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_14079: b2a8f975bbd5430a29e6007179fd6b4764528f52 @ https://gitlab.fr=
eedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8632: bbd6b1e5161ad8d244042f4a0d9fefcd575ccf67 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8918139673317088444==--
