Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0A5D68BD8
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 03:50:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5BC10E1B7;
	Thu, 18 Dec 2025 03:50:26 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344AC10E11C;
 Thu, 18 Dec 2025 03:50:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8337009157291420551=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Panthor_tests_for_huge_p?=
 =?utf-8?q?artial_unmaps_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 18 Dec 2025 03:50:25 -0000
Message-ID: <176602982520.98733.18404471541099896986@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251217215909.710730-1-adrian.larumbe@collabora.com>
In-Reply-To: <20251217215909.710730-1-adrian.larumbe@collabora.com>
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

--===============8337009157291420551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Panthor tests for huge partial unmaps (rev3)
URL   : https://patchwork.freedesktop.org/series/158975/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_17699_full -> IGTPW_14232_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14232_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14232_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14232_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1:
    - shard-tglu:         [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-tglu-7/igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-5/igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1.html

  * igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1:
    - shard-tglu:         [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-tglu-7/igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-5/igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-2/igt@kms_joiner@basic-big-joiner.html

  * igt@sysfs_timeslice_duration@timeout@vecs0:
    - shard-mtlp:         [PASS][6] -> [ABORT][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-mtlp-2/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-3/igt@sysfs_timeslice_duration@timeout@vecs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_17699_full and IGTPW_14232_full:

### New IGT tests (35) ###

  * igt@kms_flip@basic-write-read-noreloc:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip@busy-check-all:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip@display-4x:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip@lease-uevent:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip@multi-wait-submitted:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip@plane-panning-bottom-right-suspend:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip@preservation:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip@psr-1p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip@stress-xrgb8888-xtiled:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip@stress-xrgb8888-xtiled@b-hdmi-a1:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@atomic-fastset:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@basic-blt:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@basic-crc-vgem:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@cursor-alpha-transparent:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@cursor-rapid-movement-128x128:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@destroy-bb:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@double-destroy:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@fbc-1p-indfb-fliptrack-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@invalid-set-prop:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@invalid-transfer-non-existent-point:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@plane-position-covered:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@pr-cursor-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@psr-cursor-render:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@psr-rgb101010-draw-render:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@secure-non-master:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@single-wait-all-for-submit-signaled:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@single-wait-for-submit-submitted:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@sync_merge_invalid:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@system-suspend-execbuf:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@unprivileged-single-ctx-counters:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@x-tiled-addfb:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_14232_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-tglu:         NOTRUN -> [SKIP][8] ([i915#6230])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-2/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#8411]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-8/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@drm_buddy@drm_buddy:
    - shard-glk:          NOTRUN -> [DMESG-WARN][10] ([i915#15095]) +1 other test dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk6/igt@drm_buddy@drm_buddy.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#7697])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-8/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][12] ([i915#3555] / [i915#9323])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-5/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#3555] / [i915#9323])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-14/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu-1:       NOTRUN -> [SKIP][14] ([i915#7697])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][15] ([i915#13356]) +1 other test incomplete
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk10/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#8555])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-many.html
    - shard-mtlp:         NOTRUN -> [SKIP][17] ([i915#8555]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-5/igt@gem_ctx_persistence@heartbeat-many.html
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#8555])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-7/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#280])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#280])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#280])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-tglu:         NOTRUN -> [SKIP][22] ([i915#280])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-10/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#280])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-8/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#4771])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@gem_exec_balancer@bonded-pair.html
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#4771])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#4036])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-1/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-tglu-1:       NOTRUN -> [SKIP][27] ([i915#6334]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#4812])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-11/igt@gem_exec_fence@submit3.html
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#4812]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-19/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#3539] / [i915#4852])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-16/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#5107])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-3/igt@gem_exec_params@rsvd2-dirt.html
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#5107])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-11/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#3281]) +6 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-1/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-mtlp:         NOTRUN -> [SKIP][34] ([i915#3281])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-3/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#3281]) +6 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#14544] / [i915#3281])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#3281]) +5 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-12/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#4537] / [i915#4812])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-8/igt@gem_exec_schedule@preempt-queue-chain.html
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#4537] / [i915#4812])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-rkl:          [PASS][40] -> [INCOMPLETE][41] ([i915#13356]) +1 other test incomplete
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@gem_exec_suspend@basic-s3.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-glk:          NOTRUN -> [INCOMPLETE][42] ([i915#13196] / [i915#13356]) +1 other test incomplete
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk8/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#4860])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-14/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#2190])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#4613]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-1/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-tglu-1:       NOTRUN -> [SKIP][46] ([i915#4613]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@random:
    - shard-glk:          NOTRUN -> [SKIP][47] ([i915#4613]) +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk6/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#12193])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-14/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4565])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-14/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_media_vme:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#284])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-8/igt@gem_media_vme.html
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#284])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@gem_media_vme.html
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#284])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@gem_media_vme.html

  * igt@gem_mmap@bad-object:
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4083])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-5/igt@gem_mmap@bad-object.html

  * igt@gem_mmap@bad-offset:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4083])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-3/igt@gem_mmap@bad-offset.html

  * igt@gem_mmap_gtt@medium-copy:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4077]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-16/igt@gem_mmap_gtt@medium-copy.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#3282]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-3/igt@gem_partial_pwrite_pread@reads-uncached.html
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#3282]) +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-19/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#3282]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][59] ([i915#2658])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-4/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-rkl:          [PASS][60] -> [SKIP][61] ([i915#4270])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-off-1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4270])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4270]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-12/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_readwrite@write-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#3282]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-5/igt@gem_readwrite@write-bad-handle.html
    - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#14544] / [i915#3282])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@gem_readwrite@write-bad-handle.html

  * igt@gem_render_copy@y-tiled-ccs-to-linear:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#5190] / [i915#8428]) +4 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-6/igt@gem_render_copy@y-tiled-ccs-to-linear.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#8428]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-4/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs.html

  * igt@gem_userptr_blits@access-control:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#3297])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#3297] / [i915#4880])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#3297])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][71] ([i915#3297])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#3281] / [i915#3297])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-1/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#3297]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          NOTRUN -> [INCOMPLETE][74] ([i915#13356])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk1/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-rkl:          NOTRUN -> [SKIP][75] +17 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [PASS][76] -> [ABORT][77] ([i915#5566])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-glk8/igt@gen9_exec_parse@allowed-single.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk9/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-tglu:         NOTRUN -> [SKIP][78] ([i915#2527] / [i915#2856]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-8/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#2856]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-1/igt@gen9_exec_parse@cmd-crossing-page.html
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#2527])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-17/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#2527])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@gen9_exec_parse@shadow-peek.html
    - shard-tglu-1:       NOTRUN -> [SKIP][82] ([i915#2527] / [i915#2856]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#14544] / [i915#2527]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_drm_fdinfo@busy-hang@vcs0:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#14073]) +5 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-16/igt@i915_drm_fdinfo@busy-hang@vcs0.html

  * igt@i915_fb_tiling@basic-x-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#13786])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-4/igt@i915_fb_tiling@basic-x-tiling.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [PASS][86] -> [ABORT][87] ([i915#15342])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#8399])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-2/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#8399])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-9/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-tglu-1:       NOTRUN -> [SKIP][90] ([i915#6590]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#4077]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-7/igt@i915_pm_rpm@gem-evict-pwrite.html
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4077]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#7707])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#4212])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-4/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#4212]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-13/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
    - shard-mtlp:         NOTRUN -> [SKIP][96] ([i915#4212])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][97] ([i915#1769])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#1769] / [i915#3555])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#4538] / [i915#5286]) +4 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][100] ([i915#5286]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#5286]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#14544] / [i915#5286])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][103] ([i915#5286]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#3638])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-1/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][105] +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
    - shard-dg2:          NOTRUN -> [SKIP][106] +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#3638])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#4538] / [i915#5190]) +4 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#5190])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#14544]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#4538]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#12313])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#6095]) +121 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-13/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#6095]) +24 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-edp-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#6095]) +54 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][116] ([i915#6095]) +34 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#12313])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-17/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#10307] / [i915#6095]) +140 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#6095]) +74 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#6095]) +49 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][121] ([i915#12796]) +1 other test incomplete
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk10/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#14098] / [i915#14544] / [i915#6095]) +7 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#12313]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#14544] / [i915#6095]) +12 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#14098] / [i915#6095]) +45 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][126] ([i915#12313])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-tglu:         NOTRUN -> [SKIP][127] ([i915#3742])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-7/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#13781]) +3 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][129] ([i915#3742])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#11151] / [i915#7828]) +4 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][131] ([i915#11151] / [i915#7828]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-9/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
    - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#11151] / [i915#7828]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-7/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-tglu-1:       NOTRUN -> [SKIP][133] ([i915#11151] / [i915#7828]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#11151] / [i915#14544] / [i915#7828]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#11151] / [i915#7828]) +4 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-6/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#11151] / [i915#7828]) +5 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-19/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_color@deep-color:
    - shard-dg2:          [PASS][137] -> [SKIP][138] ([i915#12655] / [i915#3555])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-11/igt@kms_color@deep-color.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-1/igt@kms_color@deep-color.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#3299])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#3299]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-12/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#6944] / [i915#9424])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-3/igt@kms_content_protection@lic-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#6944] / [i915#9424])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-19/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#6944] / [i915#9424]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-tglu-1:       NOTRUN -> [SKIP][144] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu:         NOTRUN -> [FAIL][145] ([i915#13566]) +1 other test fail
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#13049])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][147] -> [FAIL][148] ([i915#13566]) +1 other test fail
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-7/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-2.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#3555])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-13/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#13049]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-6/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#13049]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-17/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#13049])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-6/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#3555])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-8/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-tglu:         [PASS][154] -> [FAIL][155] ([i915#13566]) +1 other test fail
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-5/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-tglu-1:       NOTRUN -> [FAIL][156] ([i915#13566]) +3 other tests fail
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][157] ([i915#8814])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#4103])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][159] ([i915#9809])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#13046] / [i915#5354])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#9067])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-9/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#4103] / [i915#4213])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#4103] / [i915#4213])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-17/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#9723]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#3555] / [i915#3804])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#3804])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#13749])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-2/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#13748])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-8/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#13748])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-8/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#13707])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-tglu-1:       NOTRUN -> [SKIP][171] ([i915#13707])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#3555] / [i915#3840])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-1/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#3840] / [i915#9053])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#3955])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#2065] / [i915#4854])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-7/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#3637] / [i915#9934]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][177] ([i915#3637] / [i915#9934])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#3637] / [i915#9934]) +3 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-10/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#9934]) +3 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#8381])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][181] ([i915#12745] / [i915#4839])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk9/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-snb:          [PASS][182] -> [TIMEOUT][183] ([i915#14033] / [i915#14350])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-snb1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][184] -> [TIMEOUT][185] ([i915#14033])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-snb1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][186] ([i915#4839])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk9/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#9934])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][188] ([i915#12314] / [i915#12745] / [i915#4839] / [i915#6113])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk5/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][189] ([i915#12314] / [i915#12745] / [i915#6113])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk5/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#2672] / [i915#3555] / [i915#8813])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#2672] / [i915#8813])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#2672] / [i915#3555]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#2672]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#2672] / [i915#3555]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#2672]) +3 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#2587] / [i915#2672]) +4 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#2672] / [i915#3555] / [i915#5190])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#2587] / [i915#2672] / [i915#3555])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][199] ([i915#2672] / [i915#3555]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][200] ([i915#2587] / [i915#2672]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#2672] / [i915#3555]) +3 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#2672] / [i915#3555])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][203] ([i915#2587] / [i915#2672])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][204] ([i915#1825]) +12 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
    - shard-tglu:         NOTRUN -> [SKIP][205] +31 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][206] +20 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#1825]) +29 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#8708]) +7 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-dg2:          [PASS][209] -> [FAIL][210] ([i915#6880])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-rkl:          [PASS][211] -> [ABORT][212] ([i915#15132])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#5439])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][214] ([i915#15102]) +6 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#14544] / [i915#15102]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render.html
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#15102]) +2 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#15102] / [i915#3458]) +3 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#15102] / [i915#3458]) +8 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-snb:          NOTRUN -> [SKIP][219] +23 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-snb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#14544] / [i915#1825])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][221] +26 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#15102] / [i915#3023]) +9 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#10433] / [i915#15102] / [i915#3458])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#15102])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#15102]) +17 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#15102]) +3 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#14544] / [i915#15102] / [i915#3023]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#8708]) +7 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-glk10:        NOTRUN -> [SKIP][229] +20 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#5354]) +16 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_hdr@bpc-switch:
    - shard-tglu-1:       NOTRUN -> [SKIP][231] ([i915#3555] / [i915#8228])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#3555] / [i915#8228]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-9/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [ABORT][233] ([i915#15132])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-1/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_hdr@static-swap:
    - shard-dg2:          [PASS][234] -> [SKIP][235] ([i915#3555] / [i915#8228])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-11/igt@kms_hdr@static-swap.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-6/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          [PASS][236] -> [SKIP][237] ([i915#3555] / [i915#8228]) +2 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_hdr@static-toggle.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-8/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#15458])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-13/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][239] ([i915#15458])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-2/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#15460])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-9/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][241] ([i915#15458])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_lease@lease-unleased-crtc:
    - shard-dg1:          [PASS][242] -> [ABORT][243] ([i915#4423]) +1 other test abort
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg1-17/igt@kms_lease@lease-unleased-crtc.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-16/igt@kms_lease@lease-unleased-crtc.html

  * igt@kms_lease@lease-unleased-crtc@pipe-d-hdmi-a-4:
    - shard-dg1:          [PASS][244] -> [DMESG-WARN][245] ([i915#4423]) +3 other tests dmesg-warn
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg1-17/igt@kms_lease@lease-unleased-crtc@pipe-d-hdmi-a-4.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-16/igt@kms_lease@lease-unleased-crtc@pipe-d-hdmi-a-4.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][246] ([i915#12756] / [i915#13409] / [i915#13476]) +1 other test incomplete
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#14712])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#13958])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#13958] / [i915#14544])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#13958])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-13/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#13958])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-4/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#15329]) +4 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-16/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#15329]) +8 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-tglu:         NOTRUN -> [SKIP][254] ([i915#15329] / [i915#3555])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-9/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#15329] / [i915#3555] / [i915#6953])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#15329]) +8 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#5354])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@kms_pm_backlight@bad-brightness.html
    - shard-tglu-1:       NOTRUN -> [SKIP][258] ([i915#9812])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-tglu-1:       NOTRUN -> [SKIP][259] ([i915#9685])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][260] ([i915#4281])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-3/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][261] ([i915#8430])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-10/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [PASS][262] -> [SKIP][263] ([i915#15073]) +2 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-7/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-rkl:          [PASS][264] -> [SKIP][265] ([i915#14544] / [i915#15073])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#15073]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-2/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#15073])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@package-g7:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#14544] / [i915#15403])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_pm_rpm@package-g7.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-dg2:          [PASS][269] -> [INCOMPLETE][270] ([i915#14419])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-5/igt@kms_pm_rpm@system-suspend-idle.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-6/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-rkl:          [PASS][271] -> [INCOMPLETE][272] ([i915#14419])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-8/igt@kms_pm_rpm@system-suspend-modeset.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#6524])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#6524])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-8/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][275] ([i915#11520])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-snb7/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-glk10:        NOTRUN -> [SKIP][276] ([i915#11520])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk10/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#11520]) +2 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#11520] / [i915#14544])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][279] ([i915#11520]) +14 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#11520]) +4 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][281] ([i915#11520]) +4 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#11520]) +3 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-13/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
    - shard-mtlp:         NOTRUN -> [SKIP][283] ([i915#12316])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-8/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][284] ([i915#11520]) +3 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu-1:       NOTRUN -> [SKIP][285] ([i915#9683])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#9683])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-17/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#9683])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-5/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#1072] / [i915#9732]) +7 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-1/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#1072] / [i915#14544] / [i915#9732]) +3 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr-cursor-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][290] ([i915#9732]) +10 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-5/igt@kms_psr@fbc-psr-cursor-mmap-gtt.html

  * igt@kms_psr@fbc-psr-cursor-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#9688]) +5 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-8/igt@kms_psr@fbc-psr-cursor-mmap-gtt@edp-1.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][292] +496 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk9/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html

  * igt@kms_psr@pr-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#1072] / [i915#9732]) +13 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#1072] / [i915#9732]) +11 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-14/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr@psr2-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][295] ([i915#9732]) +8 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#9685])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#5289]) +2 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@basic:
    - shard-snb:          [PASS][298] -> [FAIL][299] ([i915#15106]) +2 other tests fail
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-snb7/igt@kms_setmode@basic.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-snb7/igt@kms_setmode@basic.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-tglu-1:       NOTRUN -> [SKIP][300] ([i915#3555]) +3 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#3555])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][302] ([i915#12276]) +1 other test incomplete
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk1/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu-1:       NOTRUN -> [SKIP][303] ([i915#9906])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][304] ([i915#15243] / [i915#3555])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-2/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#11920])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@kms_vrr@lobf.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#2436])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-1/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-mtlp:         NOTRUN -> [SKIP][307] ([i915#14121]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-7/igt@prime_mmap@test_aperture_limit.html
    - shard-dg2:          NOTRUN -> [SKIP][308] ([i915#14121]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-1/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#14121]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-17/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#3708]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@prime_vgem@basic-fence-flip.html
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#3708])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#3708] / [i915#4077])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-7/igt@prime_vgem@basic-fence-mmap.html

  * igt@sriov_basic@bind-unbind-vf@vf-4:
    - shard-tglu:         NOTRUN -> [FAIL][313] ([i915#12910]) +9 other tests fail
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-7/igt@sriov_basic@bind-unbind-vf@vf-4.html

  * igt@sysfs_timeslice_duration@timeout:
    - shard-mtlp:         [PASS][314] -> [ABORT][315] ([i915#13562])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-mtlp-2/igt@sysfs_timeslice_duration@timeout.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-3/igt@sysfs_timeslice_duration@timeout.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#4818])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@tools_test@sysfs_l3_parity.html
    - shard-dg2:          NOTRUN -> [SKIP][317] ([i915#4818])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          [FAIL][318] ([i915#15454]) -> [PASS][319]
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-3/igt@gem_create@create-ext-cpu-access-big.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [INCOMPLETE][320] ([i915#13356]) -> [PASS][321] +1 other test pass
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-7/igt@gem_exec_suspend@basic-s0@smem.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-4/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_lmem_swapping@massive:
    - shard-dg2:          [FAIL][322] ([i915#15452]) -> [PASS][323] +1 other test pass
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-3/igt@gem_lmem_swapping@massive.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-3/igt@gem_lmem_swapping@massive.html

  * igt@i915_module_load@reload-no-display:
    - shard-dg1:          [DMESG-WARN][324] ([i915#13029] / [i915#14545]) -> [PASS][325]
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg1-14/igt@i915_module_load@reload-no-display.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-14/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [ABORT][326] ([i915#15342]) -> [PASS][327]
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live@workarounds:
    - shard-dg2:          [DMESG-FAIL][328] ([i915#12061]) -> [PASS][329] +1 other test pass
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-11/igt@i915_selftest@live@workarounds.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-3/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-rkl:          [INCOMPLETE][330] ([i915#4817]) -> [PASS][331]
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_async_flips@async-flip-hang:
    - shard-snb:          [INCOMPLETE][332] -> [PASS][333] +1 other test pass
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-snb6/igt@kms_async_flips@async-flip-hang.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-snb1/igt@kms_async_flips@async-flip-hang.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [INCOMPLETE][334] ([i915#12796]) -> [PASS][335] +1 other test pass
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-rkl:          [FAIL][336] ([i915#13566]) -> [PASS][337]
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-2/igt@kms_cursor_crc@cursor-random-64x21.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@kms_cursor_crc@cursor-random-64x21.html
    - shard-tglu:         [FAIL][338] ([i915#13566]) -> [PASS][339] +3 other tests pass
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-tglu-5/igt@kms_cursor_crc@cursor-random-64x21.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-6/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          [SKIP][340] ([i915#3555] / [i915#8228]) -> [PASS][341]
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-1/igt@kms_hdr@invalid-metadata-sizes.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-11/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2:          [SKIP][342] ([i915#15459]) -> [PASS][343]
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-11/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [SKIP][344] ([i915#15073]) -> [PASS][345] +1 other test pass
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg1:          [DMESG-WARN][346] ([i915#4423]) -> [PASS][347] +1 other test pass
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg1-18/igt@kms_pm_rpm@i2c.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-19/igt@kms_pm_rpm@i2c.html

  * igt@kms_setmode@basic:
    - shard-rkl:          [FAIL][348] ([i915#15106]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-2/igt@kms_setmode@basic.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-mtlp:         [FAIL][350] ([i915#15106]) -> [PASS][351] +2 other tests pass
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-mtlp-2/igt@kms_setmode@basic@pipe-b-edp-1.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-8/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@basic@pipe-b-hdmi-a-3:
    - shard-dg2:          [FAIL][352] ([i915#15106]) -> [PASS][353] +2 other tests pass
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-5/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-rkl:          [SKIP][354] ([i915#8411]) -> [SKIP][355] ([i915#14544] / [i915#8411])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-7/igt@api_intel_bb@blit-reloc-keep-cache.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@crc32:
    - shard-rkl:          [SKIP][356] ([i915#14544] / [i915#6230]) -> [SKIP][357] ([i915#6230])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@api_intel_bb@crc32.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-2/igt@api_intel_bb@crc32.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          [SKIP][358] ([i915#11078]) -> [SKIP][359] ([i915#11078] / [i915#14544]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-1/igt@device_reset@unbind-cold-reset-rebind.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          [SKIP][360] ([i915#14544] / [i915#3555] / [i915#9323]) -> [SKIP][361] ([i915#3555] / [i915#9323])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-8/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_exec_balancer@parallel:
    - shard-rkl:          [SKIP][362] ([i915#14544] / [i915#4525]) -> [SKIP][363] ([i915#4525])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@gem_exec_balancer@parallel.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          [SKIP][364] ([i915#4525]) -> [SKIP][365] ([i915#14544] / [i915#4525]) +2 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-4/igt@gem_exec_balancer@parallel-balancer.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          [SKIP][366] ([i915#14544] / [i915#6344]) -> [SKIP][367] ([i915#6344])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_reloc@basic-scanout:
    - shard-rkl:          [SKIP][368] ([i915#3281]) -> [SKIP][369] ([i915#14544] / [i915#3281]) +5 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-8/igt@gem_exec_reloc@basic-scanout.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@gem_exec_reloc@basic-scanout.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-rkl:          [SKIP][370] ([i915#14544] / [i915#3281]) -> [SKIP][371] ([i915#3281]) +2 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@gem_exec_reloc@basic-softpin.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-2/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-rkl:          [SKIP][372] ([i915#4613]) -> [SKIP][373] ([i915#14544] / [i915#4613]) +1 other test skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-multi.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          [SKIP][374] ([i915#14544] / [i915#4613]) -> [SKIP][375] ([i915#4613])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_pread@uncached:
    - shard-rkl:          [SKIP][376] ([i915#14544] / [i915#3282]) -> [SKIP][377] ([i915#3282]) +2 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@gem_pread@uncached.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@gem_pread@uncached.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          [SKIP][378] ([i915#13717]) -> [SKIP][379] ([i915#13717] / [i915#14544])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-context.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_softpin@evict-snoop:
    - shard-rkl:          [SKIP][380] ([i915#14544]) -> [SKIP][381] +3 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@gem_softpin@evict-snoop.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-rkl:          [SKIP][382] ([i915#3282]) -> [SKIP][383] ([i915#14544] / [i915#3282]) +4 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-8/igt@gem_tiled_partial_pwrite_pread@writes.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-rkl:          [SKIP][384] ([i915#3297]) -> [SKIP][385] ([i915#14544] / [i915#3297]) +1 other test skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-8/igt@gem_userptr_blits@coherency-sync.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@gem_userptr_blits@coherency-sync.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          [SKIP][386] ([i915#2527]) -> [SKIP][387] ([i915#14544] / [i915#2527]) +3 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-8/igt@gen9_exec_parse@bb-start-out.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-rkl:          [SKIP][388] ([i915#14544] / [i915#2527]) -> [SKIP][389] ([i915#2527]) +1 other test skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-8/igt@gen9_exec_parse@secure-batches.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          [SKIP][390] ([i915#5286]) -> [SKIP][391] ([i915#14544] / [i915#5286]) +3 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-rkl:          [SKIP][392] ([i915#14544] / [i915#5286]) -> [SKIP][393] ([i915#5286]) +1 other test skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-rkl:          [SKIP][394] ([i915#3638]) -> [SKIP][395] ([i915#14544] / [i915#3638]) +3 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-rkl:          [SKIP][396] ([i915#14544] / [i915#3638]) -> [SKIP][397] ([i915#3638]) +1 other test skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-rkl:          [SKIP][398] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][399] ([i915#14098] / [i915#6095]) +8 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][400] ([i915#14544] / [i915#6095]) -> [SKIP][401] ([i915#6095]) +7 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][402] ([i915#12313]) -> [SKIP][403] ([i915#12313] / [i915#14544]) +1 other test skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][404] ([i915#6095]) -> [SKIP][405] ([i915#14544] / [i915#6095]) +3 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          [SKIP][406] ([i915#14098] / [i915#6095]) -> [SKIP][407] ([i915#14098] / [i915#14544] / [i915#6095]) +9 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          [SKIP][408] ([i915#6095]) -> [SKIP][409] ([i915#4423] / [i915#6095]) +1 other test skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg1-19/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-4.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-14/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          [SKIP][410] ([i915#14544] / [i915#3742]) -> [SKIP][411] ([i915#3742])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_cdclk@mode-transition.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-2/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-rkl:          [SKIP][412] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][413] ([i915#11151] / [i915#7828]) +3 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_chamelium_frames@dp-crc-fast.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-dg1:          [SKIP][414] ([i915#11151] / [i915#7828]) -> [SKIP][415] ([i915#11151] / [i915#4423] / [i915#7828])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg1-12/igt@kms_chamelium_frames@hdmi-crc-single.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-17/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          [SKIP][416] ([i915#11151] / [i915#7828]) -> [SKIP][417] ([i915#11151] / [i915#14544] / [i915#7828]) +3 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-3/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@atomic:
    - shard-rkl:          [SKIP][418] ([i915#14544] / [i915#6944] / [i915#7118] / [i915#9424]) -> [SKIP][419] ([i915#6944] / [i915#7118] / [i915#9424])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_content_protection@atomic.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-rkl:          [SKIP][420] ([i915#6944] / [i915#7118] / [i915#9424]) -> [SKIP][421] ([i915#14544] / [i915#6944] / [i915#7118] / [i915#9424])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-4/igt@kms_content_protection@atomic-dpms.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-rkl:          [SKIP][422] ([i915#6944] / [i915#9424]) -> [SKIP][423] ([i915#14544] / [i915#6944] / [i915#9424])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-7/igt@kms_content_protection@content-type-change.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_content_protection@content-type-change.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-rkl:          [SKIP][424] ([i915#13049]) -> [SKIP][425] ([i915#13049] / [i915#14544])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          [SKIP][426] ([i915#3555]) -> [SKIP][427] ([i915#14544] / [i915#3555]) +1 other test skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-rkl:          [SKIP][428] ([i915#14544] / [i915#3555]) -> [SKIP][429] ([i915#3555])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-8/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-rkl:          [SKIP][430] ([i915#13691]) -> [SKIP][431] ([i915#13691] / [i915#14544])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-8/igt@kms_display_modes@extended-mode-basic.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          [SKIP][432] ([i915#13748] / [i915#14544]) -> [SKIP][433] ([i915#13748])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-8/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          [SKIP][434] ([i915#3840]) -> [SKIP][435] ([i915#14544] / [i915#3840])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-1/igt@kms_dsc@dsc-fractional-bpp.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-rkl:          [SKIP][436] ([i915#3555] / [i915#3840]) -> [SKIP][437] ([i915#14544] / [i915#3555] / [i915#3840])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-8/igt@kms_dsc@dsc-with-bpc-formats.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-rkl:          [SKIP][438] ([i915#14544] / [i915#9934]) -> [SKIP][439] ([i915#9934])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          [SKIP][440] ([i915#9934]) -> [SKIP][441] ([i915#14544] / [i915#9934]) +3 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-8/igt@kms_flip@2x-plain-flip-interruptible.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          [SKIP][442] ([i915#2672]) -> [SKIP][443] ([i915#14544] / [i915#2672]) +1 other test skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-rkl:          [SKIP][444] ([i915#2672] / [i915#3555]) -> [SKIP][445] ([i915#14544] / [i915#2672] / [i915#3555]) +1 other test skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          [SKIP][446] ([i915#14544] / [i915#2672] / [i915#3555]) -> [SKIP][447] ([i915#2672] / [i915#3555])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          [SKIP][448] ([i915#14544] / [i915#2672]) -> [SKIP][449] ([i915#2672])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][450] ([i915#1825]) -> [SKIP][451] ([i915#14544] / [i915#1825]) +26 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][452] ([i915#14544] / [i915#1825]) -> [SKIP][453] ([i915#1825]) +9 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][454] ([i915#14544] / [i915#15102]) -> [SKIP][455] ([i915#15102]) +2 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-rkl:          [SKIP][456] ([i915#15102]) -> [SKIP][457] ([i915#14544] / [i915#15102]) +1 other test skip
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-rkl:          [SKIP][458] ([i915#15102] / [i915#3023]) -> [SKIP][459] ([i915#14544] / [i915#15102] / [i915#3023]) +13 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][460] ([i915#10433] / [i915#15102] / [i915#3458]) -> [SKIP][461] ([i915#15102] / [i915#3458])
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][462] -> [SKIP][463] ([i915#14544]) +11 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-stridechange:
    - shard-dg1:          [SKIP][464] ([i915#15102] / [i915#3458]) -> [SKIP][465] ([i915#15102] / [i915#3458] / [i915#4423])
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-rkl:          [SKIP][466] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][467] ([i915#15102] / [i915#3023]) +7 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2:          [SKIP][468] ([i915#15102] / [i915#3458]) -> [SKIP][469] ([i915#10433] / [i915#15102] / [i915#3458]) +3 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-rkl:          [SKIP][470] ([i915#3555] / [i915#8228]) -> [ABORT][471] ([i915#15132])
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-2/igt@kms_hdr@bpc-switch-suspend.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          [SKIP][472] ([i915#12713]) -> [SKIP][473] ([i915#1187] / [i915#12713])
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-2/igt@kms_hdr@brightness-with-hdr.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-rkl:          [SKIP][474] ([i915#15459]) -> [SKIP][475] ([i915#14544] / [i915#15459])
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-7/igt@kms_joiner@basic-force-big-joiner.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          [SKIP][476] ([i915#14544] / [i915#15460]) -> [SKIP][477] ([i915#15460])
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_joiner@invalid-modeset-big-joiner.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          [SKIP][478] ([i915#6301]) -> [SKIP][479] ([i915#14544] / [i915#6301])
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-7/igt@kms_panel_fitting@legacy.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-rkl:          [SKIP][480] ([i915#14544] / [i915#15329] / [i915#3555]) -> [SKIP][481] ([i915#15329] / [i915#3555])
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-rkl:          [SKIP][482] ([i915#14544] / [i915#15329]) -> [SKIP][483] ([i915#15329]) +2 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          [SKIP][484] ([i915#12343]) -> [SKIP][485] ([i915#12343] / [i915#14544])
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-3/igt@kms_pm_backlight@brightness-with-dpms.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          [SKIP][486] ([i915#14544] / [i915#4281]) -> [SKIP][487] ([i915#4281])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][488] ([i915#3828]) -> [SKIP][489] ([i915#9340])
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [SKIP][490] ([i915#15073]) -> [SKIP][491] ([i915#14544] / [i915#15073])
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          [SKIP][492] ([i915#14544] / [i915#6524]) -> [SKIP][493] ([i915#6524])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-8/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          [SKIP][494] ([i915#11520] / [i915#14544]) -> [SKIP][495] ([i915#11520]) +2 other tests skip
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][496] ([i915#11520]) -> [SKIP][497] ([i915#11520] / [i915#14544]) +4 other tests skip
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-rkl:          [SKIP][498] ([i915#14544] / [i915#9683]) -> [SKIP][499] ([i915#9683])
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_psr2_su@page_flip-xrgb8888.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-8/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-dg1:          [SKIP][500] ([i915#1072] / [i915#9732]) -> [SKIP][501] ([i915#1072] / [i915#4423] / [i915#9732])
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg1-17/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-16/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-rkl:          [SKIP][502] ([i915#1072] / [i915#9732]) -> [SKIP][503] ([i915#1072] / [i915#14544] / [i915#9732]) +9 other tests skip
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-4/igt@kms_psr@fbc-psr2-suspend.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-rkl:          [SKIP][504] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][505] ([i915#1072] / [i915#9732]) +4 other tests skip
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_psr@pr-cursor-plane-onoff.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          [SKIP][506] ([i915#8623]) -> [SKIP][507] ([i915#14544] / [i915#8623])
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          [SKIP][508] ([i915#9906]) -> [SKIP][509] ([i915#14544] / [i915#9906])
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-1/igt@kms_vrr@seamless-rr-switch-virtual.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@perf@mi-rpc:
    - shard-rkl:          [SKIP][510] ([i915#2434]) -> [SKIP][511] ([i915#14544] / [i915#2434])
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-3/igt@perf@mi-rpc.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@perf@mi-rpc.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          [SKIP][512] ([i915#14544] / [i915#2435]) -> [SKIP][513] ([i915#2435])
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-2/igt@perf@per-context-mode-unprivileged.html

  * igt@prime_vgem@fence-read-hang:
    - shard-rkl:          [SKIP][514] ([i915#14544] / [i915#3708]) -> [SKIP][515] ([i915#3708])
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@prime_vgem@fence-read-hang.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@prime_vgem@fence-read-hang.html

  
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121
  [i915#14350]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14350
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15095
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15106]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
  [i915#15452]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15452
  [i915#15454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15454
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#4036]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
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
  [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#5107]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8670 -> IGTPW_14232
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_17699: b8b72578c50083961ef150f128e6e8c0c3396864 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14232: 14232
  IGT_8670: 8670
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/index.html

--===============8337009157291420551==
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
<tr><td><b>Series:</b></td><td>Panthor tests for huge partial unmaps (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158975/">https://patchwork.freedesktop.org/series/158975/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_17699_full -&gt; IGTPW_14232_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14232_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_14232_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_14232_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-tglu-7/igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-5/igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-tglu-7/igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-5/igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-2/igt@kms_joiner@basic-big-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-mtlp-2/igt@sysfs_timeslice_duration@timeout@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-3/igt@sysfs_timeslice_duration@timeout@vecs0.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_17699_full and IGTPW_14232_full:</p>
<h3>New IGT tests (35)</h3>
<ul>
<li>
<p>igt@kms_flip@basic-write-read-noreloc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-check-all:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@display-4x:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@lease-uevent:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@multi-wait-submitted:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plane-panning-bottom-right-suspend:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@preservation:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@psr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@stress-xrgb8888-xtiled:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@stress-xrgb8888-xtiled@b-hdmi-a1:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@atomic-fastset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@basic-blt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@basic-crc-vgem:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@cursor-alpha-transparent:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@cursor-rapid-movement-128x128:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@destroy-bb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@double-destroy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@fbc-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@invalid-set-prop:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@invalid-transfer-non-existent-point:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@plane-position-covered:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@pr-cursor-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@psr-cursor-render:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@psr-rgb101010-draw-render:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@secure-non-master:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@single-wait-all-for-submit-signaled:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@single-wait-for-submit-submitted:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@sync_merge_invalid:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@system-suspend-execbuf:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@unprivileged-single-ctx-counters:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@x-tiled-addfb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14232_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-2/igt@api_intel_bb@crc32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-8/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@drm_buddy@drm_buddy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk6/igt@drm_buddy@drm_buddy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15095">i915#15095</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-8/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-5/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-14/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk10/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-5/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-7/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-10/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-8/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-1/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@gem_exec_capture@capture-invisible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-11/igt@gem_exec_fence@submit3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-19/igt@gem_exec_fence@submit3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-16/igt@gem_exec_flush@basic-batch-kernel-default-wb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-3/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107">i915#5107</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-11/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107">i915#5107</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-1/igt@gem_exec_reloc@basic-cpu-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-3/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@gem_exec_reloc@basic-write-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-12/igt@gem_exec_reloc@basic-write-gtt-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-8/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk8/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196">i915#13196</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-14/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-1/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk6/igt@gem_lmem_swapping@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-14/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193">i915#12193</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-14/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-8/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-object:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-5/igt@gem_mmap@bad-object.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-offset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-3/igt@gem_mmap@bad-offset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@medium-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-16/igt@gem_mmap_gtt@medium-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-3/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-19/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-4/igt@gem_pread@exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-off-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-12/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@write-bad-handle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-5/igt@gem_readwrite@write-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@gem_readwrite@write-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-linear:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-6/igt@gem_render_copy@y-tiled-ccs-to-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-4/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@gem_userptr_blits@access-control.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-1/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk1/igt@gem_workarounds@suspend-resume-context.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@gen7_exec_parse@batch-without-end.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-glk8/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk9/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566">i915#5566</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-8/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-1/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-17/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@vcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-16/igt@i915_drm_fdinfo@busy-hang@vcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling@basic-x-tiling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-4/igt@i915_fb_tiling@basic-x-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786">i915#13786</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-2/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-9/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-evict-pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-7/igt@i915_pm_rpm@gem-evict-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@i915_pm_rpm@gem-evict-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-4/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-13/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-1/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> +4 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-13/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +121 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-17/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +140 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +74 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk10/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796">i915#12796</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-7/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781">i915#13781</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-9/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-7/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-6/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-19/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-11/igt@kms_color@deep-color.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-1/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-12/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-3/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-19/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-1/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-7/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-13/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-6/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-17/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-6/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-8/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-128x42.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-5/igt@kms_cursor_crc@cursor-sliding-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-9/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-17/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-2/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-8/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-8/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-1/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-7/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065">i915#2065</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-10/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk9/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-snb1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033">i915#14033</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14350">i915#14350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-snb1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033">i915#14033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk9/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk5/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk5/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html">SKIP</a> +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-snb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-9/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-1/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-11/igt@kms_hdr@static-swap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-6/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_hdr@static-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-8/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-13/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-2/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-9/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg1-17/igt@kms_lease@lease-unleased-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-16/igt@kms_lease@lease-unleased-crtc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg1-17/igt@kms_lease@lease-unleased-crtc@pipe-d-hdmi-a-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-16/igt@kms_lease@lease-unleased-crtc@pipe-d-hdmi-a-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756">i915#12756</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-13/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-4/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-16/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-9/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-3/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281">i915#4281</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-10/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-7/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +2 other tests skip</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-2/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403">i915#15403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-5/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-6/igt@kms_pm_rpm@system-suspend-idle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#14419</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-8/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#14419</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-8/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-snb7/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk10/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-13/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-8/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-17/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-5/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-1/igt@kms_psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-5/igt@kms_psr@fbc-psr-cursor-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-mmap-gtt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-8/igt@kms_psr@fbc-psr-cursor-mmap-gtt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk9/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html">SKIP</a> +496 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-14/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-snb7/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-snb7/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i915#15106</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-glk1/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-2/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-1/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-7/igt@prime_mmap@test_aperture_limit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121">i915#14121</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-1/igt@prime_mmap@test_aperture_limit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121">i915#14121</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-17/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121">i915#14121</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-7/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf@vf-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-7/igt@sriov_basic@bind-unbind-vf@vf-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910">i915#12910</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-mtlp-2/igt@sysfs_timeslice_duration@timeout.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-3/igt@sysfs_timeslice_duration@timeout.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562">i915#13562</a>)</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-18/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818">i915#4818</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818">i915#4818</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-3/igt@gem_create@create-ext-cpu-access-big.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15454">i915#15454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@gem_create@create-ext-cpu-access-big.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-7/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-4/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-3/igt@gem_lmem_swapping@massive.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15452">i915#15452</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-3/igt@gem_lmem_swapping@massive.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg1-14/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-14/igt@i915_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-3/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@i915_suspend@fence-restore-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-hang:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-snb6/igt@kms_async_flips@async-flip-hang.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-snb1/igt@kms_async_flips@async-flip-hang.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796">i915#12796</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-2/igt@kms_cursor_crc@cursor-random-64x21.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@kms_cursor_crc@cursor-random-64x21.html">PASS</a></li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-tglu-5/igt@kms_cursor_crc@cursor-random-64x21.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-6/igt@kms_cursor_crc@cursor-random-64x21.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-1/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-11/igt@kms_hdr@invalid-metadata-sizes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-11/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg1-18/igt@kms_pm_rpm@i2c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-19/igt@kms_pm_rpm@i2c.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-2/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i915#15106</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-mtlp-2/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i915#15106</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-8/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-5/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i915#15106</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-8/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-7/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@api_intel_bb@crc32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">i915#6230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-2/igt@api_intel_bb@crc32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-1/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-8/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@gem_exec_balancer@parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@gem_exec_balancer@parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-4/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344">i915#6344</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-scanout:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-8/igt@gem_exec_reloc@basic-scanout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@gem_exec_reloc@basic-scanout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-softpin:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-2/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@uncached:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@gem_pread@uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@gem_pread@uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@gem_softpin@evict-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@gem_softpin@evict-snoop.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-8/igt@gem_tiled_partial_pwrite_pread@writes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@gem_tiled_partial_pwrite_pread@writes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-8/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-8/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-8/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg1-19/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-14/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-2/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg1-12/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-17/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-3/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-4/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-7/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-8/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-8/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-8/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-1/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-8/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-5/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-8/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-stridechange:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-2/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-1/igt@kms_hdr@bpc-switch-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1187</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-7/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-4/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-7/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-3/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281">i915#4281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281">i915#4281</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-8/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-8/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-dg1-17/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-dg1-16/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-4/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-3/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-1/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-3/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-6/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435">i915#2435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-2/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435">i915#2435</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-rkl-6/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-rkl-7/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8670 -&gt; IGTPW_14232</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17699: b8b72578c50083961ef150f128e6e8c0c3396864 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14232: 14232<br />
  IGT_8670: 8670<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============8337009157291420551==--
