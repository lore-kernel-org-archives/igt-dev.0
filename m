Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6D9CCF9E3
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 21:39:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88FC10EA3F;
	Thu, 30 Oct 2025 21:39:43 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E8F10EA3F;
 Thu, 30 Oct 2025 21:39:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2038103385650530282=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_igt=5Fkms=3A_Rename_igt?=
 =?utf-8?q?=5Fpipe_member_enabled_to_valid?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 30 Oct 2025 21:39:42 -0000
Message-ID: <176186038232.2568.380549967889151370@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251029-rename-igt_pipe-dot-enabled-to-valid-v1-1-2aea1e009732@intel.com>
In-Reply-To: <20251029-rename-igt_pipe-dot-enabled-to-valid-v1-1-2aea1e009732@intel.com>
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

--===============2038103385650530282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: igt_kms: Rename igt_pipe member enabled to valid
URL   : https://patchwork.freedesktop.org/series/156749/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8603_full -> IGTPW_13964_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_13964_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_13964_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13964_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc:
    - shard-mtlp:         NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-5/igt@kms_cursor_crc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
    - shard-dg2-9:        [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html

  
New tests
---------

  New tests have been introduced between IGT_8603_full and IGTPW_13964_full:

### New IGT tests (60) ###

  * igt@kms_cursor_crc@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@allocator-basic:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@bad-brightness:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@basic-wait:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@busy-fence:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@compare-crc-sanitycheck-nv12:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@crc-primary-rotation-180-yf-tiled-ccs:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@crtc-properties-atomic:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@cursora-vs-flipb-toggle:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@enable-vfs-autoprobe-on:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@etime-multi-wait-all-available-unsubmitted-submitted-signaled:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@extended:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@fbc-1p-offscreen-pri-shrfb-draw-render:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@fbc-psr-no-drrs:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@fbc-psr2-dpms:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@fbc-rgb565-draw-mmap-wc:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@fds:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@flip-vs-dpms-off-vs-modeset-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@gt-engine-error:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@heartbeat-stop:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@independent:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@invalid:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@invalid-clone-single-crtc:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@invalid-gamma-lut-sizes:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@invalid-remove-userspace-config:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@invalid-single-wait-all-unsubmitted:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@lease-invalid-crtc:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@map-fixed-invalidate-overlap-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@mmap-offset-banned:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@multi-wait-all-for-submit-signaled:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@multi-wait-available-unsubmitted-signaled:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@parallel:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@plane-scaler-with-clipping-clamping-pixel-formats:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@primary:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@psr-rgb101010-draw-mmap-wc:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@psr-sprite-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@psr2-cursor-blt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@query-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@random-ccs-data-4-tiled-mtl-rc-ccs:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@short-flip-before-cursor-toggle:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@sync_multi_timeline_wait:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@syncobj-timeline-export:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@syncobj-wait:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@wait-for-submit-complex:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@x-tiled-to-vebox-yf-tiled:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_invalid_mode@int-max-clock@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_invalid_mode@int-max-clock@pipe-b-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@int-max-clock@pipe-c-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@int-max-clock@pipe-d-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [26.36] s

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-d-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [25.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_13964_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][4] ([i915#8411]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@crc32:
    - shard-tglu-1:       NOTRUN -> [SKIP][5] ([i915#6230])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@api_intel_bb@crc32.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg2-9:        NOTRUN -> [SKIP][6] ([i915#11078])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@device_reset@cold-reset-bound.html

  * igt@fbdev@unaligned-read:
    - shard-rkl:          [PASS][7] -> [SKIP][8] ([i915#14544] / [i915#2582]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-7/igt@fbdev@unaligned-read.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@fbdev@unaligned-read.html

  * igt@gem_bad_reloc@negative-reloc:
    - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#3281]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@gem_bad_reloc@negative-reloc.html

  * igt@gem_basic@multigpu-create-close:
    - shard-tglu:         NOTRUN -> [SKIP][10] ([i915#7697])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-10/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][11] ([i915#13008])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-5/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][12] ([i915#13356])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-7/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][13] ([i915#12392] / [i915#13356])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-7/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          [PASS][14] -> [INCOMPLETE][15] ([i915#12353]) +1 other test incomplete
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-8/igt@gem_ctx_isolation@preservation-s3.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg2-9:        NOTRUN -> [SKIP][16] ([i915#8555])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#5882]) +7 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2-9:        NOTRUN -> [SKIP][18] ([i915#280])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@unwedge-stress:
    - shard-mtlp:         [PASS][19] -> [SKIP][20] ([i915#15178])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-mtlp-2/igt@gem_eio@unwedge-stress.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-3/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2-9:        NOTRUN -> [SKIP][21] ([i915#4812])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglu:         NOTRUN -> [SKIP][22] ([i915#4525])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-6/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#4525])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-tglu-1:       NOTRUN -> [SKIP][24] ([i915#4525])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_balancer@sliced:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#4812]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-tglu:         NOTRUN -> [SKIP][26] ([i915#6344])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-10/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg2-9:        NOTRUN -> [SKIP][27] ([i915#3539])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#3539] / [i915#4852]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-3/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_flush@basic-wb-ro-default:
    - shard-dg2-9:        NOTRUN -> [SKIP][29] ([i915#3539] / [i915#4852])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_exec_flush@basic-wb-ro-default.html

  * igt@gem_exec_gttfill@basic:
    - shard-rkl:          [PASS][30] -> [DMESG-WARN][31] ([i915#12917] / [i915#12964])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-8/igt@gem_exec_gttfill@basic.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#5107])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-1/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#3281]) +10 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#3281]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-12/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-dg2-9:        NOTRUN -> [SKIP][35] ([i915#3281]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg2-9:        NOTRUN -> [SKIP][36] ([i915#4537] / [i915#4812]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#4537] / [i915#4812])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-tglu-1:       NOTRUN -> [ABORT][38] ([i915#14849]) +1 other test abort
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#4860])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-7/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu-1:       NOTRUN -> [SKIP][40] ([i915#4613] / [i915#7582])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#4613])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][42] ([i915#4613]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-8/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#14544] / [i915#4613])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-glk:          NOTRUN -> [SKIP][44] ([i915#4613])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-glk6/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [PASS][45] -> [TIMEOUT][46] ([i915#5493]) +1 other test timeout
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-7/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][47] ([i915#4613])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#4077]) +11 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4077]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-17/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_gtt@hang-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#4077]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-5/igt@gem_mmap_gtt@hang-busy.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2-9:        NOTRUN -> [SKIP][51] ([i915#4077]) +9 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_wc@coherency:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#4083])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-18/igt@gem_mmap_wc@coherency.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4083]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-3/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@write-cpu-read-wc:
    - shard-dg2-9:        NOTRUN -> [SKIP][54] ([i915#4083]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_mmap_wc@write-cpu-read-wc.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-dg2-9:        NOTRUN -> [SKIP][55] ([i915#3282]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pread@uncached:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#3282]) +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@gem_pread@uncached.html
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#3282]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@gem_pread@uncached.html
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#3282])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-19/igt@gem_pread@uncached.html
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#3282])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-8/igt@gem_pread@uncached.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-dg2-9:        NOTRUN -> [SKIP][60] ([i915#4270]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4270]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-1/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
    - shard-rkl:          NOTRUN -> [TIMEOUT][62] ([i915#12964])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu-1:       NOTRUN -> [SKIP][63] ([i915#13398])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          [PASS][64] -> [TIMEOUT][65] ([i915#12917] / [i915#12964]) +2 other tests timeout
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-on.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_render_copy@y-tiled-ccs-to-linear:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#5190] / [i915#8428]) +6 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@gem_render_copy@y-tiled-ccs-to-linear.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
    - shard-dg2-9:        NOTRUN -> [SKIP][67] ([i915#5190] / [i915#8428]) +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2-9:        NOTRUN -> [SKIP][68] ([i915#4079]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4885])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-17/igt@gem_softpin@evict-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#4885])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-2/igt@gem_softpin@evict-snoop.html
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#4885])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_pread_basic:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4079]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@gem_tiled_pread_basic.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#3297]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-tglu-1:       NOTRUN -> [SKIP][74] ([i915#3297])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][75] ([i915#3297] / [i915#3323])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-9/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#14544] / [i915#3297] / [i915#3323])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2-9:        NOTRUN -> [SKIP][77] ([i915#3297])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2-9:        NOTRUN -> [SKIP][78] ([i915#3297] / [i915#4880])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#3297])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@gem_userptr_blits@readonly-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#3297]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-16/igt@gem_userptr_blits@readonly-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#3297])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-2/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-tglu:         NOTRUN -> [SKIP][82] ([i915#3297]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-10/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_workarounds@suspend-resume:
    - shard-dg2:          [PASS][83] -> [ABORT][84] ([i915#15069])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-7/igt@gem_workarounds@suspend-resume.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-10/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-dg2-9:        NOTRUN -> [SKIP][85] ([i915#2856])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][86] ([i915#2527] / [i915#2856]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-10/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#2856]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-7/igt@gen9_exec_parse@valid-registers.html
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#2527])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_drm_fdinfo@busy-hang@vecs0:
    - shard-dg2-9:        NOTRUN -> [SKIP][89] ([i915#14073]) +7 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@i915_drm_fdinfo@busy-hang@vecs0.html

  * igt@i915_drm_fdinfo@busy-idle-check-all@ccs0:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#11527]) +7 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@i915_drm_fdinfo@busy-idle-check-all@ccs0.html

  * igt@i915_drm_fdinfo@most-busy-idle-check-all:
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#14073]) +6 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-7/igt@i915_drm_fdinfo@most-busy-idle-check-all.html

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs0:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#14073]) +5 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-12/igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs0.html

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#14073]) +15 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@i915_drm_fdinfo@virtual-busy-hang:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#14118])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-7/igt@i915_drm_fdinfo@virtual-busy-hang.html

  * igt@i915_drm_fdinfo@virtual-busy-idle-all:
    - shard-dg2-9:        NOTRUN -> [SKIP][95] ([i915#14118])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@i915_drm_fdinfo@virtual-busy-idle-all.html

  * igt@i915_module_load@reload-no-display:
    - shard-dg2:          [PASS][96] -> [DMESG-WARN][97] ([i915#13029] / [i915#14545])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-4/igt@i915_module_load@reload-no-display.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [PASS][98] -> [DMESG-WARN][99] ([i915#12964]) +34 other tests dmesg-warn
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [PASS][100] -> [INCOMPLETE][101] ([i915#13356] / [i915#13820]) +1 other test incomplete
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-8/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [PASS][102] -> [FAIL][103] ([i915#12964]) +1 other test fail
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         [PASS][104] -> [WARN][105] ([i915#13790] / [i915#2681]) +1 other test warn
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-fence.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@debugfs-read:
    - shard-rkl:          [PASS][106] -> [SKIP][107] ([i915#13328])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-2/igt@i915_pm_rpm@debugfs-read.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@i915_pm_rpm@debugfs-read.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#13328] / [i915#14544])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2-9:        NOTRUN -> [SKIP][109] ([i915#11681] / [i915#6621])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#11681])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-3/igt@i915_pm_rps@thresholds.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglu:         NOTRUN -> [SKIP][111] ([i915#4387])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-8/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#5723])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-16/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@live:
    - shard-rkl:          [PASS][113] -> [DMESG-FAIL][114] ([i915#12964]) +1 other test dmesg-fail
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-8/igt@i915_selftest@live.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@i915_selftest@live.html

  * igt@i915_suspend@debugfs-reader:
    - shard-rkl:          [PASS][115] -> [INCOMPLETE][116] ([i915#4817])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-2/igt@i915_suspend@debugfs-reader.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          NOTRUN -> [INCOMPLETE][117] ([i915#4817]) +1 other test incomplete
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-glk5/igt@i915_suspend@forcewake.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu-1:       NOTRUN -> [SKIP][118] ([i915#7707])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#4212])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-4/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#4212])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-15/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#4212]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg2-9:        NOTRUN -> [SKIP][122] ([i915#4212])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][123] ([i915#12761])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-glk1/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][124] ([i915#12761] / [i915#14995])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-glk1/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#1769] / [i915#3555])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-glk10:        NOTRUN -> [SKIP][126] ([i915#1769])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-glk10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-dg2:          NOTRUN -> [FAIL][127] ([i915#5956]) +1 other test fail
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#5286]) +4 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-6/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-9:        NOTRUN -> [SKIP][129] +6 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][130] ([i915#5286]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#5286]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#4538] / [i915#5286]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [PASS][133] -> [FAIL][134] ([i915#5138]) +2 other tests fail
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#3638])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#3638])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-12/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][137] +9 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg2-9:        NOTRUN -> [SKIP][138] ([i915#4538] / [i915#5190]) +7 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#5190]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-mtlp:         NOTRUN -> [SKIP][140] ([i915#6187])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#4538] / [i915#5190]) +7 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][142] +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#4538])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [SKIP][144] +114 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-glk10/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-9:        NOTRUN -> [SKIP][145] ([i915#12313])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#14098] / [i915#6095]) +41 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#12313]) +2 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:
    - shard-dg2-9:        NOTRUN -> [SKIP][149] ([i915#10307] / [i915#6095]) +39 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][150] ([i915#6095]) +9 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#6095]) +39 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#12805])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#6095]) +110 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-16/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-4.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#6095]) +17 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][155] ([i915#12313]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#10307] / [i915#6095]) +96 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][157] ([i915#12964]) +14 other tests dmesg-warn
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#12313]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-3/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#6095]) +69 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-8/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#3742])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#13781]) +4 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#13783]) +4 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-dg2-9:        NOTRUN -> [SKIP][163] ([i915#11151] / [i915#7828]) +6 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-mtlp:         NOTRUN -> [SKIP][164] +2 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-6/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-glk:          NOTRUN -> [SKIP][165] +83 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-glk5/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#11151] / [i915#7828]) +5 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#11151] / [i915#7828]) +11 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-tglu-1:       NOTRUN -> [SKIP][168] ([i915#11151] / [i915#7828]) +3 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#11151] / [i915#7828]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-7/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#11151] / [i915#7828]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#11151] / [i915#7828])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-16/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#3299]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-9:        NOTRUN -> [SKIP][173] ([i915#3299])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#3116] / [i915#3299])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#7118] / [i915#9424])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#13049]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-9:        NOTRUN -> [SKIP][177] ([i915#13049]) +2 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-rkl:          [PASS][178] -> [SKIP][179] ([i915#14544]) +22 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-256x256.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][180] ([i915#13049])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#3555]) +6 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-1/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#3555])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-tglu:         [PASS][183] -> [FAIL][184] ([i915#13566]) +9 other tests fail
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-tglu-6/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][185] ([i915#13566]) +3 other tests fail
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-rkl:          [PASS][186] -> [FAIL][187] ([i915#13566]) +1 other test fail
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#4103])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - shard-rkl:          [PASS][189] -> [SKIP][190] ([i915#11190] / [i915#14544]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-3/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-dg2-9:        NOTRUN -> [SKIP][191] ([i915#13046] / [i915#5354]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-9:        NOTRUN -> [SKIP][192] ([i915#4103] / [i915#4213])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#9723])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#9833])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#3804])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev:
    - shard-tglu-1:       NOTRUN -> [SKIP][196] ([i915#1257])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-tglu-1:       NOTRUN -> [SKIP][197] ([i915#13748])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_dp_link_training@uhbr-sst.html
    - shard-dg2-9:        NOTRUN -> [SKIP][198] ([i915#13748])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#13707])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-tglu:         NOTRUN -> [SKIP][200] ([i915#13707])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#8812])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#3840])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-2/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#3840])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#3555] / [i915#3840])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-3/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#3840] / [i915#9053])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#14544])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#3840] / [i915#9053])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#3840] / [i915#9053])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-9/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#3469])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-5/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#3469])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#1839])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-9/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#658])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-19/igt@kms_feature_discovery@psr2.html
    - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#658])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-2/igt@kms_feature_discovery@psr2.html
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#658])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#4881])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#9934]) +3 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2-9:        NOTRUN -> [SKIP][217] ([i915#9934]) +3 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][218] ([i915#3637] / [i915#9934]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg2-9:        NOTRUN -> [SKIP][219] ([i915#8381])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#3637] / [i915#9934]) +6 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-8/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][221] ([i915#12745] / [i915#4839])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-glk9/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][222] ([i915#4839])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-glk9/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#3637] / [i915#9934]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#9934]) +2 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_flip@2x-plain-flip-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#9934]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-15/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          [PASS][226] -> [SKIP][227] ([i915#14544] / [i915#3637]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-7/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-panning:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#14544] / [i915#3637])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_flip@flip-vs-panning.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
    - shard-tglu-1:       NOTRUN -> [FAIL][229] ([i915#14600]) +1 other test fail
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][230] ([i915#2672] / [i915#3555])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][231] ([i915#2587] / [i915#2672])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#2672] / [i915#3555]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#2672] / [i915#3555])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2-9:        NOTRUN -> [SKIP][234] ([i915#2672] / [i915#3555] / [i915#5190])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2-9:        NOTRUN -> [SKIP][235] ([i915#2672]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#2587] / [i915#2672]) +4 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#2672] / [i915#3555]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#2587] / [i915#2672] / [i915#3555])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][239] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][240] ([i915#2672] / [i915#3555] / [i915#8813])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#2672] / [i915#8813])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#2587] / [i915#2672])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-dg2-9:        NOTRUN -> [SKIP][243] ([i915#2672] / [i915#3555])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#2672]) +8 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#2672]) +2 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#8708]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#15104]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#14544] / [i915#1849] / [i915#5354])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#1825]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#8708]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][252] +26 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-rkl:          [PASS][253] -> [SKIP][254] ([i915#14544] / [i915#1849] / [i915#5354]) +3 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-dg2:          [PASS][255] -> [ABORT][256] ([i915#15132])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#15102] / [i915#3023]) +4 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg2-9:        NOTRUN -> [SKIP][258] ([i915#15102] / [i915#3458]) +8 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-snb:          NOTRUN -> [SKIP][259] +41 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-snb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
    - shard-dg1:          NOTRUN -> [SKIP][260] +7 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2-9:        NOTRUN -> [SKIP][261] ([i915#8708]) +14 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][262] +57 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#1825]) +8 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg2-9:        NOTRUN -> [SKIP][264] ([i915#9766])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#15102]) +3 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#15102])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#15104])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#15104])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:
    - shard-dg2-9:        NOTRUN -> [SKIP][269] ([i915#15102])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#15102] / [i915#3458]) +10 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#15102] / [i915#3458]) +5 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][272] ([i915#15102]) +8 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-tglu:         NOTRUN -> [SKIP][273] ([i915#15102]) +22 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2-9:        NOTRUN -> [SKIP][274] ([i915#5354]) +17 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#5354]) +25 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#8708]) +17 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-snb:          [PASS][277] -> [SKIP][278]
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-snb1/igt@kms_hdmi_inject@inject-audio.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-snb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#3555] / [i915#8228])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-swap:
    - shard-dg2-9:        NOTRUN -> [SKIP][280] ([i915#3555] / [i915#8228])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#3555] / [i915#8228])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-2/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_invalid_mode@zero-hdisplay:
    - shard-rkl:          [PASS][282] -> [SKIP][283] ([i915#14544] / [i915#3555] / [i915#8826])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-7/igt@kms_invalid_mode@zero-hdisplay.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_invalid_mode@zero-hdisplay.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#10656])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#12388])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][286] ([i915#12339])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-4/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#12394])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-10/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#13522])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#6301])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-2/igt@kms_panel_fitting@atomic-fastset.html
    - shard-dg2-9:        NOTRUN -> [SKIP][290] ([i915#6301])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][291] ([i915#6301])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-tglu:         NOTRUN -> [SKIP][292] ([i915#14712])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-10/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2-9:        NOTRUN -> [SKIP][293] ([i915#13705])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format:
    - shard-rkl:          [PASS][294] -> [SKIP][295] ([i915#14544] / [i915#8825]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-3/igt@kms_plane@pixel-format.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_plane@pixel-format.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-rkl:          [PASS][296] -> [ABORT][297] ([i915#15132]) +1 other test abort
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk10:        NOTRUN -> [FAIL][298] ([i915#10647] / [i915#12177])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-glk10/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [FAIL][299] ([i915#10647]) +1 other test fail
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-glk10/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][300] ([i915#10647] / [i915#12169])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-glk1/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][301] ([i915#10647]) +1 other test fail
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-glk1/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-mtlp:         NOTRUN -> [SKIP][302] ([i915#11614] / [i915#3582]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-4/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_lowres@tiling-x@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][303] ([i915#10226] / [i915#11614] / [i915#3582]) +2 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-4/igt@kms_plane_lowres@tiling-x@pipe-a-edp-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#3555] / [i915#8821])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-10/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-9:        NOTRUN -> [SKIP][305] ([i915#14259])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#14259])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-9:        NOTRUN -> [SKIP][307] ([i915#6953] / [i915#9423])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-rkl:          [PASS][308] -> [SKIP][309] ([i915#14544] / [i915#3555] / [i915#8152])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
    - shard-rkl:          [PASS][310] -> [SKIP][311] ([i915#12247] / [i915#14544]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-rkl:          [PASS][312] -> [SKIP][313] ([i915#12247] / [i915#14544] / [i915#6953] / [i915#8152])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b:
    - shard-rkl:          [PASS][314] -> [SKIP][315] ([i915#12247] / [i915#14544] / [i915#8152]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#12343])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#5354]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-4/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][318] ([i915#9812])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-6/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-tglu:         NOTRUN -> [SKIP][319] ([i915#9685]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-8/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-rkl:          [PASS][320] -> [SKIP][321] ([i915#13441] / [i915#14544])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-2/igt@kms_pm_dc@dc5-dpms-negative.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-9:        NOTRUN -> [SKIP][322] ([i915#9685])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#9340])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#14544] / [i915#9340])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][325] ([i915#15073])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][326] ([i915#15073])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg1:          NOTRUN -> [SKIP][327] ([i915#15073])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          NOTRUN -> [SKIP][328] ([i915#15073])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@pm-caching:
    - shard-rkl:          [PASS][329] -> [SKIP][330] ([i915#12916])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-5/igt@kms_pm_rpm@pm-caching.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_pm_rpm@pm-caching.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2-9:        NOTRUN -> [SKIP][331] ([i915#6524] / [i915#6805])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][332] ([i915#6524])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-10/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          NOTRUN -> [SKIP][333] ([i915#6524])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-4/igt@kms_prime@d3hot.html
    - shard-dg2:          NOTRUN -> [SKIP][334] ([i915#6524] / [i915#6805])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-9:        NOTRUN -> [SKIP][335] ([i915#11520]) +5 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][336] ([i915#11520]) +9 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-9/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][337] ([i915#11520]) +2 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][338] ([i915#11520]) +4 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-glk5/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][339] ([i915#11520]) +8 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
    - shard-snb:          NOTRUN -> [SKIP][340] ([i915#11520]) +1 other test skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-snb7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-glk10:        NOTRUN -> [SKIP][341] ([i915#11520]) +2 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-glk10/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
    - shard-rkl:          NOTRUN -> [SKIP][342] ([i915#11520]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][343] ([i915#11520])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-13/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
    - shard-mtlp:         NOTRUN -> [SKIP][344] ([i915#12316])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-8/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-9:        NOTRUN -> [SKIP][345] ([i915#9683])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu:         NOTRUN -> [SKIP][346] ([i915#9683])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-3/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-mtlp:         NOTRUN -> [SKIP][347] ([i915#9688]) +2 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-3/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][348] ([i915#9732]) +20 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-3/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-primary-mmap-gtt:
    - shard-dg2-9:        NOTRUN -> [SKIP][349] ([i915#1072] / [i915#9732]) +12 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_psr@fbc-psr-primary-mmap-gtt.html

  * igt@kms_psr@fbc-psr-sprite-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][350] ([i915#1072] / [i915#9732]) +5 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@kms_psr@fbc-psr-sprite-mmap-gtt.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][351] ([i915#9732]) +6 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][352] ([i915#1072] / [i915#9732]) +21 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@kms_psr@psr-cursor-render.html
    - shard-rkl:          NOTRUN -> [SKIP][353] ([i915#1072] / [i915#14544] / [i915#9732])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_psr@psr-cursor-render.html
    - shard-dg1:          NOTRUN -> [SKIP][354] ([i915#1072] / [i915#9732]) +3 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-17/igt@kms_psr@psr-cursor-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#12755] / [i915#5190]) +1 other test skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-rkl:          NOTRUN -> [SKIP][356] ([i915#5289]) +1 other test skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][357] ([i915#12755]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][358] ([i915#3555]) +4 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-dg1:          NOTRUN -> [ABORT][359] ([i915#13179]) +1 other test abort
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-15/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create:
    - shard-dg1:          NOTRUN -> [FAIL][360] ([i915#15119]) +1 other test fail
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-15/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html

  * igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state:
    - shard-dg2-9:        NOTRUN -> [FAIL][361] ([i915#15119]) +5 other tests fail
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
    - shard-tglu-1:       NOTRUN -> [FAIL][362] ([i915#15119]) +2 other tests fail
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-dg1:          NOTRUN -> [SKIP][363] ([i915#3555])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-12/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
    - shard-mtlp:         NOTRUN -> [SKIP][364] ([i915#3555] / [i915#8809])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu-1:       NOTRUN -> [SKIP][365] ([i915#8623])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2:
    - shard-rkl:          [PASS][366] -> [FAIL][367] ([i915#9196]) +2 other tests fail
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2.html

  * igt@kms_vrr@flipline:
    - shard-dg2-9:        NOTRUN -> [SKIP][368] ([i915#3555]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_vrr@flipline.html
    - shard-tglu-1:       NOTRUN -> [SKIP][369] ([i915#3555])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_vrr@flipline.html

  * igt@kms_vrr@max-min:
    - shard-dg2:          NOTRUN -> [SKIP][370] ([i915#9906])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-3/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-tglu:         NOTRUN -> [SKIP][371] ([i915#3555] / [i915#9906])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-7/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-tglu-1:       NOTRUN -> [SKIP][372] ([i915#9906])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2-9:        NOTRUN -> [SKIP][373] ([i915#9906])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglu:         NOTRUN -> [SKIP][374] ([i915#2437])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-2/igt@kms_writeback@writeback-fb-id.html
    - shard-mtlp:         NOTRUN -> [SKIP][375] ([i915#2437])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-4/igt@kms_writeback@writeback-fb-id.html
    - shard-dg2-9:        NOTRUN -> [SKIP][376] ([i915#2437])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_writeback@writeback-fb-id.html
    - shard-rkl:          NOTRUN -> [SKIP][377] ([i915#2437]) +1 other test skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][378] ([i915#2437] / [i915#9412])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-8/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2:          NOTRUN -> [SKIP][379] ([i915#2437])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-3/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@mi-rpc:
    - shard-dg2-9:        NOTRUN -> [SKIP][380] ([i915#2434])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@perf@mi-rpc.html

  * igt@perf@non-zero-reason:
    - shard-dg2:          NOTRUN -> [FAIL][381] ([i915#9100]) +1 other test fail
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@perf@non-zero-reason.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2-9:        NOTRUN -> [FAIL][382] ([i915#4349]) +4 other tests fail
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg2:          NOTRUN -> [FAIL][383] ([i915#12549] / [i915#6806]) +1 other test fail
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@perf_pmu@frequency@gt0.html
    - shard-dg1:          NOTRUN -> [FAIL][384] ([i915#12549] / [i915#6806]) +1 other test fail
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-19/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@module-unload:
    - shard-glk10:        NOTRUN -> [FAIL][385] ([i915#14433])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-glk10/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu-1:       NOTRUN -> [SKIP][386] ([i915#8516])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][387] ([i915#13356])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-glk6/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2-9:        NOTRUN -> [SKIP][388] ([i915#8516])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][389] ([i915#3291] / [i915#3708])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg2-9:        NOTRUN -> [SKIP][390] ([i915#3708] / [i915#4077])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-write:
    - shard-dg2-9:        NOTRUN -> [SKIP][391] ([i915#3291] / [i915#3708])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-write-hang:
    - shard-dg2-9:        NOTRUN -> [SKIP][392] ([i915#3708])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:
    - shard-tglu:         NOTRUN -> [FAIL][393] ([i915#12910]) +18 other tests fail
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-2/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random.html

  
#### Possible fixes ####

  * igt@fbdev@nullptr:
    - shard-rkl:          [SKIP][394] ([i915#14544] / [i915#2582]) -> [PASS][395]
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@fbdev@nullptr.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@fbdev@nullptr.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          [ABORT][396] ([i915#13427]) -> [PASS][397]
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-5/igt@gem_create@create-ext-cpu-access-big.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - shard-dg2:          [INCOMPLETE][398] ([i915#13356]) -> [PASS][399] +1 other test pass
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-1/igt@gem_exec_suspend@basic-s0@lmem0.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-rkl:          [INCOMPLETE][400] ([i915#13356]) -> [PASS][401] +1 other test pass
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@gem_exec_suspend@basic-s0@smem.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-tglu:         [FAIL][402] ([i915#15136]) -> [PASS][403] +1 other test pass
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-tglu-3/igt@gem_exec_suspend@basic-s4-devices.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-8/igt@gem_exec_suspend@basic-s4-devices.html
    - shard-mtlp:         [FAIL][404] ([i915#15136]) -> [PASS][405] +1 other test pass
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-mtlp-3/igt@gem_exec_suspend@basic-s4-devices.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-6/igt@gem_exec_suspend@basic-s4-devices.html
    - shard-rkl:          [FAIL][406] ([i915#15136]) -> [PASS][407] +1 other test pass
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-8/igt@gem_exec_suspend@basic-s4-devices.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [TIMEOUT][408] ([i915#5493]) -> [PASS][409] +1 other test pass
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg1-12/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-rkl:          [TIMEOUT][410] ([i915#12917] / [i915#12964]) -> [PASS][411]
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-3/igt@gem_pxp@create-regular-context-2.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-rkl:          [TIMEOUT][412] ([i915#12964]) -> [PASS][413]
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@gem_pxp@fail-invalid-protected-context.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@i915_module_load@load:
    - shard-dg2:          ([SKIP][414], [PASS][415], [PASS][416], [PASS][417], [PASS][418], [PASS][419], [PASS][420], [PASS][421], [PASS][422], [PASS][423], [PASS][424], [PASS][425], [PASS][426], [PASS][427], [PASS][428], [PASS][429], [PASS][430], [PASS][431], [PASS][432], [PASS][433], [PASS][434], [PASS][435]) ([i915#14785]) -> ([PASS][436], [PASS][437], [PASS][438], [PASS][439], [PASS][440], [PASS][441], [PASS][442], [PASS][443], [PASS][444], [PASS][445], [PASS][446], [PASS][447], [PASS][448], [PASS][449], [PASS][450], [PASS][451], [PASS][452], [PASS][453], [PASS][454], [PASS][455], [PASS][456], [PASS][457])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-6/igt@i915_module_load@load.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-10/igt@i915_module_load@load.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-1/igt@i915_module_load@load.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-1/igt@i915_module_load@load.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-1/igt@i915_module_load@load.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-1/igt@i915_module_load@load.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-3/igt@i915_module_load@load.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-3/igt@i915_module_load@load.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-3/igt@i915_module_load@load.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-4/igt@i915_module_load@load.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-4/igt@i915_module_load@load.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-4/igt@i915_module_load@load.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-5/igt@i915_module_load@load.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-5/igt@i915_module_load@load.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-5/igt@i915_module_load@load.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-6/igt@i915_module_load@load.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-7/igt@i915_module_load@load.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-7/igt@i915_module_load@load.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-7/igt@i915_module_load@load.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-8/igt@i915_module_load@load.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-8/igt@i915_module_load@load.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-8/igt@i915_module_load@load.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@i915_module_load@load.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@i915_module_load@load.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-7/igt@i915_module_load@load.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@i915_module_load@load.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-3/igt@i915_module_load@load.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@i915_module_load@load.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-10/igt@i915_module_load@load.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-3/igt@i915_module_load@load.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-7/igt@i915_module_load@load.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@i915_module_load@load.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@i915_module_load@load.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-1/igt@i915_module_load@load.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@i915_module_load@load.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-1/igt@i915_module_load@load.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@i915_module_load@load.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@i915_module_load@load.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@i915_module_load@load.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@i915_module_load@load.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@i915_module_load@load.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-3/igt@i915_module_load@load.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@i915_module_load@load.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-10/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-no-display:
    - shard-dg1:          [DMESG-WARN][458] ([i915#13029] / [i915#14545]) -> [PASS][459]
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg1-14/igt@i915_module_load@reload-no-display.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-17/igt@i915_module_load@reload-no-display.html
    - shard-snb:          [DMESG-WARN][460] ([i915#14545]) -> [PASS][461]
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-snb4/igt@i915_module_load@reload-no-display.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-snb1/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_rpm@debugfs-read:
    - shard-dg1:          [DMESG-WARN][462] ([i915#4423]) -> [PASS][463] +1 other test pass
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg1-14/igt@i915_pm_rpm@debugfs-read.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-13/igt@i915_pm_rpm@debugfs-read.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:
    - shard-rkl:          [SKIP][464] ([i915#14544]) -> [PASS][465] +53 other tests pass
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-rkl:          [FAIL][466] ([i915#13566]) -> [PASS][467]
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-2/igt@kms_cursor_crc@cursor-random-64x21.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-tglu:         [FAIL][468] ([i915#13566]) -> [PASS][469] +5 other tests pass
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - shard-rkl:          [SKIP][470] ([i915#11190] / [i915#14544]) -> [PASS][471] +3 other tests pass
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2:          [SKIP][472] ([i915#13749]) -> [PASS][473]
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-10/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-rkl:          [INCOMPLETE][474] ([i915#9878]) -> [PASS][475]
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-3/igt@kms_fbcon_fbt@fbc-suspend.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-rkl:          [SKIP][476] ([i915#14544] / [i915#3637]) -> [PASS][477] +6 other tests pass
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - shard-rkl:          [SKIP][478] ([i915#14544] / [i915#3555]) -> [PASS][479]
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-rkl:          [SKIP][480] ([i915#14544] / [i915#1849] / [i915#5354]) -> [PASS][481] +5 other tests pass
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-rkl:          [SKIP][482] ([i915#14544] / [i915#3555] / [i915#8826]) -> [PASS][483]
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_invalid_mode@clock-too-high.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2:          [SKIP][484] ([i915#12388]) -> [PASS][485]
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-10/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - shard-rkl:          [DMESG-WARN][486] ([i915#12964]) -> [PASS][487] +45 other tests pass
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-4/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  * igt@kms_plane@plane-position-covered:
    - shard-rkl:          [SKIP][488] ([i915#14544] / [i915#8825]) -> [PASS][489] +1 other test pass
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_plane@plane-position-covered.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
    - shard-rkl:          [SKIP][490] ([i915#14544] / [i915#8152]) -> [PASS][491] +1 other test pass
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a:
    - shard-rkl:          [SKIP][492] ([i915#12247] / [i915#14544]) -> [PASS][493] +5 other tests pass
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-rkl:          [SKIP][494] ([i915#14544] / [i915#6953] / [i915#8152]) -> [PASS][495] +1 other test pass
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:
    - shard-rkl:          [SKIP][496] ([i915#12247] / [i915#14544] / [i915#8152]) -> [PASS][497] +7 other tests pass
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-rkl:          [SKIP][498] ([i915#12916]) -> [PASS][499]
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-3/igt@kms_pm_rpm@cursor-dpms.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][500] ([i915#15073]) -> [PASS][501] +1 other test pass
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@perf_pmu@busy-double-start@vecs0:
    - shard-dg1:          [FAIL][502] ([i915#4349]) -> [PASS][503] +2 other tests pass
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg1-12/igt@perf_pmu@busy-double-start@vecs0.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-14/igt@perf_pmu@busy-double-start@vecs0.html
    - shard-mtlp:         [FAIL][504] ([i915#4349]) -> [PASS][505] +2 other tests pass
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-mtlp-6/igt@perf_pmu@busy-double-start@vecs0.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-5/igt@perf_pmu@busy-double-start@vecs0.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [FAIL][506] ([i915#4349]) -> [PASS][507] +1 other test pass
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-4/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-rkl:          [SKIP][508] ([i915#14544] / [i915#3708]) -> [PASS][509]
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@prime_vgem@basic-fence-flip.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@prime_vgem@basic-fence-flip.html

  
#### Warnings ####

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          [SKIP][510] ([i915#11078] / [i915#14544]) -> [SKIP][511] ([i915#11078]) +1 other test skip
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          [SKIP][512] ([i915#14544] / [i915#3555] / [i915#9323]) -> [SKIP][513] ([i915#3555] / [i915#9323])
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          [SKIP][514] ([i915#14544] / [i915#9323]) -> [SKIP][515] ([i915#9323]) +1 other test skip
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          [SKIP][516] ([i915#14544] / [i915#7697]) -> [SKIP][517] ([i915#7697])
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          [SKIP][518] ([i915#14544] / [i915#8562]) -> [SKIP][519] ([i915#8562])
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@gem_create@create-ext-set-pat.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          [SKIP][520] ([i915#280]) -> [SKIP][521] ([i915#14544] / [i915#280])
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-7/igt@gem_ctx_sseu@engines.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-rkl:          [SKIP][522] ([i915#14544] / [i915#280]) -> [SKIP][523] ([i915#280])
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@gem_ctx_sseu@mmap-args.html
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-rkl:          [SKIP][524] ([i915#14544] / [i915#4525]) -> [SKIP][525] ([i915#4525])
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@gem_exec_balancer@parallel-keep-in-fence.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-4/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-rkl:          [SKIP][526] ([i915#3281]) -> [SKIP][527] ([i915#14544] / [i915#3281]) +4 other tests skip
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-8/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          [SKIP][528] ([i915#14544] / [i915#3281]) -> [SKIP][529] ([i915#3281]) +6 other tests skip
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          [SKIP][530] ([i915#14544] / [i915#7276]) -> [SKIP][531] ([i915#7276])
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          [SKIP][532] ([i915#14544] / [i915#2190]) -> [SKIP][533] ([i915#2190])
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@gem_huc_copy@huc-copy.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - shard-rkl:          [SKIP][534] ([i915#4613]) -> [SKIP][535] ([i915#14544] / [i915#4613]) +1 other test skip
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-2/igt@gem_lmem_swapping@basic.html
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-rkl:          [SKIP][536] ([i915#14544] / [i915#4613]) -> [SKIP][537] ([i915#4613]) +2 other tests skip
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-rkl:          [SKIP][538] ([i915#3282]) -> [SKIP][539] ([i915#14544] / [i915#3282]) +1 other test skip
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-8/igt@gem_partial_pwrite_pread@write-display.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-rkl:          [SKIP][540] ([i915#14544] / [i915#3282]) -> [SKIP][541] ([i915#3282]) +4 other tests skip
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@gem_partial_pwrite_pread@write-uncached.html
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          [SKIP][542] ([i915#13717]) -> [FAIL][543] ([i915#15138])
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          [FAIL][544] ([i915#15169]) -> [SKIP][545] ([i915#13717])
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-5/igt@gem_pxp@hw-rejects-pxp-context.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_userptr_blits@access-control:
    - shard-rkl:          [SKIP][546] ([i915#14544] / [i915#3297]) -> [SKIP][547] ([i915#3297]) +2 other tests skip
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@gem_userptr_blits@access-control.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@gem_userptr_blits@access-control.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-rkl:          [SKIP][548] -> [SKIP][549] ([i915#14544]) +9 other tests skip
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-3/igt@gen7_exec_parse@bitmasks.html
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-rkl:          [SKIP][550] ([i915#14544] / [i915#2527]) -> [SKIP][551] ([i915#2527]) +1 other test skip
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@gen9_exec_parse@bb-start-param.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          [SKIP][552] ([i915#14544] / [i915#6412]) -> [SKIP][553] ([i915#6412])
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@i915_module_load@resize-bar.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          [SKIP][554] ([i915#8399]) -> [SKIP][555] ([i915#14544] / [i915#8399])
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-3/igt@i915_pm_freq_api@freq-reset.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          [SKIP][556] ([i915#14544] / [i915#6590]) -> [SKIP][557] ([i915#6590]) +1 other test skip
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@i915_pm_freq_mult@media-freq@gt0.html
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          [SKIP][558] ([i915#7707]) -> [SKIP][559] ([i915#14544] / [i915#7707])
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-3/igt@intel_hwmon@hwmon-read.html
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-rkl:          [SKIP][560] ([i915#12454] / [i915#12712] / [i915#14544]) -> [SKIP][561] ([i915#12454] / [i915#12712])
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-rkl:          [SKIP][562] ([i915#1769] / [i915#3555]) -> [SKIP][563] ([i915#14544])
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-transition-fencing:
    - shard-rkl:          [SKIP][564] ([i915#14544]) -> [DMESG-WARN][565] ([i915#12964]) +2 other tests dmesg-warn
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_atomic_transition@plane-all-transition-fencing.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@kms_atomic_transition@plane-all-transition-fencing.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-rkl:          [SKIP][566] ([i915#14544]) -> [SKIP][567] ([i915#5286]) +6 other tests skip
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-rkl:          [SKIP][568] ([i915#5286]) -> [SKIP][569] ([i915#14544])
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          [SKIP][570] ([i915#14544]) -> [SKIP][571] ([i915#3638]) +3 other tests skip
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-rkl:          [SKIP][572] ([i915#3638]) -> [SKIP][573] ([i915#14544])
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          [SKIP][574] ([i915#4423] / [i915#4538]) -> [SKIP][575] ([i915#4538])
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-16/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][576] ([i915#14098] / [i915#6095]) -> [SKIP][577] ([i915#6095]) +2 other tests skip
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][578] ([i915#14544]) -> [SKIP][579] ([i915#12313]) +1 other test skip
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-rkl:          [SKIP][580] ([i915#14098] / [i915#6095]) -> [SKIP][581] ([i915#14544]) +5 other tests skip
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          [SKIP][582] ([i915#14544]) -> [SKIP][583] ([i915#14098] / [i915#6095]) +11 other tests skip
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][584] ([i915#6095]) -> [SKIP][585] ([i915#14098] / [i915#6095]) +5 other tests skip
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-rkl:          [SKIP][586] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][587] ([i915#11151] / [i915#7828]) +9 other tests skip
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-single.html
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          [SKIP][588] ([i915#11151] / [i915#7828]) -> [SKIP][589] ([i915#11151] / [i915#14544] / [i915#7828]) +3 other tests skip
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-5/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_color@ctm-blue-to-red:
    - shard-rkl:          [DMESG-WARN][590] ([i915#12964]) -> [SKIP][591] ([i915#12655] / [i915#14544])
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-2/igt@kms_color@ctm-blue-to-red.html
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_color@ctm-blue-to-red.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-rkl:          [SKIP][592] ([i915#14544]) -> [SKIP][593] ([i915#7118] / [i915#9424])
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_content_protection@atomic-dpms.html
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          [SKIP][594] ([i915#14544]) -> [SKIP][595] ([i915#3116])
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0.html
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          [SKIP][596] ([i915#14544]) -> [SKIP][597] ([i915#9424])
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_content_protection@mei-interface.html
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          [SKIP][598] ([i915#7118] / [i915#9424]) -> [SKIP][599] ([i915#7118] / [i915#7162] / [i915#9424])
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-4/igt@kms_content_protection@type1.html
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-10/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          [FAIL][600] ([i915#13566]) -> [DMESG-WARN][601] ([i915#12964]) +1 other test dmesg-warn
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-rkl:          [SKIP][602] ([i915#14544]) -> [FAIL][603] ([i915#13566])
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-rkl:          [SKIP][604] ([i915#13049]) -> [SKIP][605] ([i915#14544])
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-rkl:          [SKIP][606] ([i915#3555]) -> [SKIP][607] ([i915#14544]) +1 other test skip
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-rkl:          [FAIL][608] ([i915#13566]) -> [SKIP][609] ([i915#14544])
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-7/igt@kms_cursor_crc@cursor-random-256x85.html
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          [SKIP][610] ([i915#14544]) -> [SKIP][611] ([i915#13049]) +2 other tests skip
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x512.html
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          [SKIP][612] ([i915#14544]) -> [SKIP][613] ([i915#3555]) +2 other tests skip
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-rkl:          [ABORT][614] ([i915#15132]) -> [SKIP][615] ([i915#14544])
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-4/igt@kms_cursor_crc@cursor-suspend.html
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          [SKIP][616] ([i915#14544]) -> [SKIP][617] +17 other tests skip
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          [SKIP][618] ([i915#4103]) -> [SKIP][619] ([i915#11190] / [i915#14544])
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-rkl:          [SKIP][620] ([i915#13691]) -> [SKIP][621] ([i915#14544])
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-3/igt@kms_display_modes@extended-mode-basic.html
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-rkl:          [SKIP][622] ([i915#14544]) -> [SKIP][623] ([i915#13749])
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          [SKIP][624] ([i915#14544]) -> [SKIP][625] ([i915#13748]) +1 other test skip
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          [SKIP][626] ([i915#11190] / [i915#14544]) -> [SKIP][627] ([i915#3555] / [i915#3840])
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_dsc@dsc-basic.html
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-4/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-rkl:          [SKIP][628] ([i915#3840]) -> [SKIP][629] ([i915#14544])
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          [SKIP][630] ([i915#14544] / [i915#3955]) -> [SKIP][631] ([i915#3955])
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_fbcon_fbt@psr.html
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-rkl:          [SKIP][632] ([i915#14544] / [i915#1839]) -> [SKIP][633] ([i915#1839])
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_feature_discovery@display-3x.html
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          [SKIP][634] ([i915#14544] / [i915#9934]) -> [SKIP][635] ([i915#9934]) +2 other tests skip
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms.html
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-rkl:          [SKIP][636] ([i915#9934]) -> [SKIP][637] ([i915#14544] / [i915#9934]) +3 other tests skip
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-5/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-snb:          [TIMEOUT][638] ([i915#14033] / [i915#14350]) -> [ABORT][639] ([i915#14849] / [i915#14871])
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-snb1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [TIMEOUT][640] ([i915#14033]) -> [ABORT][641] ([i915#14849] / [i915#14871])
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-snb1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@dpms-off-confusion:
    - shard-rkl:          [SKIP][642] ([i915#14544] / [i915#3637]) -> [DMESG-WARN][643] ([i915#12964])
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_flip@dpms-off-confusion.html
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@kms_flip@dpms-off-confusion.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-rkl:          [SKIP][644] ([i915#2672] / [i915#3555]) -> [SKIP][645] ([i915#14544] / [i915#3555]) +2 other tests skip
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          [SKIP][646] ([i915#14544] / [i915#3555]) -> [SKIP][647] ([i915#2672] / [i915#3555]) +6 other tests skip
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][648] ([i915#14544]) -> [SKIP][649] ([i915#15102]) +4 other tests skip
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
    - shard-dg1:          [SKIP][650] ([i915#15104] / [i915#4423]) -> [SKIP][651] ([i915#15104])
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
    - shard-rkl:          [SKIP][652] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][653] ([i915#15102] / [i915#3023]) +12 other tests skip
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          [SKIP][654] ([i915#10433] / [i915#15102] / [i915#3458]) -> [SKIP][655] ([i915#15102] / [i915#3458]) +1 other test skip
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-rkl:          [SKIP][656] ([i915#1825]) -> [SKIP][657] ([i915#14544] / [i915#1849] / [i915#5354]) +12 other tests skip
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-dg2:          [SKIP][658] ([i915#15102] / [i915#3458]) -> [SKIP][659] ([i915#10433] / [i915#15102] / [i915#3458]) +1 other test skip
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          [SKIP][660] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][661] ([i915#5439])
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][662] ([i915#15102]) -> [SKIP][663] ([i915#14544]) +1 other test skip
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          [SKIP][664] ([i915#15102] / [i915#3023]) -> [SKIP][665] ([i915#14544] / [i915#1849] / [i915#5354]) +10 other tests skip
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          [SKIP][666] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][667] ([i915#1825]) +45 other tests skip
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          [SKIP][668] ([i915#14544]) -> [SKIP][669] ([i915#12713])
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_hdr@brightness-with-hdr.html
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg1:          [SKIP][670] ([i915#3555] / [i915#4423] / [i915#8228]) -> [SKIP][671] ([i915#3555] / [i915#8228])
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg1-13/igt@kms_hdr@invalid-metadata-sizes.html
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-16/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          [SKIP][672] ([i915#14544]) -> [SKIP][673] ([i915#3555] / [i915#8228]) +2 other tests skip
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_hdr@static-toggle.html
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          [ABORT][674] ([i915#15132]) -> [SKIP][675] ([i915#3555] / [i915#8228])
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@kms_hdr@static-toggle-suspend.html
    - shard-rkl:          [SKIP][676] ([i915#3555] / [i915#8228]) -> [SKIP][677] ([i915#14544])
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-4/igt@kms_hdr@static-toggle-suspend.html
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          [SKIP][678] ([i915#10656] / [i915#14544]) -> [SKIP][679] ([i915#10656])
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_joiner@invalid-modeset-big-joiner.html
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-4/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          [SKIP][680] ([i915#14544]) -> [SKIP][681] ([i915#6301])
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_panel_fitting@legacy.html
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-rkl:          [SKIP][682] ([i915#13958]) -> [SKIP][683] ([i915#14544])
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-4.html
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-rkl:          [SKIP][684] ([i915#14544]) -> [SKIP][685] ([i915#13958])
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-none.html
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          [SKIP][686] ([i915#5354]) -> [SKIP][687] ([i915#14544] / [i915#5354]) +1 other test skip
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-2/igt@kms_pm_backlight@bad-brightness.html
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-rkl:          [SKIP][688] ([i915#14544] / [i915#3828]) -> [SKIP][689] ([i915#3828])
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_pm_dc@dc5-retention-flops.html
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][690] ([i915#14544] / [i915#15073]) -> [SKIP][691] ([i915#15073])
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          [SKIP][692] ([i915#14544] / [i915#6524]) -> [SKIP][693] ([i915#6524])
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-rkl:          [SKIP][694] ([i915#11520]) -> [SKIP][695] ([i915#11520] / [i915#14544]) +2 other tests skip
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][696] ([i915#11520] / [i915#14544]) -> [SKIP][697] ([i915#11520]) +8 other tests skip
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-rkl:          [SKIP][698] ([i915#14544] / [i915#9683]) -> [SKIP][699] ([i915#9683]) +1 other test skip
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-basic:
    - shard-dg1:          [SKIP][700] ([i915#1072] / [i915#9732]) -> [SKIP][701] ([i915#1072] / [i915#4423] / [i915#9732])
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg1-16/igt@kms_psr@fbc-pr-basic.html
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-14/igt@kms_psr@fbc-pr-basic.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-rkl:          [SKIP][702] ([i915#1072] / [i915#9732]) -> [SKIP][703] ([i915#1072] / [i915#14544] / [i915#9732]) +5 other tests skip
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-4/igt@kms_psr@psr2-cursor-blt.html
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr@psr2-suspend:
    - shard-rkl:          [SKIP][704] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][705] ([i915#1072] / [i915#9732]) +14 other tests skip
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_psr@psr2-suspend.html
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-rkl:          [SKIP][706] ([i915#9685]) -> [SKIP][707] ([i915#14544] / [i915#9685])
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-rkl:          [DMESG-WARN][708] ([i915#12964]) -> [SKIP][709] ([i915#14544])
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-3/igt@kms_rotation_crc@bad-pixel-format.html
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          [SKIP][710] ([i915#5289]) -> [SKIP][711] ([i915#14544])
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-rkl:          [SKIP][712] ([i915#14544] / [i915#3555]) -> [SKIP][713] ([i915#3555]) +1 other test skip
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_setmode@basic-clone-single-crtc.html
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-rkl:          [SKIP][714] ([i915#3555]) -> [SKIP][715] ([i915#14544] / [i915#3555])
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-7/igt@kms_setmode@invalid-clone-single-crtc.html
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          [SKIP][716] ([i915#14544]) -> [SKIP][717] ([i915#8623])
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          [SKIP][718] ([i915#11920]) -> [SKIP][719] ([i915#14544])
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-7/igt@kms_vrr@lobf.html
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          [SKIP][720] ([i915#14544]) -> [SKIP][721] ([i915#9906]) +1 other test skip
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-rkl:          [SKIP][722] ([i915#14544] / [i915#2437] / [i915#9412]) -> [SKIP][723] ([i915#2437] / [i915#9412])
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@kms_writeback@writeback-pixel-formats.html
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@polling-small-buf:
    - shard-rkl:          [FAIL][724] ([i915#14550]) -> [DMESG-WARN][725] ([i915#12964])
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@perf@polling-small-buf.html
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@perf@polling-small-buf.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          [SKIP][726] ([i915#14544] / [i915#2433]) -> [SKIP][727] ([i915#2433])
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@perf@unprivileged-single-ctx-counters.html
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@perf@unprivileged-single-ctx-counters.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          [SKIP][728] ([i915#14544] / [i915#3291] / [i915#3708]) -> [SKIP][729] ([i915#3291] / [i915#3708]) +1 other test skip
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-rkl-6/igt@prime_vgem@basic-write.html
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@prime_vgem@basic-write.html

  
  [i915#10226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527
  [i915#11614]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12353]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12353
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12392]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392
  [i915#12394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#12549]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12549
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#12916]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12916
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13328]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13328
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13427
  [i915#13441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441
  [i915#13522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13705]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13783]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783
  [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
  [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14350]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14350
  [i915#14433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14550
  [i915#14600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14785]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14785
  [i915#14849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14849
  [i915#14871]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14871
  [i915#14995]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14995
  [i915#15069]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15069
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15119]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15119
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15136]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15136
  [i915#15138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15138
  [i915#15169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15169
  [i915#15178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15178
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
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
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5107]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6806]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6806
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7162]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7162
  [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#8826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826
  [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
  [i915#9100]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100
  [i915#9196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8603 -> IGTPW_13964

  CI-20190529: 20190529
  CI_DRM_17454: 05dafb7f913af8cf6b33e482649d28ee7912a209 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13964: 621306d352af13acd6909948f044e9094bd32587 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8603: e6eb3c0fe0f28f3d6e530ae202fbb9f29bde9147 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/index.html

--===============2038103385650530282==
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
<tr><td><b>Series:</b></td><td>igt_kms: Rename igt_pipe member enabled to v=
alid</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/156749/">https://patchwork.freedesktop.org/series/156749/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_13964/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13964/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8603_full -&gt; IGTPW_13964_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_13964_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_13964_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/index=
.html</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1396=
4_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_crc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-mtlp-5/igt@kms_cursor_crc.html">INCOMPLETE<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-9:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-ind=
fb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-1p-offsc=
reen-pri-indfb-draw-blt.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8603_full and IGTPW_13964_ful=
l:</p>
<h3>New IGT tests (60)</h3>
<ul>
<li>
<p>igt@kms_cursor_crc@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interrup=
tible:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@allocator-basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@bad-brightness:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@basic-wait:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@busy-fence:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@crc-primary-rotation-180-yf-tiled-ccs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@crtc-properties-atomic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursora-vs-flipb-toggle:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@enable-vfs-autoprobe-on:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@etime-multi-wait-all-available-unsubmitted-submitted-=
signaled:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@extended:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@fbc-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@fbc-psr-no-drrs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@fbc-psr2-dpms:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@fbc-rgb565-draw-mmap-wc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@fds:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@gt-engine-error:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@heartbeat-stop:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@independent:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@invalid:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@invalid-clone-single-crtc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@invalid-gamma-lut-sizes:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@invalid-remove-userspace-config:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@invalid-single-wait-all-unsubmitted:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@lease-invalid-crtc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@mmap-offset-banned:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@multi-wait-all-for-submit-signaled:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@multi-wait-available-unsubmitted-signaled:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@parallel:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@primary:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@psr-sprite-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@psr2-cursor-blt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@query-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@short-flip-before-cursor-toggle:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@sync_multi_timeline_wait:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@syncobj-timeline-export:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@syncobj-wait:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@wait-for-submit-complex:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-fl=
ip:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@pipe-b-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@pipe-c-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@pipe-d-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [26.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-d-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [25.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13964_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@api_intel_bb@blit-reloc-keep-cach=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8411">i915#8411</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@api_intel_bb@crc32.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230"=
>i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@device_reset@cold-reset-bound.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-7/igt@fbdev@unaligned-read.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@fb=
dev@unaligned-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@gem_bad_reloc@negative-reloc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-10/igt@gem_basic@multigpu-create-close=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-5/igt@gem_ccs@large-ctrl-surf-copy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13008">i915#13008</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-7/igt@gem_ccs@suspend-resume.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-7/igt@gem_ccs@suspend-resume@tile4-comp=
ressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/12392">i915#12392</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-8/igt@gem_ctx_isolation@preservation-s3.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard=
-rkl-6/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12353">i915#123=
53</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_ctx_persistence@hang.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@gem_ctx_persistence@saturated-hos=
tile-nopreempt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5882">i915#5882</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_ctx_sseu@invalid-sseu.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-mtlp-2/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-3/ig=
t@gem_eio@unwedge-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15178">i915#15178</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_exec_balancer@bonded-true-han=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-6/igt@gem_exec_balancer@parallel-keep-=
submit-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@gem_exec_balancer@parallel-orderi=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@gem_exec_balancer@parallel-out-f=
ence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sliced:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@gem_exec_balancer@sliced.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-10/igt@gem_exec_capture@capture-recove=
rable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_exec_flush@basic-uc-prw-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-before-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-3/igt@gem_exec_flush@basic-wb-ro-before=
-default.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-default:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_exec_flush@basic-wb-ro-defaul=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-8/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@=
gem_exec_gttfill@basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-1/igt@gem_exec_params@rsvd2-dirt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/5107">i915#5107</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@gem_exec_reloc@basic-active.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3281">i915#3281</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-12/igt@gem_exec_reloc@basic-wc-read.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_exec_reloc@basic-write-read-n=
oreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_exec_schedule@preempt-queue.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@gem_exec_schedule@preempt-queue-c=
ontexts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@gem_exec_suspend@basic-s3.html">=
ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14849">i915#14849</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-none:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-7/igt@gem_fence_thrash@bo-write-verify-=
none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-ra=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@gem_lmem_swapping@heavy-random.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-8/igt@gem_lmem_swapping@heavy-verify-r=
andom-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@gem_lmem_swapping@parallel-multi.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-glk6/igt@gem_lmem_swapping@parallel-random.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-dg2-7/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-=
dg2-5/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493">i915#5493</a>) =
+1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@gem_lmem_swapping@verify-random.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@gem_mmap_gtt@cpuset-big-copy-odd.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4077">i915#4077</a>) +11 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-17/igt@gem_mmap_gtt@cpuset-big-copy-odd=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4077">i915#4077</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@hang-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-mtlp-5/igt@gem_mmap_gtt@hang-busy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@zero-extend:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_mmap_gtt@zero-extend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4077">i915#4077</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@coherency:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-18/igt@gem_mmap_wc@coherency.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/40=
83">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-3/igt@gem_mmap_wc@copy.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i9=
15#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-cpu-read-wc:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_mmap_wc@write-cpu-read-wc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-uncached:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_partial_pwrite_pread@write-un=
cached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@uncached:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@gem_pread@uncached.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">=
i915#3282</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@gem_pread@uncached.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">=
i915#3282</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-19/igt@gem_pread@uncached.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282"=
>i915#3282</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-mtlp-8/igt@gem_pread@uncached.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282"=
>i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_pxp@create-valid-protected-co=
ntext.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4270">i915#4270</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-1/igt@gem_pxp@dmabuf-shared-protected-d=
st-is-context-refcounted.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</l=
i>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@gem_pxp@dmabuf-shared-protected-d=
st-is-context-refcounted.html">TIMEOUT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-context.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-on.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
3964/shard-rkl-6/igt@gem_pxp@reject-modify-context-protection-on.html">TIME=
OUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/12917">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12964">i915#12964</a>) +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-linear:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@gem_render_copy@y-tiled-ccs-to-li=
near.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/8428">i915#8428</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_render_copy@y-tiled-ccs-to-y-=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8428">i915#8428</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_set_tiling_vs_blt@tiled-to-un=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4079">i915#4079</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-17/igt@gem_softpin@evict-snoop.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4885">i915#4885</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-mtlp-2/igt@gem_softpin@evict-snoop.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4885">i915#4885</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@gem_softpin@evict-snoop.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@gem_tiled_pread_basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/407=
9">i915#4079</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@gem_userptr_blits@create-destroy-=
unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@gem_userptr_blits@create-destroy=
-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-9/igt@gem_userptr_blits@dmabuf-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3323">i915#3323</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_userptr_blits@dmabuf-unsync.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gem_userptr_blits@map-fixed-inval=
idate-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@gem_userptr_blits@readonly-unsync=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3297">i915#3297</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-16/igt@gem_userptr_blits@readonly-unsyn=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-mtlp-2/igt@gem_userptr_blits@readonly-unsyn=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-10/igt@gem_userptr_blits@unsync-unmap.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-dg2-7/igt@gem_workarounds@suspend-resume.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg=
2-10/igt@gem_workarounds@suspend-resume.html">ABORT</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15069">i915#15069</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@gen9_exec_parse@bb-secure.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-10/igt@gen9_exec_parse@cmd-crossing-pa=
ge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2856">i915#2856</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-7/igt@gen9_exec_parse@valid-registers.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2856">i915#2856</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@gen9_exec_parse@valid-registers.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@vecs0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@i915_drm_fdinfo@busy-hang@vecs0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14073">i915#14073</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@ccs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@i915_drm_fdinfo@busy-idle-check-a=
ll@ccs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11527">i915#11527</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-mtlp-7/igt@i915_drm_fdinfo@most-busy-idle-c=
heck-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14073">i915#14073</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-12/igt@i915_drm_fdinfo@most-busy-idle-c=
heck-all@vecs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14073">i915#14073</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@i915_drm_fdinfo@most-busy-idle-ch=
eck-all@vecs1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14073">i915#14073</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-7/igt@i915_drm_fdinfo@virtual-busy-hang=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@i915_drm_fdinfo@virtual-busy-idle=
-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-dg2-4/igt@i915_module_load@reload-no-display.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shar=
d-dg2-6/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13=
029</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
13964/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12964">i915#12964</a>) +34 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-dg2-8/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard=
-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#133=
56</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13820">i915#13820</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shar=
d-rkl-3/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a=
>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-=
tglu-8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790">i915#13790</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681">i9=
15#2681</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@debugfs-read:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-2/igt@i915_pm_rpm@debugfs-read.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/ig=
t@i915_pm_rpm@debugfs-read.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/13328">i915#13328</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-devices:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@i915_pm_rpm@system-suspend-device=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13328">i915#13328</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@i915_pm_rps@min-max-config-loaded=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-3/igt@i915_pm_rps@thresholds.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-8/igt@i915_pm_sseu@full-enable.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-16/igt@i915_query@test-query-geometry-s=
ubslices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@i9=
15_selftest@live.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +1 other test dmesg-f=
ail</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-2/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6=
/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-glk5/igt@i915_suspend@forcewake.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4817">i915#4817</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@intel_hwmon@hwmon-write.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-mtlp-4/igt@kms_addfb_basic@addfb25-x-tiled-=
mismatch-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-15/igt@kms_addfb_basic@addfb25-x-tiled-=
mismatch-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@kms_addfb_basic@basic-x-tiled-leg=
acy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4212">i915#4212</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_addfb_basic@tile-pitch-mismat=
ch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-glk1/igt@kms_async_flips@async-flip-suspend=
-resume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12761">i915#12761</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-glk1/igt@kms_async_flips@async-flip-suspend=
-resume@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14995">i915#14995</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@kms_atomic_transition@plane-all-m=
odeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#=
3555</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-glk10/igt@kms_atomic_transition@plane-all-m=
odeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@kms_atomic_transition@plane-toggl=
e-modeset-transition.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5956">i915#5956</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-6/igt@kms_big_fb@4-tiled-32bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_big_fb@4-tiled-64bpp-rotate-2=
70.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb-size-ove=
rflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-18=
0-hflip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_13964/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-r=
otate-180-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5138">i915#5138</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@kms_big_fb@linear-32bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-12/igt@kms_big_fb@x-tiled-16bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@kms_big_fb@x-tiled-32bpp-rotate-2=
70.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_big_fb@y-tiled-8bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5190">i915#5190</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@kms_big_fb@y-tiled-addfb-size-ove=
rflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-mtlp-7/igt@kms_big_fb@y-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/6187">i915#6187</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5190">i915#5190</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_big_fb@yf-tiled-max-hw-stride=
-64bpp-rotate-180-async-flip.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-glk10/igt@kms_ccs@bad-pixel-format-4-tiled-=
mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> +114 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_ccs@crc-primary-basic-4-tiled=
-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#104=
34</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6095">i915#6095</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-=
2:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_ccs@crc-primary-rotation-180-=
y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#609=
5</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/6095">i915#6095</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-til=
ed-dg2-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-til=
ed-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-16/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-mc-ccs@pipe-c-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +110 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +17 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +96 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-y=
-tiled-gen12-rc-ccs-cc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +14 other tests=
 dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-3/igt@kms_ccs@random-ccs-data-4-tiled-=
bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-8/igt@kms_ccs@random-ccs-data-yf-tiled=
-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-6/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@kms_cdclk@mode-transition@pipe-d-=
hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13781">i915#13781</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-b-hd=
mi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13783">i915#13783</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_chamelium_audio@hdmi-audio.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-mtlp-6/igt@kms_chamelium_color@ctm-blue-to-=
red.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-glk5/igt@kms_chamelium_color@ctm-negative.h=
tml">SKIP</a> +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@kms_chamelium_edid@dp-edid-stress=
-resolution-non-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-2/igt@kms_chamelium_frames@hdmi-aspect=
-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +11 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-mtlp-7/igt@kms_chamelium_hpd@dp-hpd-for-eac=
h-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd-for-each=
-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-16/igt@kms_chamelium_hpd@dp-hpd-for-eac=
h-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@kms_content_protection@dp-mst-lic=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3299">i915#3299</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_content_protection@dp-mst-typ=
e-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-5/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3116">i915#3116</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@kms_content_protection@uevent.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/7118">i915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-8/igt@kms_cursor_crc@cursor-offscreen-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_cursor_crc@cursor-offscreen-5=
12x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-256x256.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/=
shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x256.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-1/igt@kms_cursor_crc@cursor-rapid-movem=
ent-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3555">i915#3555</a>) +6 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movem=
ent-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-tglu-6/igt@kms_cursor_crc@cursor-sliding-128x42.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/s=
hard-tglu-8/igt@kms_cursor_crc@cursor-sliding-128x42.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13=
566</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-128=
x42@pipe-a-hdmi-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-64x21.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/sha=
rd-rkl-7/igt@kms_cursor_crc@cursor-sliding-64x21.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566<=
/a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-4/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-3/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13964/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-atomi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_cursor_legacy@cursorb-vs-flip=
b-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9723">i915#9723</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9833">i915#9833</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@=
pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_dp_aux_dev.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i91=
5#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_dp_link_training@uhbr-sst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13748">i915#13748</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_dp_link_training@uhbr-sst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-3/igt@kms_dp_linktrain_fallback@dsc-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13707">i915#13707</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-3/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@kms_draw_crc@draw-method-mmap-wc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-2/igt@kms_dsc@dsc-fractional-bpp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@kms_dsc@dsc-fractional-bpp-with-b=
pc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-3/igt@kms_dsc@dsc-with-bpc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@kms_dsc@dsc-with-output-formats-w=
ith-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3840">i915#3840</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-w=
ith-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats-=
with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3840">i915#3840</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-9/igt@kms_dsc@dsc-with-output-formats-=
with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3840">i915#3840</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-5/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3469">i915#3469</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@kms_fbcon_fbt@psr-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-9/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-19/igt@kms_feature_discovery@psr2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-2/igt@kms_feature_discovery@psr2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@kms_feature_discovery@psr2.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@kms_fence_pin_leak.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881">=
i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@kms_flip@2x-absolute-wf_vblank.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_flip@2x-flip-vs-absolute-wf_v=
blank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_flip@2x-flip-vs-fences.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-8/igt@kms_flip@2x-flip-vs-modeset.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-glk9/igt@kms_flip@2x-flip-vs-suspend-interr=
uptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-glk9/igt@kms_flip@2x-flip-vs-suspend-interr=
uptible@ab-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-mtlp-6/igt@kms_flip@2x-nonexisting-fb-inter=
ruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_flip@2x-plain-flip-interrupti=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-15/igt@kms_flip@2x-plain-flip-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-7/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptibl=
e.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13964/shard-rkl-6/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interrupti=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3637">i915#3637</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_flip@flip-vs-panning.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_flip@wf_vblank-ts-check@a-hd=
mi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14600">i915#14600</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-=
yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)=
 +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3=
555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i9=
15#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#258=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2672">i915#2672</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) =
+1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">=
i915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pip=
e-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-y=
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
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a=
>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915=
#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-1p-=
indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-o=
ffscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-p=
rimscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5=
354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +1 other test =
skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_13964/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/sh=
ard-dg2-10/igt@kms_frontbuffer_tracking@fbc-suspend.html">ABORT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15=
132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a=
>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-snb5/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-spr-indfb-draw-blt.html">SKIP</a> +41 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +14 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +8 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_frontbuffer_tracking@pipe-fbc=
-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-o=
ffscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-o=
ffscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-=
offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-1p-=
offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-o=
ffscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +10 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +5 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +8 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +22 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +17 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +25 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-rgb=
101010-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-snb1/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-snb5/=
igt@kms_hdmi_inject@inject-audio.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@kms_hdr@bpc-switch-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_hdr@static-swap.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"=
>i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-2/igt@kms_hdr@static-toggle-dpms.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-7/igt@kms_invalid_mode@zero-hdisplay.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rk=
l-6/igt@kms_invalid_mode@zero-hdisplay.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3=
555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8826">i915#8826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@kms_joiner@basic-big-joiner.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@kms_joiner@basic-force-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12388">i915#12388</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-4/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12339">i915#12339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-10/igt@kms_joiner@invalid-modeset-forc=
e-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12394">i915#12394</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-2/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/13522">i915#13522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-2/igt@kms_panel_fitting@atomic-fastset=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6301">i915#6301</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_panel_fitting@atomic-fastset.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_panel_fitting@legacy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-10/igt@kms_pipe_stress@stress-xrgb8888=
-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_pipe_stress@stress-xrgb8888-y=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13705">i915#13705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-3/igt@kms_plane@pixel-format.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@=
kms_plane@pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe=
-b.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13964/shard-rkl-4/igt@kms_plane@plane-panning-bottom-right-suspend@p=
ipe-b.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15132">i915#15132</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-glk10/igt@kms_plane_alpha_blend@alpha-trans=
parent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/12177">i915#12177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-glk10/igt@kms_plane_alpha_blend@alpha-trans=
parent-fb@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-glk1/igt@kms_plane_alpha_blend@constant-alp=
ha-max.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-glk1/igt@kms_plane_alpha_blend@constant-alp=
ha-max@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-mtlp-4/igt@kms_plane_lowres@tiling-x.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/11614">i915#11614</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3582">i915#3582</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-mtlp-4/igt@kms_plane_lowres@tiling-x@pipe-a=
-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/10226">i915#10226</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/11614">i915#11614</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3582">i915#3582</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-10/igt@kms_plane_lowres@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_plane_multiple@tiling-y.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@kms_plane_multiple@tiling-yf.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_plane_scaling@intel-max-src-s=
ize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6953">i915#6953</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clam=
ping-pixel-formats.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_plane_scaling@plane-scaler=
-with-clipping-clamping-pixel-formats.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#35=
55</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clam=
ping-pixel-formats@pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_plane_scaling@plane=
-scaler-with-clipping-clamping-pixel-formats@pipe-a.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#122=
47</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-=
factor-0-75.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x2=
0-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#=
6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-=
factor-0-75@pipe-b.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_plane_scaling@planes-upsca=
le-20x20-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8152">i915#8152</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-1/igt@kms_pm_backlight@brightness-with-=
dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-4/igt@kms_pm_backlight@fade-with-dpms.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-6/igt@kms_pm_backlight@fade-with-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-8/igt@kms_pm_dc@dc3co-vpb-simulation.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9685">i915#9685</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-2/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6=
/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/13441">i915#13441</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_pm_dc@dc5-psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i=
915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340=
">i915#9340</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-8/igt@kms_pm_rpm@dpms-mode-unset-non-l=
psp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_pm_rpm@dpms-non-lpsp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp-stress.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp-stress-no=
-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pm-caching:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-5/igt@kms_pm_rpm@pm-caching.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@k=
ms_pm_rpm@pm-caching.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12916">i915#12916</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_prime@basic-crc-vgem.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
6524">i915#6524</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6805">i915#6805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-10/igt@kms_prime@basic-modeset-hybrid.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-4/igt@kms_prime@d3hot.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i91=
5#6524</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@kms_prime@d3hot.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i91=
5#6524</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/6805">i915#6805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_psr2_sf@fbc-pr-cursor-plane-m=
ove-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-9/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-glk5/igt@kms_psr2_sf@fbc-pr-overlay-plane-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane=
-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +8 other tests sk=
ip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-snb7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-=
move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-glk10/igt@kms_psr2_sf@pr-primary-plane-upda=
te-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@kms_psr2_sf@pr-primary-plane-upda=
te-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-13/igt@kms_psr2_sf@pr-primary-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-mtlp-8/igt@kms_psr2_sf@pr-primary-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12316">i915#12316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_psr2_su@frontbuffer-xrgb8888.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-3/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-mtlp-3/igt@kms_psr@fbc-pr-cursor-plane-move=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9688">i915#9688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-3/igt@kms_psr@fbc-psr-cursor-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9732">i915#9732</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_psr@fbc-psr-primary-mmap-gtt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9732">i915#9732</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@kms_psr@fbc-psr-sprite-mmap-gtt.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_psr@pr-sprite-plane-onoff.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9732">i915#9732</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@kms_psr@psr-cursor-render.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9732">i915#9732</a>) +21 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_psr@psr-cursor-render.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-17/igt@kms_psr@psr-cursor-render.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test s=
kip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-3/igt@kms_rotation_crc@sprite-rotation-=
90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12755">i915#12755</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-5/igt@kms_scaling_modes@scaling-mode-f=
ull-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-15/igt@kms_selftest@drm_framebuffer.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-15/igt@kms_selftest@drm_framebuffer@drm=
_test_framebuffer_create.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15119">i915#15119</a>) +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_selftest@drm_plane_helper@drm=
_test_check_invalid_plane_state.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15119">i915#15119</a>) +5 other tes=
ts fail</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_selftest@drm_plane_helper@dr=
m_test_check_invalid_plane_state.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15119">i915#15119</a>) +2 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-12/igt@kms_setmode@invalid-clone-single=
-crtc-stealing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-mtlp-2/igt@kms_setmode@invalid-clone-single=
-crtc-stealing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-=
2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13964/shard-rkl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-=
a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9196">i915#9196</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_vrr@flipline.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i9=
15#3555</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_vrr@flipline.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i=
915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-3/igt@kms_vrr@max-min.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i91=
5#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-7/igt@kms_vrr@negative-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-drrs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_vrr@seamless-rr-switch-vrr.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-2/igt@kms_writeback@writeback-fb-id.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2437">i915#2437</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-mtlp-4/igt@kms_writeback@writeback-fb-id.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2437">i915#2437</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@kms_writeback@writeback-fb-id.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2437">i915#2437</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_writeback@writeback-fb-id.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2437">i915#2437</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-8/igt@kms_writeback@writeback-fb-id-xr=
gb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2437">i915#2437</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-3/igt@kms_writeback@writeback-invalid-p=
arameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@perf@mi-rpc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#24=
34</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-8/igt@perf@non-zero-reason.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100=
">i915#9100</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@perf_pmu@busy-double-start@vecs1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4349">i915#4349</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@perf_pmu@frequency@gt0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12=
549">i915#12549</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6806">i915#6806</a>) +1 other test fail</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg1-19/igt@perf_pmu@frequency@gt0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
2549">i915#12549</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/6806">i915#6806</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-glk10/igt@perf_pmu@module-unload.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
433">i915#14433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-1/igt@perf_pmu@rc6-all-gts.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/851=
6">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-glk6/igt@perf_pmu@rc6-suspend.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@perf_pmu@rc6@other-idle-gt0.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-5/igt@prime_vgem@basic-fence-read.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@prime_vgem@basic-gtt.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708=
">i915#3708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@prime_vgem@basic-write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
91">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-9/igt@prime_vgem@fence-write-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-tglu-2/igt@sriov_basic@enable-vfs-bind-unbi=
nd-each@numvfs-random.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12910">i915#12910</a>) +18 other tests fail</=
li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@fbdev@nullptr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#=
2582</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
3964/shard-rkl-2/igt@fbdev@nullptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-dg2-5/igt@gem_create@create-ext-cpu-access-big.html">ABORT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/134=
27">i915#13427</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13964/shard-dg2-6/igt@gem_create@create-ext-cpu-access-big.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-dg2-1/igt@gem_exec_suspend@basic-s0@lmem0.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/133=
56">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13964/shard-dg2-5/igt@gem_exec_suspend@basic-s0@lmem0.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1335=
6">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_13964/shard-rkl-2/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-tglu-3/igt@gem_exec_suspend@basic-s4-devices.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15136"=
>i915#15136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13964/shard-tglu-8/igt@gem_exec_suspend@basic-s4-devices.html">PASS</=
a> +1 other test pass</li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-mtlp-3/igt@gem_exec_suspend@basic-s4-devices.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15136"=
>i915#15136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13964/shard-mtlp-6/igt@gem_exec_suspend@basic-s4-devices.html">PASS</=
a> +1 other test pass</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-8/igt@gem_exec_suspend@basic-s4-devices.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15136">=
i915#15136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13964/shard-rkl-8/igt@gem_exec_suspend@basic-s4-devices.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-dg1-12/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493=
">i915#5493</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13964/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a=
> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-3/igt@gem_pxp@create-regular-context-2.html">TIMEOUT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917=
">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@gem_pxp@create-regular-context=
-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@gem_pxp@fail-invalid-protected-context.html">TIME=
OUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13964/shard-rkl-8/igt@gem_pxp@fail-invalid-protected-context.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8603/shard-dg2-6/igt@i915_module_load@load.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-10/igt@i915_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGT_8603/shard-dg2-1/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-1/igt@i9=
15_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGT_8603/shard-dg2-1/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-1/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGT_8603/shard-dg2-3/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg=
2-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-3/igt@i915_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/sha=
rd-dg2-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-4/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_860=
3/shard-dg2-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-5/igt@i915_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
T_8603/shard-dg2-5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-5/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGT_8603/shard-dg2-6/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-7/igt@i915_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGT_8603/shard-dg2-7/igt@i915_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-7/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGT_8603/shard-dg2-8/igt@i915_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-8=
/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGT_8603/shard-dg2-8/igt@i915_module_load@load.html">PA=
SS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14785">i915#14785</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_13964/shard-dg2-8/igt@i915_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-5/=
igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_13964/shard-dg2-7/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/s=
hard-dg2-5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-3/igt@i915_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_13964/shard-dg2-5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-10/igt@i915_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_13964/shard-dg2-3/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-=
7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@i915_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964=
/shard-dg2-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-1/igt@i915_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13964/shard-dg2-8/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-1/igt@i9=
15_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@i915_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-d=
g2-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13=
964/shard-dg2-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13964/shard-dg2-3/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-6/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-dg2-10/igt@i915_module_load@load.html">PASS=
</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-dg1-14/igt@i915_module_load@reload-no-display.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13029">i915#13029</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14545">i915#14545</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-17/igt@i915_module_load@reload=
-no-display.html">PASS</a></li>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-snb4/igt@i915_module_load@reload-no-display.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4545">i915#14545</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_13964/shard-snb1/igt@i915_module_load@reload-no-display.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@debugfs-read:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-dg1-14/igt@i915_pm_rpm@debugfs-read.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i91=
5#4423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_13964/shard-dg1-13/igt@i915_pm_rpm@debugfs-read.html">PASS</a> +1 other te=
st pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_atomic_transition@plane-use-after-nonblocking=
-unbind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_atomic_transition@pla=
ne-use-after-nonblocking-unbind.html">PASS</a> +53 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-2/igt@kms_cursor_crc@cursor-random-64x21.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566"=
>i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13964/shard-rkl-8/igt@kms_cursor_crc@cursor-random-64x21.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-256x85.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/135=
66">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13964/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-256x85.html"=
>PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_cursor_=
legacy@basic-flip-after-cursor-varying-size.html">PASS</a> +3 other tests p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">=
i915#13749</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13964/shard-dg2-10/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-3/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878">i91=
5#9878</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_13964/shard-rkl-2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_flip@wf_vblank-ts-check-interruptible.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3637">i915#3637</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_flip@wf_vblank-ts-chec=
k-interruptible.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xti=
le-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_fl=
ip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_fr=
ontbuffer_tracking@fbc-rgb565-draw-render.html">PASS</a> +5 other tests pas=
s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8826">i915#8826</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_invalid_mode@clock=
-too-high.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-dg2-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12388">i915#12388</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_13964/shard-dg2-10/igt@kms_joiner@invalid-modeset-force-big-=
joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-4/igt@kms_plane@pixel-format-source-clamping@pipe-b-pla=
ne-0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_plane@pixel-format=
-source-clamping@pipe-b-plane-0.html">PASS</a> +45 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_plane@plane-position-covered.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/8825">i915#8825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_plane@plane-position-covered.ht=
ml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-=
modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@kms_plane=
_scaling@plane-upscale-factor-0-25-with-modifiers.html">PASS</a> +1 other t=
est pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-ups=
cale-20x20@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt=
@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a.html">P=
ASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-=
factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-=
7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">PAS=
S</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-=
factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964=
/shard-rkl-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-=
5@pipe-b.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-3/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12916">i915#12916<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/=
shard-rkl-7/igt@kms_pm_rpm@cursor-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073"=
>i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13964/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs0:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-dg1-12/igt@perf_pmu@busy-double-start@vecs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i=
915#4349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_13964/shard-dg1-14/igt@perf_pmu@busy-double-start@vecs0.html">PASS</a> +=
2 other tests pass</li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-mtlp-6/igt@perf_pmu@busy-double-start@vecs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i=
915#4349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_13964/shard-mtlp-5/igt@perf_pmu@busy-double-start@vecs0.html">PASS</a> +=
2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-4/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/43=
49">i915#4349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_13964/shard-rkl-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13964/shard-rkl-2/igt@prime_vgem@basic-fence-flip.html">PASS</=
a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/110=
78">i915#11078</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@device_reset@unbind-cold-res=
et-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11078">i915#11078</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@gem_ccs@block-copy-compr=
essed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9323">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@gem_ccs@block-multicopy-compresse=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9323">i915#9323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/7697">i915#7697</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@gem_close_race@multigpu-basic-=
threads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8562">i915#8562</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_13964/shard-rkl-7/igt@gem_create@create-ext-set-pat.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-7/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-=
rkl-6/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/28=
0">i915#280</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13964/shard-rkl-2/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</=
a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@gem_exec_balancer@parallel-keep-in-fence.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_13964/shard-rkl-4/igt@gem_exec_balancer@parallel-=
keep-in-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-8/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281=
">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13964/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_13964/shard-rkl-3/igt@gem_exec_reloc@basic-write-read.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/7276">i915#7276</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_13964/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/7276">i915#7276</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/219=
0">i915#2190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13964/shard-rkl-5/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190=
</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-2/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964=
/shard-rkl-6/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915=
#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13964/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify=
-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-display:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-8/igt@gem_partial_pwrite_pread@write-display.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
82">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_13964/shard-rkl-6/igt@gem_partial_pwrite_pread@write-display.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-uncached:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@gem_partial_pwrite_pread@write-uncached.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@gem_partial_pwrite_pread@wri=
te-uncached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915=
#13717</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_13964/shard-rkl-3/igt@gem_pxp@hw-rejects-pxp-buffer.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15138">i915#15=
138</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-5/igt@gem_pxp@hw-rejects-pxp-context.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15169">i91=
5#15169</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_13964/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#=
13717</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@gem_userptr_blits@access-control.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_13964/shard-rkl-5/igt@gem_userptr_blits@access-control.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-3/igt@gen7_exec_parse@bitmasks.html">SKIP</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/ig=
t@gen7_exec_parse@bitmasks.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +9 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_13964/shard-rkl-7/igt@gen9_exec_parse@bb-start-param.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@i915_module_load@resize-bar.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6412">i915#6412</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13964/shard-rkl-8/igt@i915_module_load@resize-bar.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412=
">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-3/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#83=
99</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_139=
64/shard-rkl-6/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399=
">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6590">i915#6590</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_13964/shard-rkl-8/igt@i915_pm_freq_mult@media-freq@gt0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-3/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/sh=
ard-rkl-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#770=
7</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12454">i915#12454</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12712">i915#12712</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_ad=
dfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#1=
2712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transitio=
n-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@km=
s_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_atomic_transition@plane-all-transition-fencin=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@kms_atomic_transition@plane-all=
-transition-fencing.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +2 other tests dme=
sg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13964/shard-rkl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/52=
86">i915#5286</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i=
915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_13964/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13964/shard-rkl-7/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">=
i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638"=
>i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13964/shard-rkl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-1=
80-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4423">i915#4423</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-16/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#=
4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-=
b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_ccs@=
bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_13964/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_ccs@crc-primary-s=
uspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_13964/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6095">i915#6095</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-cc=
s@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_ccs@crc-sprit=
e-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#140=
98</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1115=
1">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_chamelium_f=
rames@hdmi-crc-single.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-5/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
1151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fo=
r-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-2/igt@kms_color@ctm-blue-to-red.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i9=
15#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_13964/shard-rkl-6/igt@kms_color@ctm-blue-to-red.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#126=
55</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13964/shard-rkl-5/igt@kms_content_protection@atomic-dpms.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118=
">i915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_13964/shard-rkl-5/igt@kms_content_protection@dp-mst-type-0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_content_protection@mei-interface.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_13964/shard-rkl-4/igt@kms_content_protection@mei-interface.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-dg2-4/igt@kms_content_protection@type1.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7=
118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9424">i915#9424</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_13964/shard-dg2-10/igt@kms_content_protection@type1.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/711=
8">i915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/7162">i915#7162</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/135=
66">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13964/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12964">i915#12964</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13964/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13566">i915#13566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
049">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_13964/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13964/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-7/igt@kms_cursor_crc@cursor-random-256x85.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566=
">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13964/shard-rkl-6/igt@kms_cursor_crc@cursor-random-256x85.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_13964/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x512.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_13964/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-32=
x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-4/igt@kms_cursor_crc@cursor-suspend.html">ABORT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i91=
5#15132</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_13964/shard-rkl-6/igt@kms_cursor_crc@cursor-suspend.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_13964/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-leg=
acy.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-l=
egacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-3/igt@kms_display_modes@extended-mode-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/136=
91">i915#13691</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13964/shard-rkl-6/igt@kms_display_modes@extended-mode-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13964/shard-rkl-3/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749"=
>i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_13964/shard-rkl-8/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13=
748</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13964/shard-rkl-4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i9=
15#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840"=
>i915#3840</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13964/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i=
915#3955</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_13964/shard-rkl-8/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_feature_discovery@display-3x.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/1839">i915#1839</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_feature_discovery@display-3x.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_13964/shard-rkl-2/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i91=
5#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-5/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934"=
>i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13964/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-snb1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14033">i915#14033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14350">i915#14350</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_13964/shard-snb7/igt@kms_flip@2x-flip-vs-sus=
pend-interruptible.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14849">i915#14849</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/14871">i915#14871</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-snb1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-=
hdmi-a1.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14033">i915#14033</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_13964/shard-snb7/igt@kms_flip@2x-flip-vs-sus=
pend-interruptible@ab-vga1-hdmi-a1.html">ABORT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/14849">i915#14849</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14871">i915#148=
71</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_flip@dpms-off-confusion.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3637">i915#3637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13964/shard-rkl-7/igt@kms_flip@dpms-off-confusion.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4ti=
ledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/ig=
t@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yf=
tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@km=
s_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672"=
>i915#2672</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3555">i915#3555</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt=
:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-=
indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_frontbuff=
er_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915=
#15102</a>) +4 other tests skip</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri=
-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-16/i=
gt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15104">i915#15104</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-i=
ndfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shar=
d-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3023">i915#3023</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/10433">i915#10433</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard=
-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3458">i915#3458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-i=
ndfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_frontbuffer_tracking@=
fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5=
354">i915#5354</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3458">i915#3458</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_13964/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc=
psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/10433">i915#10433</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@kms_frontbuff=
er_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_frontbuffer_t=
racking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indf=
b-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_f=
rontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5354">i915#5354</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-ms=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/=
igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825"=
>i915#1825</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
3964/shard-rkl-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-dg1-13/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i91=
5#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4423">i915#4423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg1-16/igt@kms_hdr@invalid-metadat=
a-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/s=
hard-rkl-3/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html">ABORT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i9=
15#15132</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_13964/shard-dg2-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3=
555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8228">i915#8228</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-4/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#=
3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13964/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/106=
56">i915#10656</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_13964/shard-rkl-4/igt@kms_joiner@invalid-modeset-b=
ig-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_139=
64/shard-rkl-8/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i91=
5#13958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_13964/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13964/shard-rkl-5/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958"=
>i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-2/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i91=
5#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_13964/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3828">i915#3828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_pm_dc@dc5-retention-flops.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-2/igt@kms_pm_rpm@modeset-non-=
lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6524">i915#6524</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_13964/shard-rkl-2/igt@kms_prime@basic-crc-hybrid.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">=
i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13964/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-s=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-5/igt@kms_psr2_sf@pr-ove=
rlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9683">i915#9683</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_13964/shard-rkl-7/igt@kms_psr2_su@frontbuffer-xrgb8888.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9683">i915#9683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-basic:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-dg1-16/igt@kms_psr@fbc-pr-basic.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732"=
>i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13964/shard-dg1-14/igt@kms_psr@fbc-pr-basic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423=
">i915#4423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-4/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13964/shard-rkl-6/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1=
072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@kms_psr@psr2-suspend.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072=
">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9732">i915#9732</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-5/igt@kms_psr_stress_test@invalidate-primary-flip-overl=
ay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9685">i915#9685</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-3/igt@kms_rotation_crc@bad-pixel-format.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
2964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_13964/shard-rkl-6/igt@kms_rotation_crc@bad-pixel-format.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/5289">i915#5289</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_13964/shard-rkl-6/igt@kms_rotation_crc@primary-4-tiled-refl=
ect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-7/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/355=
5">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13964/shard-rkl-6/igt@kms_setmode@invalid-clone-single-crtc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_tiled_display@basic-test-p=
attern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-7/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-=
6/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13964/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906=
">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@kms_writeback@writeback-pixel-formats.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2437">i915#2437</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9412">i915#9412</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-rkl-3/igt@kms_writeback@wr=
iteback-pixel-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@perf@polling-small-buf.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14550">i915#14550<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/=
shard-rkl-2/igt@perf@polling-small-buf.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)=
</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@perf@unprivileged-single-ctx-counters.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2433">i915#2433</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13964/shard-rkl-7/igt@perf@unprivileged-single-ctx-c=
ounters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8603/shard-rkl-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
91">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_13964/shard-rkl-8/igt@prime_vgem@basic-write.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8603 -&gt; IGTPW_13964</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17454: 05dafb7f913af8cf6b33e482649d28ee7912a209 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_13964: 621306d352af13acd6909948f044e9094bd32587 @ https://gitlab.fr=
eedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8603: e6eb3c0fe0f28f3d6e530ae202fbb9f29bde9147 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2038103385650530282==--
