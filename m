Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86186C43458
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jul 2026 17:46:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA7910E4EE;
	Tue,  7 Jul 2026 17:46:08 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E49910E4EE;
 Tue,  7 Jul 2026 17:45:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3546113045430384402=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_series_starting_with_=5B?=
 =?utf-8?q?1/6=5D_lib=3A_Add_generic_platform_filtering_framework?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 07 Jul 2026 17:45:39 -0000
Message-ID: <178344633962.162670.10105310846985776798@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260706235130.157557-1-vitaly.prosyak@amd.com>
In-Reply-To: <20260706235130.157557-1-vitaly.prosyak@amd.com>
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

--===============3546113045430384402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/6] lib: Add generic platform filtering framework
URL   : https://patchwork.freedesktop.org/series/169903/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8991_full -> IGTPW_15475_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15475_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15475_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15475_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - shard-rkl:          [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-3/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@i915_selftest@live.html

  * igt@i915_selftest@live@mman:
    - shard-tglu:         [PASS][3] -> [DMESG-FAIL][4] +2 other tests dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-tglu-7/igt@i915_selftest@live@mman.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-6/igt@i915_selftest@live@mman.html

  
New tests
---------

  New tests have been introduced between IGT_8991_full and IGTPW_15475_full:

### New IGT tests (41) ###

  * igt@api_intel_allocator@reloc-allocator@fork-reopen-allocator:
    - Statuses : 6 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@api_intel_allocator@simple-allocator@fork-reopen-allocator:
    - Statuses : 7 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_ctx_engines@execute-allforone:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@gem_ctx_engines@execute-one:
    - Statuses : 6 pass(s)
    - Exec time: [0.39, 4.27] s

  * igt@gem_ctx_engines@execute-oneforall:
    - Statuses : 7 pass(s)
    - Exec time: [0.12, 0.75] s

  * igt@gem_ctx_engines@independent:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.03, 1.71] s

  * igt@gem_ctx_engines@invalid-engines:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@gem_ctx_param@vm:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.03, 0.10] s

  * igt@gem_ctx_shared@create-shared-gtt:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.20] s

  * igt@gem_ctx_shared@detached-shared-gtt:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.17] s

  * igt@gem_ctx_shared@disjoint-timelines:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@gem_ctx_shared@q-smoketest-all:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 32.35] s

  * igt@gem_ctx_shared@single-timeline:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@gem_exec_balancer@bonded-dual:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0, 32.49] s

  * igt@gem_exec_balancer@bonded-false-hang:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0, 4.38] s

  * igt@gem_exec_balancer@bonded-pair:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 32.45] s

  * igt@gem_exec_balancer@bonded-sync:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 14.82] s

  * igt@gem_exec_balancer@bonded-true-hang:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0, 4.11] s

  * igt@gem_exec_balancer@busy:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.01] s

  * igt@gem_exec_balancer@full:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.66] s

  * igt@gem_exec_balancer@full-late:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.75] s

  * igt@gem_exec_balancer@full-late-pulse:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.14] s

  * igt@gem_exec_balancer@full-pulse:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.99] s

  * igt@gem_exec_balancer@indices:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.55] s

  * igt@gem_exec_balancer@individual:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.38] s

  * igt@gem_exec_balancer@invalid-balancer:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.50] s

  * igt@gem_exec_balancer@invalid-bonds:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_exec_balancer@nop:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 49.65] s

  * igt@gem_exec_balancer@semaphore:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.36] s

  * igt@gem_exec_balancer@smoke:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 23.78] s

  * igt@gem_media_fill@media-fill@smem:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@gem_vm_create@create-ext:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@gem_vm_create@execbuf:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@gem_vm_create@invalid-create:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@gem_vm_create@invalid-destroy:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@gem_vm_create@isolation:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@i915_selftest@mock@ring:
    - Statuses : 6 pass(s)
    - Exec time: [0.70, 1.70] s

  * igt@i915_selftest@perf@migrate:
    - Statuses : 7 pass(s)
    - Exec time: [1.37, 4.33] s

  * igt@kms_color@deep-color@pipe-d-edp-1-ctm:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_color@deep-color@pipe-d-edp-1-degamma:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_color@deep-color@pipe-d-edp-1-gamma:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  

Known issues
------------

  Here are the changes found in IGTPW_15475_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][5] ([i915#6230])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#8411])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#8411])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-tglu-1:       NOTRUN -> [SKIP][8] ([i915#11078])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#11078])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-tglu:         NOTRUN -> [SKIP][10] ([i915#11078])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-6/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-mtlp:         NOTRUN -> [SKIP][11] ([i915#11078])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#11078])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@dmabuf@all-tests:
    - shard-rkl:          NOTRUN -> [SKIP][13] ([i915#15931])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@dmabuf@all-tests.html

  * igt@drm_buddy@drm_buddy:
    - shard-tglu-1:       NOTRUN -> [SKIP][14] ([i915#15678])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@drm_buddy@drm_buddy.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#14544] / [i915#3555] / [i915#9323])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#3555] / [i915#9323])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-17/igt@gem_ccs@ctrl-surf-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#3555] / [i915#9323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-3/igt@gem_ccs@ctrl-surf-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#3555] / [i915#9323])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#9323])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#9323])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-9/igt@gem_ccs@suspend-resume.html
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#9323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][22] ([i915#13356] / [i915#16348])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-5/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#8562])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@gem_create@create-ext-set-pat.html
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#8562])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@gem_create@create-ext-set-pat.html
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#8562])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-12/igt@gem_create@create-ext-set-pat.html
    - shard-tglu:         NOTRUN -> [SKIP][26] ([i915#8562])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-5/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu:         NOTRUN -> [SKIP][27] ([i915#280])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-10/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@bonded-dual (NEW):
    - shard-mtlp:         NOTRUN -> [SKIP][28] ([i915#4771])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#8555]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@gem_exec_balancer@noheartbeat.html
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#8555]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-14/igt@gem_exec_balancer@noheartbeat.html
    - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#8555]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-6/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel:
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#4525])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-9/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#4525]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#6334]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_fence@submit3:
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#4812]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-14/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#5107])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-8/igt@gem_exec_params@rsvd2-dirt.html
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#5107])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#3281]) +6 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#3281]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-14/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-wc-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#3281]) +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-6/igt@gem_exec_reloc@basic-wc-noreloc.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#3281]) +6 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#4537] / [i915#4812])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#4537] / [i915#4812]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-8/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][44] ([i915#13356])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-1/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4860])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-1/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#4860])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-14/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#4860])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#4613]) +4 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-tglu:         NOTRUN -> [SKIP][49] ([i915#4613]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-10/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@random:
    - shard-tglu-1:       NOTRUN -> [SKIP][50] ([i915#4613])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-glk:          NOTRUN -> [SKIP][51] ([i915#4613]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk4/igt@gem_lmem_swapping@verify-random.html
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#4613])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-1/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_madvise@dontneed-before-exec:
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#3282]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-7/igt@gem_madvise@dontneed-before-exec.html

  * igt@gem_mmap_gtt@basic-short:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4077]) +5 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-8/igt@gem_mmap_gtt@basic-short.html

  * igt@gem_mmap_gtt@flink-race:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4077]) +4 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-13/igt@gem_mmap_gtt@flink-race.html

  * igt@gem_mmap_gtt@medium-copy-xy:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4077]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-8/igt@gem_mmap_gtt@medium-copy-xy.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#4083]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-14/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_mmap_wc@read-write-distinct:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#4083]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@gem_mmap_wc@read-write-distinct.html

  * igt@gem_mmap_wc@write-read-distinct:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#4083]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@gem_mmap_wc@write-read-distinct.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#14544] / [i915#3282])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#3282]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-14/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#3282]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-1/igt@gem_pwrite@basic-exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][63] ([i915#2658])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-snb6/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][64] ([i915#2658])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-10/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pwrite@basic-self:
    - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#3282]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu-1:       NOTRUN -> [SKIP][66] ([i915#13398])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4270]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@gem_pxp@protected-raw-src-copy-not-readible.html
    - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#4270])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@gem_pxp@protected-raw-src-copy-not-readible.html
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4270]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-15/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_render_copy@linear-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#8428]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@gem_render_copy@linear-to-vebox-y-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#5190] / [i915#8428])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-7/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#4079])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-14/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4885])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@gem_softpin@evict-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#4885])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-7/igt@gem_softpin@evict-snoop.html
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4885])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#3297]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@gem_userptr_blits@coherency-sync.html
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#3297]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-13/igt@gem_userptr_blits@coherency-sync.html
    - shard-tglu:         NOTRUN -> [SKIP][78] ([i915#3297]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-10/igt@gem_userptr_blits@coherency-sync.html
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#3297]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-5/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#3297]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-dg2:          [PASS][81] -> [ABORT][82] ([i915#15152])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-7/igt@gem_workarounds@suspend-resume-fd.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-10/igt@gem_workarounds@suspend-resume-fd.html
    - shard-glk11:        NOTRUN -> [INCOMPLETE][83] ([i915#13356] / [i915#14586])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk11/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-glk10:        NOTRUN -> [SKIP][84] +314 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk10/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#14544] / [i915#2527])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#2856]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@gen9_exec_parse@bb-chained.html
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#2527]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-12/igt@gen9_exec_parse@bb-chained.html
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#2856])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-7/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#2527]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-7/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglu:         NOTRUN -> [SKIP][90] ([i915#2527] / [i915#2856]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-3/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-tglu-1:       NOTRUN -> [SKIP][91] ([i915#2527] / [i915#2856])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_drm_fdinfo@all-busy-check-all:
    - shard-mtlp:         NOTRUN -> [SKIP][92] ([i915#14123])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-7/igt@i915_drm_fdinfo@all-busy-check-all.html

  * igt@i915_drm_fdinfo@all-busy-idle-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#14123])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-12/igt@i915_drm_fdinfo@all-busy-idle-check-all.html

  * igt@i915_drm_fdinfo@busy-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#11527]) +5 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-15/igt@i915_drm_fdinfo@busy-check-all.html

  * igt@i915_drm_fdinfo@busy-check-all@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#11527]) +6 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-8/igt@i915_drm_fdinfo@busy-check-all@ccs0.html

  * igt@i915_drm_fdinfo@busy-check-all@vecs0:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#11527]) +7 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@i915_drm_fdinfo@busy-check-all@vecs0.html

  * igt@i915_drm_fdinfo@busy@rcs0:
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#14073]) +5 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-15/igt@i915_drm_fdinfo@busy@rcs0.html
    - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#14073]) +6 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-5/igt@i915_drm_fdinfo@busy@rcs0.html

  * igt@i915_drm_fdinfo@busy@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#14073]) +7 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-1/igt@i915_drm_fdinfo@busy@vecs1.html

  * igt@i915_drm_fdinfo@virtual-busy-idle-all:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#14118]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@i915_drm_fdinfo@virtual-busy-idle-all.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#15479]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-rkl:          NOTRUN -> [ABORT][102] ([i915#15342]) +1 other test abort
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@reload-no-display:
    - shard-dg2:          [PASS][103] -> [DMESG-WARN][104] ([i915#13029] / [i915#14545])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-8/igt@i915_module_load@reload-no-display.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-7/igt@i915_module_load@reload-no-display.html
    - shard-dg1:          NOTRUN -> [DMESG-WARN][105] ([i915#13029] / [i915#14545])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-16/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-tglu-1:       NOTRUN -> [SKIP][106] ([i915#6590]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         [PASS][107] -> [WARN][108] ([i915#13790] / [i915#2681]) +1 other test warn
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-fence.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#14498])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][110] ([i915#13356])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk11/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#11681] / [i915#6621])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@i915_pm_rps@min-max-config-idle.html
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#11681] / [i915#6621])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-12/igt@i915_pm_rps@min-max-config-idle.html
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#11681] / [i915#6621])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#16109])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-1/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_selftest@live:
    - shard-mtlp:         [PASS][115] -> [DMESG-FAIL][116] ([i915#15560])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-mtlp-2/igt@i915_selftest@live.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gem_contexts:
    - shard-rkl:          [PASS][117] -> [DMESG-FAIL][118] ([i915#16077])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-3/igt@i915_selftest@live@gem_contexts.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@i915_selftest@live@gem_contexts.html
    - shard-tglu:         [PASS][119] -> [DMESG-FAIL][120] ([i915#16077])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-tglu-7/igt@i915_selftest@live@gem_contexts.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-6/igt@i915_selftest@live@gem_contexts.html
    - shard-mtlp:         [PASS][121] -> [DMESG-FAIL][122] ([i915#16077])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-mtlp-2/igt@i915_selftest@live@gem_contexts.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][123] ([i915#4817] / [i915#7443])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-8/igt@i915_suspend@basic-s3-without-i915.html
    - shard-mtlp:         NOTRUN -> [SKIP][124] ([i915#6645])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-4/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          NOTRUN -> [INCOMPLETE][125] ([i915#16182] / [i915#4817]) +2 other tests incomplete
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk9/igt@i915_suspend@debugfs-reader.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#4212]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#4212])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-16/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - shard-mtlp:         NOTRUN -> [SKIP][128] ([i915#4212])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-4/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu:         NOTRUN -> [SKIP][129] ([i915#12454] / [i915#12712])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#12454] / [i915#12712])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [FAIL][131] ([i915#14888]) +1 other test fail
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#1769] / [i915#3555])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][133] ([i915#1769])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#1769] / [i915#3555])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#1769] / [i915#3555])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-mtlp:         [PASS][136] -> [FAIL][137] ([i915#15733] / [i915#5138])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-mtlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][138] ([i915#5286]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#14544] / [i915#5286])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#5286]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#4538] / [i915#5286]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#5286]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         NOTRUN -> [FAIL][143] ([i915#15733] / [i915#5138])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#3828]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
    - shard-tglu-1:       NOTRUN -> [SKIP][145] ([i915#3828])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#3828])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#3828])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-9/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#3828])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][149] +6 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-8/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#3638]) +5 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#4538] / [i915#5190]) +9 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#3638]) +2 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-13/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#4538]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#6187])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-7/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][155] +11 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [SKIP][156] +52 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk11/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-tglu-1:       NOTRUN -> [SKIP][157] ([i915#6095]) +34 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#12313])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#10307] / [i915#6095]) +116 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#6095]) +49 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#12805])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#12805])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#12805])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#12805])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-rkl:          [PASS][165] -> [INCOMPLETE][166] ([i915#15582])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][167] ([i915#15582])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#6095]) +3 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#14098] / [i915#6095]) +51 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][170] ([i915#15582]) +1 other test incomplete
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#12313]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#14544] / [i915#6095]) +7 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#14098] / [i915#14544] / [i915#6095]) +4 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#6095]) +59 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-10/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#6095]) +231 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#6095]) +77 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#3742]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_cdclk@mode-transition.html
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#3742])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_cdclk@mode-transition.html
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#3742])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-4/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu-1:       NOTRUN -> [SKIP][181] ([i915#3742])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#13781]) +4 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-8/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#11151])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#11151] / [i915#7828]) +5 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-6/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#16471]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-1/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#11151] / [i915#7828]) +5 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#11151] / [i915#7828]) +7 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][188] ([i915#11151] / [i915#7828]) +3 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-14/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#11151] / [i915#7828]) +5 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][190] ([i915#11151] / [i915#7828]) +4 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_color@deep-color:
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#12655] / [i915#3555])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_color@deep-color.html
    - shard-tglu-1:       NOTRUN -> [SKIP][192] ([i915#3555] / [i915#9979])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_color@deep-color.html
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#12655] / [i915#3555])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-16/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#15865]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#15330] / [i915#3116] / [i915#3299])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-2/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#15330] / [i915#3299])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-8/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#15330] / [i915#3299])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#15330] / [i915#3116])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#15330] / [i915#3299])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-15/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#14544] / [i915#15330])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@legacy:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#15865]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-tglu-1:       NOTRUN -> [SKIP][202] ([i915#15865])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#15865]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-14/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@uevent:
    - shard-mtlp:         NOTRUN -> [SKIP][204] ([i915#15865])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-7/igt@kms_content_protection@uevent.html
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#15865])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#3555]) +4 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#13049]) +2 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#13049]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#13049]) +3 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-rkl:          [PASS][210] -> [FAIL][211] ([i915#13566])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][212] ([i915#13566]) +4 other tests fail
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][213] ([i915#13049])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [FAIL][214] ([i915#13566]) +1 other test fail
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-4/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][215] ([i915#3555])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#13049]) +2 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-14/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#8814]) +2 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#13049]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#3555]) +3 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][220] ([i915#16119] / [i915#4213]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#4103]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#9809]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#13046] / [i915#5354]) +2 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-1/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          NOTRUN -> [FAIL][224] ([i915#15804])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#4103])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#4103]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#4103])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#14544] / [i915#9723])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#3555])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_aux_dev@basic:
    - shard-dg2:          [PASS][230] -> [SKIP][231] ([i915#1257])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-10/igt@kms_dp_aux_dev@basic.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@kms_dp_aux_dev@basic.html
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#1257])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-12/igt@kms_dp_aux_dev@basic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#13749])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#13749])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#13749])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-12/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#13749])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-5/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2:          [PASS][237] -> [SKIP][238] ([i915#13749])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-10/igt@kms_dp_link_training@non-uhbr-sst.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-1/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#13749]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@kms_dp_link_training@uhbr-mst.html
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#13748])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-9/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#13748])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-tglu-1:       NOTRUN -> [SKIP][242] ([i915#13707])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#8812])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#16361])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-13/igt@kms_dsc@dsc-basic-ultrajoiner.html
    - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#16361]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-10/igt@kms_dsc@dsc-basic-ultrajoiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#16361]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-5/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][247] ([i915#16361]) +2 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#16361]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#16361]) +4 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_feature_discovery@display-2x:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#16081])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-7/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@psr2:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#658])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#4881])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#9934]) +3 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-8/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#9934]) +3 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-12/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#14544] / [i915#9934]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][256] ([i915#9934])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-7/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#8381])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#9934]) +9 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][259] ([i915#12745] / [i915#4839] / [i915#6113]) +1 other test incomplete
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk3/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][260] ([i915#12745]) +2 other tests incomplete
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk9/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-tglu:         NOTRUN -> [SKIP][261] ([i915#3637] / [i915#9934]) +4 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-2/igt@kms_flip@2x-nonexisting-fb.html
    - shard-mtlp:         NOTRUN -> [SKIP][262] ([i915#3637] / [i915#9934]) +4 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-8/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-tglu:         [PASS][263] -> [FAIL][264] ([i915#13027]) +1 other test fail
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-tglu-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][265] ([i915#12745] / [i915#4839]) +1 other test incomplete
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][266] ([i915#12745] / [i915#6113])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-mtlp:         [PASS][267] -> [FAIL][268] ([i915#10826]) +1 other test fail
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-mtlp-2/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-7/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][269] ([i915#15643]) +3 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#15643]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#15643]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#15643]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][273] ([i915#15643]) +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#15643] / [i915#5190])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         [PASS][275] -> [SKIP][276] ([i915#15672]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-mtlp-2/igt@kms_force_connector_basic@prune-stale-modes.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-1/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][277] +39 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#15991] / [i915#5354]) +16 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][279] ([i915#15991] / [i915#1825]) +21 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#1825]) +10 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#15990] / [i915#8708]) +2 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#15990]) +8 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][283] ([i915#15989]) +9 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#15989]) +20 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:
    - shard-rkl:          [PASS][285] -> [SKIP][286] ([i915#15989]) +8 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#15989]) +14 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-fullscreen:
    - shard-mtlp:         NOTRUN -> [SKIP][288] ([i915#15991]) +23 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff:
    - shard-glk:          [PASS][289] -> [SKIP][290] +9 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#14544]) +5 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy:
    - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#15989]) +6 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-12/igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-pwrite:
    - shard-dg2:          [PASS][293] -> [SKIP][294] ([i915#15989]) +6 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-pwrite.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-1/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#15990] / [i915#8708]) +8 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#14544] / [i915#1825])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#15990] / [i915#8708]) +10 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][298] ([i915#5439])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][299] ([i915#15102]) +31 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][300] ([i915#15990]) +2 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#15102]) +15 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][302] +437 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#14544] / [i915#15102]) +2 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][304] +51 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][305] ([i915#15989]) +21 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#15990]) +18 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-1/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#15989]) +12 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][308] ([i915#15104] / [i915#15990])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][309] ([i915#15104] / [i915#15990])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#15102] / [i915#3023]) +20 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][311] +103 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#15102]) +15 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][313] ([i915#15102]) +21 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#15102]) +29 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][315] +79 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-2/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-snb:          NOTRUN -> [SKIP][316] +156 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-snb6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][317] ([i915#15991]) +16 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][318] ([i915#16518] / [i915#3555] / [i915#8228])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#3555] / [i915#8228])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-17/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-rkl:          NOTRUN -> [SKIP][320] ([i915#3555] / [i915#8228])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_hdr@static-swap.html
    - shard-tglu-1:       NOTRUN -> [SKIP][321] ([i915#3555] / [i915#8228])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          [PASS][322] -> [SKIP][323] ([i915#3555] / [i915#8228]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_hdr@static-toggle.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#13688])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][325] ([i915#15459])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][326] ([i915#15458])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][327] ([i915#15458]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#15458])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][329] ([i915#15458])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#15815])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-tglu:         NOTRUN -> [SKIP][331] ([i915#14712])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-5/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#13705])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][333] ([i915#13705])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-tglu:         NOTRUN -> [SKIP][334] ([i915#15709]) +4 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-tglu-1:       NOTRUN -> [SKIP][335] ([i915#15709]) +2 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][336] ([i915#15709])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-mtlp:         NOTRUN -> [SKIP][337] ([i915#15709]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-5/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][338] ([i915#15709]) +1 other test skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-10/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][339] ([i915#15709]) +4 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-rkl:          NOTRUN -> [SKIP][340] ([i915#16112])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][341] ([i915#10647] / [i915#12169])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk6/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][342] ([i915#10647]) +1 other test fail
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk6/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][343] ([i915#8821])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@kms_plane_lowres@tiling-y.html
    - shard-mtlp:         NOTRUN -> [SKIP][344] ([i915#3555] / [i915#8821])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-7/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-tglu-1:       NOTRUN -> [SKIP][345] ([i915#13958])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-dg2:          NOTRUN -> [SKIP][346] ([i915#13958])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-5/igt@kms_plane_multiple@2x-tiling-x.html
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#13958]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-x.html
    - shard-dg1:          NOTRUN -> [SKIP][348] ([i915#13958])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-18/igt@kms_plane_multiple@2x-tiling-x.html
    - shard-tglu:         NOTRUN -> [SKIP][349] ([i915#13958])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-9/igt@kms_plane_multiple@2x-tiling-x.html
    - shard-mtlp:         NOTRUN -> [SKIP][350] ([i915#13958])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-1/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][351] ([i915#14259])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-mtlp:         NOTRUN -> [SKIP][352] ([i915#6953])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][353] ([i915#15329]) +3 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-dg1:          NOTRUN -> [SKIP][354] ([i915#15329]) +4 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][355] ([i915#15329]) +4 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][356] ([i915#15329] / [i915#6953])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][357] ([i915#15329]) +11 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-mtlp:         NOTRUN -> [SKIP][358] ([i915#15329] / [i915#3555] / [i915#6953]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][359] ([i915#12343] / [i915#9812])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-8/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][360] ([i915#12343])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][361] ([i915#15751])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@kms_pm_dc@dc6-dpms.html
    - shard-rkl:          NOTRUN -> [FAIL][362] ([i915#16479])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_pm_dc@dc6-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][363] ([i915#3361])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-17/igt@kms_pm_dc@dc6-dpms.html
    - shard-tglu:         NOTRUN -> [FAIL][364] ([i915#16479])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][365] ([i915#15739])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-7/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][366] ([i915#9340])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg1:          NOTRUN -> [SKIP][367] ([i915#8430])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][368] ([i915#15073])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg1:          [PASS][369] -> [DMESG-WARN][370] ([i915#4423])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg1-17/igt@kms_pm_rpm@i2c.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-16/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg1:          [PASS][371] -> [SKIP][372] ([i915#15073])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-12/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][373] -> [SKIP][374] ([i915#15073])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [PASS][375] -> [SKIP][376] ([i915#15073]) +1 other test skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-dg2:          [PASS][377] -> [INCOMPLETE][378] ([i915#14419])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-3/igt@kms_pm_rpm@system-suspend-idle.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-glk:          NOTRUN -> [INCOMPLETE][379] ([i915#10553])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk8/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglu-1:       NOTRUN -> [SKIP][380] ([i915#6524])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          NOTRUN -> [SKIP][381] ([i915#6524])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][382] ([i915#11520] / [i915#14544])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][383] ([i915#9808])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][384] ([i915#12316]) +3 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][385] ([i915#11520]) +2 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][386] ([i915#11520]) +9 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
    - shard-snb:          NOTRUN -> [SKIP][387] ([i915#11520]) +3 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-snb1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][388] ([i915#11520]) +3 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-13/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
    - shard-tglu:         NOTRUN -> [SKIP][389] ([i915#11520]) +5 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-10/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][390] ([i915#11520]) +5 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - shard-glk11:        NOTRUN -> [SKIP][391] ([i915#11520]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk11/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][392] ([i915#11520]) +5 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-glk10:        NOTRUN -> [SKIP][393] ([i915#11520]) +7 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk10/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][394] ([i915#9683])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][395] ([i915#1072] / [i915#14544] / [i915#9732])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][396] ([i915#9688]) +15 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-4/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][397] ([i915#1072] / [i915#9732]) +21 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][398] ([i915#1072] / [i915#9732]) +11 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-15/igt@kms_psr@psr-cursor-plane-onoff.html
    - shard-tglu:         NOTRUN -> [SKIP][399] ([i915#9732]) +16 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-8/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-tglu-1:       NOTRUN -> [SKIP][400] ([i915#9732]) +9 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr@psr-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][401] ([i915#1072] / [i915#9732]) +13 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@kms_psr@psr-suspend.html

  * igt@kms_psr@psr2-primary-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][402] ([i915#4077] / [i915#9688]) +3 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-4/igt@kms_psr@psr2-primary-mmap-gtt@edp-1.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2:          NOTRUN -> [SKIP][403] ([i915#15949])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2:          NOTRUN -> [SKIP][404] ([i915#5190]) +1 other test skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-tglu:         NOTRUN -> [SKIP][405] ([i915#5289])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][406] ([i915#5289])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg1:          NOTRUN -> [SKIP][407] ([i915#5289])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-rkl:          NOTRUN -> [SKIP][408] ([i915#14544] / [i915#3555])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-rkl:          NOTRUN -> [ABORT][409] ([i915#13179]) +1 other test abort
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@kms_selftest@drm_framebuffer.html
    - shard-glk:          NOTRUN -> [ABORT][410] ([i915#13179]) +1 other test abort
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk1/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][411] ([i915#12276]) +1 other test incomplete
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-rkl:          [PASS][412] -> [INCOMPLETE][413] ([i915#12276])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-2/igt@kms_vblank@ts-continuation-suspend.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][414] ([i915#12276])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-2.html

  * igt@kms_vrr@negative-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][415] ([i915#3555] / [i915#9906])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          NOTRUN -> [SKIP][416] ([i915#9906])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][417] ([i915#7387])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-8/igt@perf@global-sseu-config-invalid.html

  * igt@perf_pmu@module-unload:
    - shard-rkl:          NOTRUN -> [ABORT][418] ([i915#15778])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-7/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@most-busy-check-all@bcs0:
    - shard-mtlp:         [PASS][419] -> [FAIL][420] ([i915#15997]) +1 other test fail
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-mtlp-2/igt@perf_pmu@most-busy-check-all@bcs0.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-1/igt@perf_pmu@most-busy-check-all@bcs0.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-tglu-1:       NOTRUN -> [SKIP][421] ([i915#8516])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][422] ([i915#3708]) +1 other test skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-15/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-read:
    - shard-mtlp:         NOTRUN -> [SKIP][423] ([i915#3708])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@prime_vgem@basic-read.html
    - shard-dg2:          NOTRUN -> [SKIP][424] ([i915#3291] / [i915#3708])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-8/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][425] ([i915#3291] / [i915#3708]) +1 other test skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-read-hang:
    - shard-rkl:          NOTRUN -> [SKIP][426] ([i915#14544] / [i915#3708])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg2:          NOTRUN -> [SKIP][427] ([i915#9917])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@sriov_basic@enable-vfs-bind-unbind-each.html
    - shard-rkl:          NOTRUN -> [SKIP][428] ([i915#9917]) +1 other test skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-7/igt@sriov_basic@enable-vfs-bind-unbind-each.html
    - shard-dg1:          NOTRUN -> [SKIP][429] ([i915#9917])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-12/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:
    - shard-tglu:         NOTRUN -> [SKIP][430] ([i915#16066]) +18 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-5/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random.html
    - shard-mtlp:         NOTRUN -> [SKIP][431] ([i915#16066]) +8 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-7/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random.html

  
#### Possible fixes ####

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [INCOMPLETE][432] ([i915#13356] / [i915#16348]) -> [PASS][433]
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-3/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-5/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html

  * igt@gem_cs_tlb@engines@vcs0:
    - shard-dg1:          [INCOMPLETE][434] -> [PASS][435] +1 other test pass
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg1-19/igt@gem_cs_tlb@engines@vcs0.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-12/igt@gem_cs_tlb@engines@vcs0.html

  * igt@gem_eio@kms:
    - shard-tglu:         [DMESG-WARN][436] ([i915#13363]) -> [PASS][437]
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-tglu-6/igt@gem_eio@kms.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-3/igt@gem_eio@kms.html

  * igt@gem_exec_schedule@pi-ringfull@ccs0:
    - shard-dg2:          [ABORT][438] ([i915#13562]) -> [PASS][439] +1 other test pass
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-1/igt@gem_exec_schedule@pi-ringfull@ccs0.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@gem_exec_schedule@pi-ringfull@ccs0.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [INCOMPLETE][440] ([i915#13356]) -> [PASS][441]
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-1/igt@gem_exec_suspend@basic-s0@smem.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-1/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_workarounds@suspend-resume:
    - shard-rkl:          [INCOMPLETE][442] ([i915#13356]) -> [PASS][443]
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-4/igt@gem_workarounds@suspend-resume.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          [INCOMPLETE][444] ([i915#13356] / [i915#15172]) -> [PASS][445]
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-glk8/igt@i915_pm_rpm@system-suspend-execbuf.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk1/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-glk:          [INCOMPLETE][446] ([i915#16182] / [i915#4817]) -> [PASS][447]
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-glk4/igt@i915_suspend@fence-restore-untiled.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk6/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [FAIL][448] ([i915#15733] / [i915#5138]) -> [PASS][449]
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][450] ([i915#13566]) -> [PASS][451] +3 other tests pass
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-tglu-7/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-10/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
    - shard-rkl:          [FAIL][452] ([i915#13566]) -> [PASS][453] +2 other tests pass
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - shard-dg1:          [DMESG-WARN][454] ([i915#4423]) -> [PASS][455]
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg1-15/igt@kms_flip@basic-flip-vs-dpms.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-14/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-mtlp:         [DMESG-FAIL][456] ([i915#16175]) -> [PASS][457]
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-mtlp-4/igt@kms_flip_tiling@flip-change-tiling.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-6/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-cc-to-x:
    - shard-mtlp:         [DMESG-WARN][458] ([i915#16175]) -> [PASS][459]
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-mtlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-cc-to-x.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-cc-to-x.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-x:
    - shard-mtlp:         [FAIL][460] ([i915#15733]) -> [PASS][461] +1 other test pass
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-mtlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-x.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-x.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:
    - shard-dg2:          [SKIP][462] ([i915#15989]) -> [PASS][463]
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-glk:          [SKIP][464] -> [PASS][465] +2 other tests pass
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-glk9/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:
    - shard-rkl:          [SKIP][466] ([i915#15989]) -> [PASS][467] +9 other tests pass
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2:          [SKIP][468] ([i915#15459]) -> [PASS][469]
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-10/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][470] ([i915#15073]) -> [PASS][471]
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-rkl:          [SKIP][472] ([i915#15073]) -> [PASS][473] +2 other tests pass
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_setmode@basic:
    - shard-tglu:         [FAIL][474] ([i915#15106]) -> [PASS][475] +2 other tests pass
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-tglu-6/igt@kms_setmode@basic.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-7/igt@kms_setmode@basic.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-rkl:          [ABORT][476] ([i915#15132]) -> [PASS][477]
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-1/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_vblank@ts-continuation-dpms-suspend.html

  
#### Warnings ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-rkl:          [SKIP][478] ([i915#14544] / [i915#8411]) -> [SKIP][479] ([i915#8411])
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          [SKIP][480] ([i915#3555] / [i915#9323]) -> [SKIP][481] ([i915#14544] / [i915#3555] / [i915#9323])
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-5/igt@gem_ccs@block-copy-compressed.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          [SKIP][482] ([i915#6335]) -> [SKIP][483] ([i915#14544] / [i915#6335])
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-2/igt@gem_create@create-ext-cpu-access-sanity-check.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          [INCOMPLETE][484] ([i915#13356]) -> [ABORT][485] ([i915#15131]) +1 other test abort
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-1/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          [SKIP][486] ([i915#280]) -> [SKIP][487] ([i915#14544] / [i915#280])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-8/igt@gem_ctx_sseu@invalid-sseu.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-rkl:          [SKIP][488] ([i915#14544] / [i915#4525]) -> [SKIP][489] ([i915#4525])
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fence.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_reloc@basic-active:
    - shard-rkl:          [SKIP][490] ([i915#14544] / [i915#3281]) -> [SKIP][491] ([i915#3281]) +1 other test skip
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@gem_exec_reloc@basic-active.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-cpu-gtt-active:
    - shard-rkl:          [SKIP][492] ([i915#3281]) -> [SKIP][493] ([i915#14544] / [i915#3281]) +1 other test skip
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-gtt-active.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-gtt-active.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-rkl:          [SKIP][494] ([i915#14544] / [i915#4613]) -> [SKIP][495] ([i915#4613]) +1 other test skip
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          [SKIP][496] ([i915#4613]) -> [SKIP][497] ([i915#14544] / [i915#4613]) +1 other test skip
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-8/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          [SKIP][498] ([i915#14544] / [i915#3282]) -> [SKIP][499] ([i915#3282]) +2 other tests skip
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-rkl:          [SKIP][500] ([i915#14544] / [i915#2527]) -> [SKIP][501] ([i915#2527]) +1 other test skip
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@gen9_exec_parse@batch-invalid-length.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          [SKIP][502] ([i915#2527]) -> [SKIP][503] ([i915#14544] / [i915#2527]) +1 other test skip
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-7/igt@gen9_exec_parse@valid-registers.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-rkl:          [SKIP][504] ([i915#8399]) -> [SKIP][505] ([i915#14544] / [i915#8399])
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-8/igt@i915_pm_freq_api@freq-basic-api.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          [SKIP][506] ([i915#14544] / [i915#8399]) -> [SKIP][507] ([i915#8399])
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          [SKIP][508] ([i915#14544] / [i915#5286]) -> [SKIP][509] ([i915#5286]) +3 other tests skip
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][510] ([i915#5286]) -> [SKIP][511] ([i915#14544] / [i915#5286]) +1 other test skip
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          [SKIP][512] ([i915#3638]) -> [SKIP][513] ([i915#14544] / [i915#3638])
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-2/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][514] ([i915#6095]) -> [SKIP][515] ([i915#14544] / [i915#6095]) +1 other test skip
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][516] ([i915#14098] / [i915#6095]) -> [SKIP][517] ([i915#14098] / [i915#14544] / [i915#6095]) +4 other tests skip
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-rkl:          [SKIP][518] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][519] ([i915#14098] / [i915#6095]) +8 other tests skip
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][520] ([i915#14544] / [i915#6095]) -> [SKIP][521] ([i915#6095]) +5 other tests skip
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-2.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][522] ([i915#12313] / [i915#14544]) -> [SKIP][523] ([i915#12313])
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:
    - shard-rkl:          [SKIP][524] ([i915#16471]) -> [SKIP][525] ([i915#14544] / [i915#16471])
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-rkl:          [SKIP][526] ([i915#11151] / [i915#7828]) -> [SKIP][527] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-2/igt@kms_chamelium_frames@hdmi-crc-multiple.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-rkl:          [SKIP][528] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][529] ([i915#11151] / [i915#7828]) +2 other tests skip
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_chamelium_frames@hdmi-frame-dump.html
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          [SKIP][530] ([i915#14544] / [i915#15330] / [i915#3116]) -> [SKIP][531] ([i915#15330] / [i915#3116])
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-1.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          [SKIP][532] ([i915#15330] / [i915#3116]) -> [SKIP][533] ([i915#14544] / [i915#15330] / [i915#3116])
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-3/igt@kms_content_protection@dp-mst-type-0.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          [FAIL][534] ([i915#7173]) -> [SKIP][535] ([i915#15865]) +1 other test skip
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-10/igt@kms_content_protection@srm.html
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@suspend-resume:
    - shard-rkl:          [SKIP][536] ([i915#14544] / [i915#15865]) -> [SKIP][537] ([i915#15865])
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_content_protection@suspend-resume.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-rkl:          [SKIP][538] ([i915#3555]) -> [SKIP][539] ([i915#14544] / [i915#3555]) +1 other test skip
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          [SKIP][540] ([i915#13049] / [i915#3359]) -> [SKIP][541] ([i915#13049])
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-10/igt@kms_cursor_crc@cursor-random-512x170.html
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-rkl:          [SKIP][542] ([i915#13049] / [i915#14544]) -> [SKIP][543] ([i915#13049])
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          [SKIP][544] ([i915#13049]) -> [SKIP][545] ([i915#13049] / [i915#14544]) +1 other test skip
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x512.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-rkl:          [SKIP][546] ([i915#14544] / [i915#3555]) -> [SKIP][547] ([i915#3555]) +1 other test skip
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][548] ([i915#15768]) -> [FAIL][549] ([i915#15804])
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dp_aux_dev@basic:
    - shard-rkl:          [SKIP][550] ([i915#1257] / [i915#14544]) -> [SKIP][551] ([i915#1257])
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_dp_aux_dev@basic.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@kms_dp_aux_dev@basic.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-rkl:          [INCOMPLETE][552] ([i915#9878]) -> [ABORT][553] ([i915#15132])
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_fbcon_fbt@fbc-suspend.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-rkl:          [SKIP][554] ([i915#9934]) -> [SKIP][555] ([i915#14544] / [i915#9934]) +1 other test skip
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-4/igt@kms_flip@2x-flip-vs-fences-interruptible.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-rkl:          [SKIP][556] ([i915#14544] / [i915#9934]) -> [SKIP][557] ([i915#9934]) +3 other tests skip
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_flip@2x-plain-flip-ts-check.html
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:
    - shard-rkl:          [SKIP][558] ([i915#14544] / [i915#15643]) -> [SKIP][559] ([i915#15643]) +2 other tests skip
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-1/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][560] ([i915#14544] / [i915#15102]) -> [SKIP][561] ([i915#15102]) +11 other tests skip
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-rkl:          [SKIP][562] ([i915#15102] / [i915#3023]) -> [SKIP][563] ([i915#14544] / [i915#15102] / [i915#3023]) +5 other tests skip
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][564] ([i915#14544] / [i915#1825]) -> [SKIP][565] ([i915#1825]) +3 other tests skip
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          [SKIP][566] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][567] ([i915#15102] / [i915#3023]) +7 other tests skip
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt:
    - shard-rkl:          [SKIP][568] ([i915#15102]) -> [SKIP][569] ([i915#14544] / [i915#15102]) +8 other tests skip
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-render:
    - shard-rkl:          [SKIP][570] -> [SKIP][571] ([i915#14544]) +22 other tests skip
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-render.html
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff:
    - shard-rkl:          [SKIP][572] ([i915#14544]) -> [SKIP][573] +37 other tests skip
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff.html
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@hdr-suspend:
    - shard-glk:          [INCOMPLETE][574] ([i915#16056]) -> [SKIP][575]
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-glk8/igt@kms_frontbuffer_tracking@hdr-suspend.html
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk4/igt@kms_frontbuffer_tracking@hdr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          [SKIP][576] -> [SKIP][577] ([i915#4423])
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][578] ([i915#1825]) -> [SKIP][579] ([i915#14544] / [i915#1825]) +1 other test skip
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2:          [SKIP][580] ([i915#15102]) -> [SKIP][581] ([i915#10433] / [i915#15102]) +1 other test skip
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         [SKIP][582] ([i915#1187] / [i915#12713] / [i915#16490]) -> [SKIP][583] ([i915#12713] / [i915#16490])
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-rkl:          [SKIP][584] ([i915#15458]) -> [SKIP][585] ([i915#14544] / [i915#15458])
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-2/igt@kms_joiner@basic-ultra-joiner.html
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:
    - shard-rkl:          [SKIP][586] ([i915#15709]) -> [SKIP][587] ([i915#14544] / [i915#15709]) +1 other test skip
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][588] ([i915#14544] / [i915#15709]) -> [SKIP][589] ([i915#15709])
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-dg1:          [SKIP][590] ([i915#3555]) -> [SKIP][591] ([i915#3555] / [i915#4423])
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg1-18/igt@kms_plane_lowres@tiling-4.html
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-13/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-rkl:          [SKIP][592] ([i915#15329] / [i915#3555]) -> [SKIP][593] ([i915#14544] / [i915#15329] / [i915#3555])
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-rkl:          [SKIP][594] ([i915#15329]) -> [SKIP][595] ([i915#14544] / [i915#15329]) +2 other tests skip
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          [SKIP][596] ([i915#14544] / [i915#15329]) -> [SKIP][597] ([i915#15329]) +3 other tests skip
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_pm_backlight@fade:
    - shard-rkl:          [SKIP][598] ([i915#12343] / [i915#5354]) -> [SKIP][599] ([i915#12343] / [i915#14544] / [i915#5354])
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-8/igt@kms_pm_backlight@fade.html
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [SKIP][600] ([i915#14544] / [i915#15073]) -> [SKIP][601] ([i915#15073])
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          [SKIP][602] ([i915#14544] / [i915#6524]) -> [SKIP][603] ([i915#6524])
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][604] ([i915#11520] / [i915#14544]) -> [SKIP][605] ([i915#11520]) +3 other tests skip
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][606] ([i915#11520]) -> [SKIP][607] ([i915#11520] / [i915#14544]) +2 other tests skip
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-5/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@pr-cursor-mmap-cpu:
    - shard-rkl:          [SKIP][608] ([i915#1072] / [i915#9732]) -> [SKIP][609] ([i915#1072] / [i915#14544] / [i915#9732]) +6 other tests skip
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-5/igt@kms_psr@pr-cursor-mmap-cpu.html
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_psr@pr-cursor-mmap-cpu.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-rkl:          [SKIP][610] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][611] ([i915#1072] / [i915#9732]) +8 other tests skip
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_psr@psr-sprite-plane-onoff.html
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2:          [SKIP][612] ([i915#15867]) -> [SKIP][613] ([i915#12755] / [i915#15867])
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-10/igt@kms_rotation_crc@bad-pixel-format.html
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-1/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2:          [SKIP][614] ([i915#15867] / [i915#5190]) -> [SKIP][615] ([i915#12755] / [i915#15867] / [i915#5190])
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
    - shard-rkl:          [SKIP][616] ([i915#14544] / [i915#5289]) -> [SKIP][617] ([i915#5289]) +1 other test skip
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          [SKIP][618] ([i915#12755] / [i915#15867]) -> [SKIP][619] ([i915#15867])
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-270.html
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-rkl:          [SKIP][620] ([i915#14544] / [i915#9906]) -> [SKIP][621] ([i915#9906])
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_vrr@flip-basic-fastset.html
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          [SKIP][622] ([i915#11920]) -> [SKIP][623] ([i915#11920] / [i915#14544])
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-5/igt@kms_vrr@lobf.html
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          [SKIP][624] ([i915#9906]) -> [SKIP][625] ([i915#14544] / [i915#9906])
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-drrs.html
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@perf@mi-rpc:
    - shard-rkl:          [SKIP][626] ([i915#2434]) -> [SKIP][627] ([i915#14544] / [i915#2434])
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-4/igt@perf@mi-rpc.html
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@perf@mi-rpc.html

  * igt@perf_pmu@module-unload:
    - shard-dg1:          [ABORT][628] ([i915#15778]) -> [ABORT][629] ([i915#13029] / [i915#15778])
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg1-19/igt@perf_pmu@module-unload.html
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-18/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-rkl:          [SKIP][630] ([i915#14544] / [i915#8516]) -> [SKIP][631] ([i915#8516])
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@perf_pmu@rc6-all-gts.html

  
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13705]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15106]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15152
  [i915#15172]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15172
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
  [i915#15560]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15560
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672
  [i915#15678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
  [i915#15751]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15751
  [i915#15768]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15768
  [i915#15778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778
  [i915#15804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15804
  [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15931]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#15997]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15997
  [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
  [i915#16066]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16066
  [i915#16077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16077
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16109]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16119]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16119
  [i915#16175]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16175
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479
  [i915#16490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
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
  [i915#3359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
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
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
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
  [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6645
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
  [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
  [i915#9979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8991 -> IGTPW_15475

  CI-20190529: 20190529
  CI_DRM_18772: 6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15475: 494d62c37d91a0a925fc14d37c7aa1bfbdc3f0e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8991: c5721520bb6611ab8fcbe27db0c120b72d25b99e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/index.html

--===============3546113045430384402==
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
<tr><td><b>Series:</b></td><td>series starting with [1/6] lib: Add generic platform filtering framework</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169903/">https://patchwork.freedesktop.org/series/169903/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8991_full -&gt; IGTPW_15475_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15475_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15475_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15475_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-3/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@i915_selftest@live.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-tglu-7/igt@i915_selftest@live@mman.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-6/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8991_full and IGTPW_15475_full:</p>
<h3>New IGT tests (41)</h3>
<ul>
<li>
<p>igt@api_intel_allocator@reloc-allocator@fork-reopen-allocator:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@simple-allocator@fork-reopen-allocator:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@execute-allforone:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@execute-one:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.39, 4.27] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@execute-oneforall:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.12, 0.75] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@independent:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.03, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@vm:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.03, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@create-shared-gtt:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@detached-shared-gtt:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@disjoint-timelines:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-smoketest-all:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 32.35] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@single-timeline:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>Statuses : 3 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 32.49] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 4.38] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>Statuses : 3 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 32.45] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>Statuses : 3 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 14.82] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>Statuses : 3 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 4.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@busy:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@full:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.66] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@full-late:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.75] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@full-late-pulse:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.14] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@full-pulse:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.99] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@indices:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.55] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@individual:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.38] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-balancer:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.50] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@nop:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 49.65] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@semaphore:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.36] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@smoke:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 23.78] s</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill@smem:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@create-ext:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@execbuf:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@invalid-create:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@invalid-destroy:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@isolation:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@ring:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.70, 1.70] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf@migrate:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [1.37, 4.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-d-edp-1-ctm:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-d-edp-1-degamma:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-d-edp-1-gamma:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15475_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@api_intel_bb@crc32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-6/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_buddy@drm_buddy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@drm_buddy@drm_buddy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678">i915#15678</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-17/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-3/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-9/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-5/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-12/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-5/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-10/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual (NEW):</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-14/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-6/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-9/igt@gem_exec_balancer@parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@gem_exec_capture@capture-invisible@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-14/igt@gem_exec_fence@submit3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-8/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107">i915#5107</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107">i915#5107</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@gem_exec_reloc@basic-concurrent0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-14/igt@gem_exec_reloc@basic-gtt-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-6/igt@gem_exec_reloc@basic-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@gem_exec_schedule@preempt-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-8/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-1/igt@gem_exec_suspend@basic-s0@lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-1/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-y:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-14/igt@gem_fence_thrash@bo-write-verify-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-10/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@gem_lmem_swapping@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk4/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-exec:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-7/igt@gem_madvise@dontneed-before-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-short:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-8/igt@gem_mmap_gtt@basic-short.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@flink-race:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-13/igt@gem_mmap_gtt@flink-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@medium-copy-xy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-8/igt@gem_mmap_gtt@medium-copy-xy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@fault-concurrent:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-14/igt@gem_mmap_wc@fault-concurrent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read-write-distinct:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@gem_mmap_wc@read-write-distinct.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read-distinct:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@gem_mmap_wc@write-read-distinct.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@gem_partial_pwrite_pread@write-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-14/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-1/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-snb6/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-10/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-self:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@gem_pwrite@basic-self.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-15/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@gem_render_copy@linear-to-vebox-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-7/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-14/igt@gem_set_tiling_vs_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@gem_softpin@evict-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885">i915#4885</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-7/igt@gem_softpin@evict-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885">i915#4885</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@gem_softpin@evict-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-13/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-10/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-5/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-7/igt@gem_workarounds@suspend-resume-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-10/igt@gem_workarounds@suspend-resume-fd.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15152">i915#15152</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk11/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586">i915#14586</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk10/igt@gen7_exec_parse@bitmasks.html">SKIP</a> +314 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-12/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-7/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-7/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-3/igt@gen9_exec_parse@bb-secure.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-7/igt@i915_drm_fdinfo@all-busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-12/igt@i915_drm_fdinfo@all-busy-idle-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-15/igt@i915_drm_fdinfo@busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527">i915#11527</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all@ccs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-8/igt@i915_drm_fdinfo@busy-check-all@ccs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527">i915#11527</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all@vecs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@i915_drm_fdinfo@busy-check-all@vecs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527">i915#11527</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@rcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-15/igt@i915_drm_fdinfo@busy@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-5/igt@i915_drm_fdinfo@busy@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-1/igt@i915_drm_fdinfo@busy@vecs1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@i915_drm_fdinfo@virtual-busy-idle-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@i915_module_load@fault-injection@__uc_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@i915_module_load@fault-injection@intel_connector_register.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-8/igt@i915_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-7/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-16/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790">i915#13790</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681">i915#2681</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk11/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-12/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-1/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109">i915#16109</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-mtlp-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15560">i915#15560</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-3/igt@i915_selftest@live@gem_contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@i915_selftest@live@gem_contexts.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16077">i915#16077</a>)</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-tglu-7/igt@i915_selftest@live@gem_contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-6/igt@i915_selftest@live@gem_contexts.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16077">i915#16077</a>)</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-mtlp-2/igt@i915_selftest@live@gem_contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@i915_selftest@live@gem_contexts.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16077">i915#16077</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-8/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443">i915#7443</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-4/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6645">i915#6645</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk9/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-16/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-4/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-mtlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-9/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-8/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +9 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-13/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-7/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187">i915#6187</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk11/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +116 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-10/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +231 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +77 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-4/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-8/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781">i915#13781</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-6/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-1/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-14/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979">i915#9979</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-16/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-7/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-2/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-15/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-7/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-14/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-7/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-5/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-4/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-14/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16119">i915#16119</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-1/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15804">i915#15804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-10/igt@kms_dp_aux_dev@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-12/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-12/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-5/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-10/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-1/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-9/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-13/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-10/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-5/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-7/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@kms_fence_pin_leak.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-8/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-12/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-7/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk3/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk9/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-2/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-8/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-tglu-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk6/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-mtlp-2/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-7/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826">i915#10826</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-mtlp-2/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-1/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672">i915#15672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +10 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-12/igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-1/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +31 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> +437 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-1/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> +103 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-2/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> +79 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-snb6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +156 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-17/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_hdr@static-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-5/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705">i915#13705</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705">i915#13705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-5/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-10/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_plane@pixel-format-yf-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk6/igt@kms_plane_alpha_blend@constant-alpha-max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk6/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-7/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-5/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-18/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-9/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-1/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-8/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15751">i915#15751</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479">i915#16479</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-17/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361">i915#3361</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479">i915#16479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-7/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg1-17/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-16/igt@kms_pm_rpm@i2c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-12/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-3/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#14419</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk8/igt@kms_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553">i915#10553</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-snb1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-13/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-10/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk11/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk10/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-4/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-15/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +11 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-8/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-4/igt@kms_psr@psr2-primary-mmap-gtt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-19/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk1/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-2/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config-invalid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-8/igt@perf@global-sseu-config-invalid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-7/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#15778</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-check-all@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-mtlp-2/igt@perf_pmu@most-busy-check-all@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-1/igt@perf_pmu@most-busy-check-all@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15997">i915#15997</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-1/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-15/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-3/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-8/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-6/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-7/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-12/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-5/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16066">i915#16066</a>) +18 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-7/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16066">i915#16066</a>) +8 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-3/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-5/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_cs_tlb@engines@vcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg1-19/igt@gem_cs_tlb@engines@vcs0.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-12/igt@gem_cs_tlb@engines@vcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-tglu-6/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363">i915#13363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-3/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@pi-ringfull@ccs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-1/igt@gem_exec_schedule@pi-ringfull@ccs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562">i915#13562</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@gem_exec_schedule@pi-ringfull@ccs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-1/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-1/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-4/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@gem_workarounds@suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-glk8/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15172">i915#15172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk1/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-glk4/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk6/igt@i915_suspend@fence-restore-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-tglu-7/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-10/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg1-15/igt@kms_flip@basic-flip-vs-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-14/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-mtlp-4/igt@kms_flip_tiling@flip-change-tiling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16175">i915#16175</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-6/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-cc-to-x:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-mtlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-cc-to-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16175">i915#16175</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-cc-to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-x:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-mtlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-glk9/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-10/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a></li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-tglu-6/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i915#15106</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-tglu-7/igt@kms_setmode@basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-1/igt@kms_vblank@ts-continuation-dpms-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-5/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-2/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-1/igt@gem_ctx_isolation@preservation-s3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-8/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-active:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@gem_exec_reloc@basic-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@gem_exec_reloc@basic-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-active:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-gtt-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-gtt-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-8/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-7/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-8/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-2/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-2/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-3/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-10/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-10/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359">i915#3359</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-3/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15768">i915#15768</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15804">i915#15804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878">i915#9878</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-1/igt@kms_fbcon_fbt@fbc-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-4/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-1/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-glk8/igt@kms_frontbuffer_tracking@hdr-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056">i915#16056</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-glk4/igt@kms_frontbuffer_tracking@hdr-suspend.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1187</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490">i915#16490</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-mtlp-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490">i915#16490</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-2/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg1-18/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-13/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-8/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-3/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-5/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-5/igt@kms_psr@pr-cursor-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_psr@pr-cursor-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-10/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-1/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-5/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-4/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-6/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-dg1-19/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#15778</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-dg1-18/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#15778</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8991/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15475/shard-rkl-5/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8991 -&gt; IGTPW_15475</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18772: 6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15475: 494d62c37d91a0a925fc14d37c7aa1bfbdc3f0e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8991: c5721520bb6611ab8fcbe27db0c120b72d25b99e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3546113045430384402==--
