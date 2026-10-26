Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02978606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 11:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CE410EE4C;
	Mon, 26 Oct 2026 11:13:49 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B175810EE4B;
 Mon, 26 Oct 2026 11:12:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1523931175290452007=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Fexec=5F?=
 =?utf-8?q?system=5Fallocator=3A_Skip_unsupported_PAT_madvise_indices?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 26 Oct 2026 11:12:58 -0000
Message-ID: <179301317869.70099.7475941877307876890@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261026052051.1472943-1-nishit.sharma@intel.com>
In-Reply-To: <20261026052051.1472943-1-nishit.sharma@intel.com>
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

--===============1523931175290452007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_system_allocator: Skip unsupported PAT madvise indices
URL   : https://patchwork.freedesktop.org/series/176802/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9164_full -> IGTPW_16045_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_16045_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_16045_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_16045_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-glk10:        NOTRUN -> [SKIP][1] +50 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk10/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-glk11:        NOTRUN -> [SKIP][2] +159 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk11/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-wc:
    - shard-glk:          [PASS][3] -> [SKIP][4] +10 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-glk8/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-wc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk4/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-wc.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][5] +405 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk8/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-snb:          NOTRUN -> [SKIP][6] +34 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-snb5/igt@kms_rotation_crc@bad-pixel-format.html

  
New tests
---------

  New tests have been introduced between IGT_9164_full and IGTPW_16045_full:

### New IGT tests (45) ###

  * igt@kms_atomic@2x-flip-vs-dpms-off-vs-modeset:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic@basic-uaf:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic@dpms-audio-recovery:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic@dpms-vs-vblank-race-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic@drm_format_helper:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic@hdr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic@hdr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic@invalid:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic@linear-64bpp-rotate-0:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic@load:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic@pixel-format-y-tiled-gen12-rc-ccs-modifier:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic@system-suspend-idle:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@cursor-offscreen-128x42@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.63] s

  * igt@kms_cursor_crc@cursor-offscreen-256x85@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.38] s

  * igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.38] s

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.44] s

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.10] s

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.69] s

  * igt@kms_cursor_crc@cursor-random-64x21@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.10] s

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_cursor_crc@cursor-rapid-movement-64x64@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_cursor_crc@cursor-sliding-64x64@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.97] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-linear-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-linear-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-x-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-x-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-rc-ccs-cc-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-rc-ccs-cc-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-rc-ccs-cc-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-rc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-rc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-rc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_plane_alpha_blend@coverage-7efc@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  

Known issues
------------

  Here are the changes found in IGTPW_16045_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#8411])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#11078])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#11078]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_read@empty-nonblock:
    - shard-dg2:          [PASS][10] -> [SKIP][11] ([i915#17359])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-4/igt@drm_read@empty-nonblock.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@drm_read@empty-nonblock.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#7697]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@gem_basic@multigpu-create-close.html
    - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#7697]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-2/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#3555] / [i915#9323])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu-1:       NOTRUN -> [SKIP][15] ([i915#9323])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#9323])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#9323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@gem_ccs@suspend-resume.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][18] ([i915#13356] / [i915#16466])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk3/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_isolation@preservation-s3@ccs0:
    - shard-mtlp:         NOTRUN -> [FAIL][19] ([i915#17176])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-4/igt@gem_ctx_isolation@preservation-s3@ccs0.html

  * igt@gem_ctx_isolation@preservation-s3@vcs1:
    - shard-mtlp:         NOTRUN -> [ABORT][20] ([i915#17174]) +1 other test abort
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-4/igt@gem_ctx_isolation@preservation-s3@vcs1.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#280]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-tglu:         NOTRUN -> [SKIP][22] ([i915#280])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#14544] / [i915#280])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][24] ([i915#13356] / [i915#13390])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk3/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@kms:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][25] ([i915#13363])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#4771])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-5/igt@gem_exec_balancer@bonded-dual.html
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#4771])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#8555]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel:
    - shard-tglu-1:       NOTRUN -> [SKIP][29] ([i915#4525]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#4525]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@gem_exec_balancer@parallel-balancer.html
    - shard-tglu:         NOTRUN -> [SKIP][31] ([i915#4525]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-3/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#6334]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][33] ([i915#6334]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk5/igt@gem_exec_capture@capture-invisible@smem0.html
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#14544] / [i915#6334]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_fence@submit67:
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#4812]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#3539] / [i915#4852]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#3539])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-14/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#3539] / [i915#4852]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-1/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#3281]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#3281]) +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-2/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#3281]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-5/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-write-gtt-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#14544] / [i915#3281]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@gem_exec_reloc@basic-write-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#3281]) +16 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4537] / [i915#4812])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [PASS][45] -> [INCOMPLETE][46] ([i915#13356]) +1 other test incomplete
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@gem_exec_suspend@basic-s0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-1/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-mtlp:         [PASS][47] -> [INCOMPLETE][48] ([i915#13356] / [i915#7975]) +1 other test incomplete
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-mtlp-4/igt@gem_exec_suspend@basic-s4-devices.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-6/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4860]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_fenced_exec_thrash@too-many-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#4860])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-3/igt@gem_fenced_exec_thrash@too-many-fences.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#14544] / [i915#4613])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#4565]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-glk:          NOTRUN -> [SKIP][53] ([i915#4613]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk4/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#4613]) +5 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#12193]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4613])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-6/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][57] ([i915#4613]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-9/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][58] ([i915#4613])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_mmap@bad-object:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4083]) +6 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-17/igt@gem_mmap@bad-object.html

  * igt@gem_mmap_gtt@cpuset-medium-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4077]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-2/igt@gem_mmap_gtt@cpuset-medium-copy.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4083]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-8/igt@gem_mmap_wc@write-wc-read-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#4083]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-3/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@write-snoop:
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#3282]) +8 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-2/igt@gem_partial_pwrite_pread@write-snoop.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#3282]) +6 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-14/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#3282])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> [WARN][66] ([i915#14702] / [i915#2658])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk8/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglu-1:       NOTRUN -> [WARN][67] ([i915#2658])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pwrite@basic-random:
    - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#14544] / [i915#3282]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu:         NOTRUN -> [SKIP][69] ([i915#13398])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-8/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#4270])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4270]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_readwrite@new-obj:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#3282])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-7/igt@gem_readwrite@new-obj.html

  * igt@gem_render_copy@linear-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#5190] / [i915#8428]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@gem_render_copy@linear-to-vebox-y-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#8428])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-2/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#8411])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4079])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#4079]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][78]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-1/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-tglu-1:       NOTRUN -> [SKIP][79]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiling_max_stride:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#4077]) +4 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@gem_tiling_max_stride.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#3297]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@gem_userptr_blits@coherency-sync.html
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#17433] / [i915#3297])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@gem_userptr_blits@coherency-sync.html
    - shard-tglu:         NOTRUN -> [SKIP][83] ([i915#17433] / [i915#3297])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-10/igt@gem_userptr_blits@coherency-sync.html
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#3297]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-6/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][85] ([i915#3297]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-4/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#3282] / [i915#3297])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@gem_userptr_blits@forbidden-operations.html
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#3282] / [i915#3297])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#3282] / [i915#3297])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@gem_userptr_blits@forbidden-operations.html
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#3282] / [i915#3297])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-2/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#3297] / [i915#4880])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#3297] / [i915#4880]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#3297])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#3297]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][94] ([i915#13356] / [i915#14586]) +1 other test incomplete
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk4/igt@gem_workarounds@suspend-resume.html

  * igt@gen3_render_linear_blits:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#17455]) +6 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-tglu-1:       NOTRUN -> [SKIP][96] ([i915#17455]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@gen7_exec_parse@basic-offset.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#17455]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#17455])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@gen7_exec_parse@bitmasks.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#17455]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-6/igt@gen7_exec_parse@oacontrol-tracking.html
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#14544] / [i915#17455])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#2527] / [i915#2856])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-8/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-mtlp:         NOTRUN -> [SKIP][102] ([i915#2856])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-8/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#2527]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-1/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-tglu-1:       NOTRUN -> [SKIP][104] ([i915#2527] / [i915#2856]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@gen9_exec_parse@secure-batches.html

  * igt@gpu_buddy@gpu_buddy:
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#15678])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-16/igt@gpu_buddy@gpu_buddy.html

  * igt@i915_drm_fdinfo@all-busy-idle-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#14123])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@i915_drm_fdinfo@all-busy-idle-check-all.html

  * igt@i915_drm_fdinfo@busy-hang@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][107] ([i915#14073]) +6 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-3/igt@i915_drm_fdinfo@busy-hang@ccs0.html

  * igt@i915_drm_fdinfo@busy-hang@vcs0:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#14073]) +7 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-8/igt@i915_drm_fdinfo@busy-hang@vcs0.html

  * igt@i915_drm_fdinfo@most-busy-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#14073]) +11 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-14/igt@i915_drm_fdinfo@most-busy-check-all@vcs1.html

  * igt@i915_fb_tiling@basic-x-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#13786])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@i915_fb_tiling@basic-x-tiling.html

  * igt@i915_module_load@fault-injection:
    - shard-dg1:          NOTRUN -> [ABORT][111] ([i915#11814] / [i915#15481]) +1 other test abort
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-16/igt@i915_module_load@fault-injection.html

  * igt@i915_module_load@fault-injection@i915_driver_mmio_probe:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][112] ([i915#15481])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-16/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-glk11:        NOTRUN -> [ABORT][113] ([i915#15342]) +1 other test abort
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk11/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#8399])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [PASS][115] -> [INCOMPLETE][116] ([i915#13356] / [i915#13820]) +1 other test incomplete
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-5/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#6590]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#6590]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglu:         NOTRUN -> [SKIP][119] ([i915#14498])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#17434] / [i915#17450])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-14/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#5723])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-10/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@forcewake:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][122] ([i915#4817])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@i915_suspend@forcewake.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu:         NOTRUN -> [SKIP][123] ([i915#7707])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-9/igt@intel_hwmon@hwmon-read.html
    - shard-glk:          NOTRUN -> [SKIP][124] ([i915#11680])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk3/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#4212]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#4215])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-17/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu-1:       NOTRUN -> [SKIP][127] ([i915#12454] / [i915#12712])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-mtlp:         NOTRUN -> [SKIP][128] ([i915#4212])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-5/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][129] ([i915#14888]) +1 other test fail
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][130] ([i915#12761] / [i915#13356]) +1 other test incomplete
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk11/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3:
    - shard-dg2:          [PASS][131] -> [INCOMPLETE][132] ([i915#12761] / [i915#13356]) +1 other test incomplete
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-5/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-dg2:          [PASS][133] -> [SKIP][134] ([i915#17356]) +44 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_atomic@atomic-invalid-params@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [ABORT][135] ([i915#13562])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_atomic@atomic-invalid-params@pipe-a-hdmi-a-3.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][136] ([i915#1769])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#1769] / [i915#3555])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#4538] / [i915#5286]) +6 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#17431]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-4/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#4538] / [i915#5286]) +6 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
    - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#17432] / [i915#5286]) +4 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-9/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#5286])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][143] ([i915#17432] / [i915#5286]) +3 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#14544] / [i915#17431] / [i915#3638])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#17431] / [i915#3638]) +5 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#3828])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#3828])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-14/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#3828])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#17431])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][150] ([i915#17431]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#3638]) +3 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-17/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#17431])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-4/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg1:          [PASS][153] -> [DMESG-WARN][154] ([i915#4423])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg1-14/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-14/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#17432]) +3 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-tglu-1:       NOTRUN -> [SKIP][156] ([i915#17432]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#17432])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#4538]) +5 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#4538]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#4538] / [i915#5190])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#17432]) +3 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#6095]) +205 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#17356]) +7 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#12313])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#6095]) +14 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-7/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#10307] / [i915#6095]) +78 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#12313]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][168] ([i915#6095]) +24 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#12805])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#12805])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#6095]) +39 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#12805])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][173] ([i915#13356] / [i915#15582]) +1 other test incomplete
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk9/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-rkl:          [PASS][174] -> [INCOMPLETE][175] ([i915#15582])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#6095]) +20 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][177] ([i915#15582])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][178] ([i915#13356] / [i915#15582]) +1 other test incomplete
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk10/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#14098] / [i915#14544] / [i915#6095]) +10 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#12313])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][181] ([i915#12313]) +2 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#14544] / [i915#6095]) +10 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#14098] / [i915#6095]) +50 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#6095]) +72 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-rejected-max-dotclock:
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#17099])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-9/igt@kms_cdclk@mode-rejected-max-dotclock.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#3742])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#3742])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-9/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#11151])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-1/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#17427]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_chamelium_color@ctm-0-50.html
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#17427]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_chamelium_color@ctm-0-50.html
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#17427]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-3/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#17427]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-9/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-tglu-1:       NOTRUN -> [SKIP][194] ([i915#17427]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@degamma:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#17427]) +3 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-tglu:         NOTRUN -> [SKIP][196] ([i915#16471] / [i915#17427])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-4/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
    - shard-tglu-1:       NOTRUN -> [SKIP][197] ([i915#16471] / [i915#17427])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#14544] / [i915#17427])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#16471] / [i915#17427])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#16471] / [i915#17427]) +2 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#11151] / [i915#7828]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#11151] / [i915#7828]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-5/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#11151] / [i915#7828]) +10 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-16/igt@kms_chamelium_frames@dp-crc-single.html
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#11151] / [i915#7828]) +4 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-3/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#11151] / [i915#7828]) +12 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][207] ([i915#11151] / [i915#7828]) +3 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_color@background-color@pipe-a-background-color:
    - shard-glk11:        NOTRUN -> [FAIL][208] ([i915#17133]) +3 other tests fail
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk11/igt@kms_color@background-color@pipe-a-background-color.html

  * igt@kms_color@gamma:
    - shard-dg2:          [PASS][209] -> [SKIP][210] ([i915#12655] / [i915#17373]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-6/igt@kms_color@gamma.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_color@gamma.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-c-plane-3:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#16990]) +7 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-1/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-c-plane-3.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d:
    - shard-dg2:          [PASS][212] -> [SKIP][213] ([i915#15529]) +4 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-1/igt@kms_color_pipeline@plane-lut1d-lut1d.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-3:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#16990]) +5 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-3.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-5:
    - shard-tglu-1:       NOTRUN -> [SKIP][215] ([i915#16990]) +15 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-5.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#16990]) +15 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#14544] / [i915#15865])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_content_protection@atomic-dpms-hdcp14.html
    - shard-mtlp:         NOTRUN -> [SKIP][218] ([i915#15865])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-6/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#15865]) +3 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@content-type-change:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#15865]) +2 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#14544] / [i915#15330] / [i915#3116])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#15330] / [i915#3299])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][223] ([i915#15865]) +2 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@type1:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#15865]) +3 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#13049]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-tglu:         NOTRUN -> [SKIP][226] ([i915#13049]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-10/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#3555] / [i915#8814])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-2/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][228] ([i915#13566]) +1 other test fail
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#3555]) +7 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#3555]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][231] -> [FAIL][232] ([i915#13566]) +1 other test fail
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-tglu-3/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-10/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#13049]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-tglu-1:       [PASS][234] -> [FAIL][235] ([i915#13566]) +1 other test fail
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-tglu-1/igt@kms_cursor_crc@cursor-random-64x21.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-tglu-1:       NOTRUN -> [SKIP][236] ([i915#3555])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#8814])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-tglu:         NOTRUN -> [FAIL][238] ([i915#13566]) +1 other test fail
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#13049] / [i915#14544])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#17428] / [i915#17454]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-10/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#17428]) +83 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
    - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#17428] / [i915#9809]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#4103])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#4103])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#4103])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#16119] / [i915#4213])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#4103])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-tglu-1:       NOTRUN -> [SKIP][248] ([i915#17428] / [i915#17454]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          NOTRUN -> [FAIL][249] ([i915#15804])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-tglu:         NOTRUN -> [SKIP][250] ([i915#9067])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#14544] / [i915#4103])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#9723])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#9723])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][254] ([i915#13691])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#17288])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-tglu-1:       NOTRUN -> [SKIP][256] ([i915#13748])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#17285])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#17285])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html
    - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#17285])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-4/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#16867])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-tglu:         NOTRUN -> [SKIP][261] ([i915#16867])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#13707] / [i915#14544])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#13707])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-9/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#16870])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-3/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][265] ([i915#8812])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#16361]) +3 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#16361]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][268] ([i915#16361]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-3/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][269] ([i915#16361]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#14544] / [i915#16361])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][271] ([i915#16361]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2:          [PASS][272] -> [SKIP][273] ([i915#1849])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-4/igt@kms_fbcon_fbt@fbc-suspend.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#16680])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-17/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu-1:       NOTRUN -> [SKIP][275] ([i915#16081])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#16081])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dsc:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#16600])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_feature_discovery@dsc.html

  * igt@kms_feature_discovery@hdr:
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#16600]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@kms_feature_discovery@hdr.html
    - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#16600])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-9/igt@kms_feature_discovery@hdr.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#658])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-2/igt@kms_feature_discovery@psr1.html
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#658])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#658]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#3637] / [i915#9934]) +5 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#9934]) +6 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][285] -> [FAIL][286] ([i915#13027]) +1 other test fail
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#9934]) +3 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-plain-flip:
    - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#9934]) +10 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][289] ([i915#3637] / [i915#9934]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#14544] / [i915#9934]) +2 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#3637] / [i915#9934]) +5 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-4/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
    - shard-dg2:          [PASS][292] -> [SKIP][293] ([i915#17358])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-5/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][294] ([i915#16276] / [i915#6113]) +1 other test incomplete
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@kms_flip@flip-vs-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][295] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183] / [i915#4839] / [i915#6113])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk5/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][296] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183] / [i915#6113])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk5/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@modeset-vs-vblank-race:
    - shard-dg2:          [PASS][297] -> [SKIP][298] ([i915#5354]) +4 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-3/igt@kms_flip@modeset-vs-vblank-race.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_flip@modeset-vs-vblank-race.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#15643]) +4 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][300] ([i915#15643])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#15643]) +2 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#15643])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-dg2:          [PASS][303] -> [SKIP][304] ([i915#3555] / [i915#8813]) +2 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#14544] / [i915#15643])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][306] ([i915#15643]) +2 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:
    - shard-dg2:          [PASS][307] -> [SKIP][308] ([i915#8813])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-5/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#17452])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][310] ([i915#15991] / [i915#5354]) +9 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#14544] / [i915#17428] / [i915#1825]) +2 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][312] ([i915#15991] / [i915#17428] / [i915#1825]) +11 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][313] ([i915#15990] / [i915#8708]) +15 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:
    - shard-dg2:          [PASS][314] -> [SKIP][315] ([i915#16708] / [i915#5354]) +2 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][316] ([i915#10055])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-tglu:         NOTRUN -> [SKIP][317] ([i915#15989]) +13 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][318] ([i915#15990]) +29 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-14/igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#16708]) +6 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-stridechange:
    - shard-tglu-1:       NOTRUN -> [SKIP][320] ([i915#15989]) +9 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#5439]) +2 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][322] ([i915#5439]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-3/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#15104] / [i915#15990]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#14544] / [i915#15102]) +5 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][325] ([i915#16708] / [i915#5354]) +3 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglu-1:       NOTRUN -> [SKIP][326] ([i915#17428]) +32 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][327] ([i915#15102]) +20 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
    - shard-dg1:          NOTRUN -> [SKIP][328] ([i915#15102]) +43 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][329] ([i915#15990] / [i915#8708]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#5439])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][331] ([i915#14544] / [i915#17428]) +11 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#15989]) +26 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt:
    - shard-rkl:          [PASS][333] -> [SKIP][334] ([i915#15989]) +5 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-pgflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][335] ([i915#15989]) +8 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][336] ([i915#15989]) +3 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][337] ([i915#15989]) +22 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][338] ([i915#15990]) +5 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][339] ([i915#15991]) +5 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][340] ([i915#15991] / [i915#17428]) +12 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-7/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu-1:       NOTRUN -> [SKIP][341] ([i915#9766])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#9766])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][343] ([i915#15102]) +3 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-tglu:         NOTRUN -> [SKIP][344] ([i915#15102]) +29 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][345] ([i915#17428] / [i915#1825]) +10 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][346] ([i915#15102]) +55 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][347] ([i915#17428]) +94 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][348] ([i915#17428]) +60 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-8/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][349] ([i915#15990]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-5/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
    - shard-snb:          NOTRUN -> [FAIL][350] ([i915#17104])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-snb7/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html
    - shard-mtlp:         NOTRUN -> [SKIP][351] ([i915#17103])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-4/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html

  * igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:
    - shard-dg2:          [PASS][352] -> [SKIP][353] ([i915#17357])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-3/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          [PASS][354] -> [SKIP][355] ([i915#16644] / [i915#3555] / [i915#8228])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-1/igt@kms_hdr@bpc-switch-dpms.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-2/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-rkl:          NOTRUN -> [SKIP][356] ([i915#16644] / [i915#3555] / [i915#8228]) +1 other test skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-dg2:          NOTRUN -> [SKIP][357] ([i915#16518] / [i915#3555] / [i915#8228])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_hdr@static-swap.html
    - shard-dg1:          NOTRUN -> [SKIP][358] ([i915#3555] / [i915#8228])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][359] ([i915#3555] / [i915#8228])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_invalid_mode@bad-vsync-end:
    - shard-dg2:          [PASS][360] -> [SKIP][361] ([i915#16746] / [i915#3555]) +1 other test skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-3/igt@kms_invalid_mode@bad-vsync-end.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_invalid_mode@bad-vsync-end.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][362] ([i915#15460])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][363] ([i915#15459])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-10/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][364] ([i915#15459])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-rkl:          NOTRUN -> [SKIP][365] ([i915#16451])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg1:          NOTRUN -> [SKIP][366] ([i915#15815])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-tglu:         NOTRUN -> [SKIP][367] ([i915#15815])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-10/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - shard-dg2:          [PASS][368] -> [SKIP][369] ([i915#11190] / [i915#17356])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-4/igt@kms_pipe_crc_basic@hang-read-crc.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][370] ([i915#12756] / [i915#13356] / [i915#13409] / [i915#16789])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-tglu-1:       NOTRUN -> [SKIP][371] ([i915#14712])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-tglu-1:       NOTRUN -> [SKIP][372] ([i915#15709]) +2 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-dg2:          [PASS][373] -> [SKIP][374] ([i915#8825]) +3 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-8/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][375] ([i915#15709]) +1 other test skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-rkl:          NOTRUN -> [SKIP][376] ([i915#14544] / [i915#15709]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][377] ([i915#16386]) +1 other test skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][378] ([i915#15709]) +1 other test skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][379] ([i915#15709]) +4 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5:
    - shard-mtlp:         NOTRUN -> [SKIP][380] ([i915#16386]) +1 other test skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-4/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][381] ([i915#16386]) +3 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-17/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][382] ([i915#15709]) +4 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-17/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-dg1:          NOTRUN -> [SKIP][383] ([i915#16112])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-16/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][384] ([i915#13026] / [i915#13356]) +1 other test incomplete
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk2/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][385] ([i915#10647] / [i915#12169])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk3/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][386] ([i915#10647]) +1 other test fail
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk3/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk11:        NOTRUN -> [FAIL][387] ([i915#10647] / [i915#12169])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk11/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [FAIL][388] ([i915#10647]) +1 other test fail
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk11/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-hdmi-a-1.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-tglu:         NOTRUN -> [SKIP][389] ([i915#13958])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-3/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg1:          NOTRUN -> [SKIP][390] ([i915#13958]) +1 other test skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg1:          NOTRUN -> [SKIP][391] ([i915#14259])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg1:          NOTRUN -> [SKIP][392] ([i915#6953])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-mtlp:         NOTRUN -> [SKIP][393] ([i915#15329]) +9 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:
    - shard-dg2:          [PASS][394] -> [SKIP][395] ([i915#15329] / [i915#17356] / [i915#9423]) +1 other test skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-c:
    - shard-dg2:          [PASS][396] -> [SKIP][397] ([i915#15329]) +8 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-c.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-dg1:          NOTRUN -> [SKIP][398] ([i915#15329] / [i915#3555])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-17/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][399] ([i915#14544] / [i915#15329]) +3 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][400] ([i915#15329]) +4 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-10/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
    - shard-dg2:          NOTRUN -> [SKIP][401] ([i915#15329] / [i915#17356] / [i915#9423])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2:          NOTRUN -> [SKIP][402] ([i915#15329]) +2 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][403] ([i915#15329] / [i915#17356])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][404] ([i915#15329]) +4 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html
    - shard-dg1:          NOTRUN -> [SKIP][405] ([i915#15329]) +18 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-17/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
    - shard-dg2:          [PASS][406] -> [SKIP][407] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#6953] / [i915#9423])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d:
    - shard-dg2:          [PASS][408] -> [SKIP][409] ([i915#15329] / [i915#17356]) +2 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][410] ([i915#12343])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu:         NOTRUN -> [SKIP][411] ([i915#12343] / [i915#9812]) +1 other test skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-4/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][412] ([i915#12343] / [i915#5354]) +2 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][413] ([i915#12343] / [i915#5354])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-14/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][414] ([i915#13356] / [i915#16938])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk10/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-tglu-1:       NOTRUN -> [SKIP][415] ([i915#9685])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-rkl:          NOTRUN -> [FAIL][416] ([i915#16479])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-2/igt@kms_pm_dc@dc6-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][417] ([i915#3361])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-16/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg1:          NOTRUN -> [SKIP][418] ([i915#15948])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][419] ([i915#15739])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-10/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg1:          NOTRUN -> [SKIP][420] ([i915#4077]) +20 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][421] ([i915#15073]) +1 other test skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-9/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          NOTRUN -> [SKIP][422] ([i915#14544] / [i915#15073])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          NOTRUN -> [SKIP][423] ([i915#15073]) +1 other test skip
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][424] ([i915#15073])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2:          [PASS][425] -> [SKIP][426] ([i915#15073])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-rkl:          [PASS][427] -> [SKIP][428] ([i915#15073]) +1 other test skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-rkl:          [PASS][429] -> [INCOMPLETE][430] ([i915#14419])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-5/igt@kms_pm_rpm@system-suspend-idle.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_prime@d3hot:
    - shard-dg1:          NOTRUN -> [SKIP][431] ([i915#6524])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_prime@d3hot.html

  * igt@kms_properties@colorop-properties-legacy:
    - shard-dg2:          [PASS][432] -> [SKIP][433] ([i915#15347])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-8/igt@kms_properties@colorop-properties-legacy.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_properties@colorop-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-glk10:        NOTRUN -> [SKIP][434] ([i915#11520]) +2 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][435] ([i915#11520]) +1 other test skip
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][436] ([i915#9808])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][437] ([i915#12316]) +1 other test skip
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][438] ([i915#11520]) +1 other test skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-glk11:        NOTRUN -> [SKIP][439] ([i915#11520]) +3 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk11/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-snb:          NOTRUN -> [SKIP][440] ([i915#11520])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-snb5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][441] ([i915#11520]) +9 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][442] ([i915#11520] / [i915#14544]) +2 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
    - shard-tglu:         NOTRUN -> [SKIP][443] ([i915#11520]) +4 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-10/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][444] ([i915#11520]) +10 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk3/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
    - shard-rkl:          NOTRUN -> [SKIP][445] ([i915#11520]) +9 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg1:          NOTRUN -> [SKIP][446] ([i915#9683])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-14/igt@kms_psr2_su@page_flip-p010.html
    - shard-tglu:         NOTRUN -> [SKIP][447] ([i915#9683])
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-tglu-1:       NOTRUN -> [SKIP][448] ([i915#9683])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][449] ([i915#9688]) +4 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-5/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-rkl:          NOTRUN -> [SKIP][450] ([i915#1072] / [i915#9732]) +23 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-dg2:          NOTRUN -> [SKIP][451] ([i915#1072] / [i915#9732]) +4 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr@pr-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][452] ([i915#9732]) +12 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-glk:          NOTRUN -> [SKIP][453] ([i915#9732])
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk8/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][454] ([i915#1072] / [i915#14544] / [i915#9732]) +1 other test skip
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][455] ([i915#9732]) +9 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][456] ([i915#1072] / [i915#9732]) +27 other tests skip
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][457] ([i915#15949]) +1 other test skip
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-14/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-mtlp:         NOTRUN -> [SKIP][458] ([i915#12755] / [i915#15867])
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-2/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-dg2:          NOTRUN -> [SKIP][459] ([i915#12755] / [i915#15867])
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg1:          NOTRUN -> [SKIP][460] ([i915#4884])
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-17/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-glk:          NOTRUN -> [INCOMPLETE][461] ([i915#15492] / [i915#16184])
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk2/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][462] ([i915#5289])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
    - shard-tglu:         NOTRUN -> [SKIP][463] ([i915#5289])
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][464] ([i915#5289])
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][465] ([i915#17432] / [i915#5289])
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][466] ([i915#17432] / [i915#5289])
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][467] ([i915#17356] / [i915#5190]) +1 other test skip
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-tglu:         NOTRUN -> [SKIP][468] ([i915#3555])
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-3/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-dg1:          NOTRUN -> [ABORT][469] ([i915#13179]) +1 other test abort
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-17/igt@kms_selftest@drm_framebuffer.html
    - shard-glk11:        NOTRUN -> [ABORT][470] ([i915#13179]) +1 other test abort
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk11/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic:
    - shard-dg2:          [PASS][471] -> [SKIP][472] ([i915#3555])
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-6/igt@kms_setmode@basic.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-dg1:          NOTRUN -> [SKIP][473] ([i915#3555]) +8 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_setmode@basic-clone-single-crtc.html
    - shard-glk:          NOTRUN -> [SKIP][474] ([i915#17463])
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2:          NOTRUN -> [SKIP][475] ([i915#17445])
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_tv_load_detect@load-detect.html
    - shard-dg1:          NOTRUN -> [SKIP][476] ([i915#17445])
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-14/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][477] ([i915#12276] / [i915#13356]) +1 other test incomplete
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk5/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][478] ([i915#11920])
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_vrr@lobf.html
    - shard-dg1:          NOTRUN -> [SKIP][479] ([i915#11920])
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-rkl:          NOTRUN -> [SKIP][480] ([i915#9906]) +1 other test skip
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg1:          NOTRUN -> [SKIP][481] ([i915#9906])
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg2:          NOTRUN -> [SKIP][482] ([i915#9906])
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-tglu:         NOTRUN -> [SKIP][483] ([i915#9906])
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-9/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-mtlp:         NOTRUN -> [SKIP][484] ([i915#8808] / [i915#9906])
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-4/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@perf@global-sseu-config:
    - shard-mtlp:         NOTRUN -> [SKIP][485] ([i915#7387])
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-5/igt@perf@global-sseu-config.html

  * igt@perf@mi-rpc:
    - shard-dg1:          NOTRUN -> [SKIP][486] ([i915#2434])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@perf@mi-rpc.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][487] ([i915#2435])
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][488] ([i915#2433])
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@perf@unprivileged-single-ctx-counters.html
    - shard-tglu:         NOTRUN -> [SKIP][489] ([i915#17455]) +2 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start:
    - shard-mtlp:         NOTRUN -> [FAIL][490] ([i915#4349]) +2 other tests fail
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-7/igt@perf_pmu@busy-double-start.html

  * igt@perf_pmu@rc6-suspend:
    - shard-mtlp:         [PASS][491] -> [FAIL][492] ([i915#17245])
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-mtlp-2/igt@perf_pmu@rc6-suspend.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-6/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-tglu:         NOTRUN -> [SKIP][493] ([i915#8516])
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@perf_pmu@semaphore-busy@vcs1:
    - shard-mtlp:         [PASS][494] -> [FAIL][495] ([i915#4349]) +4 other tests fail
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-mtlp-7/igt@perf_pmu@semaphore-busy@vcs1.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-5/igt@perf_pmu@semaphore-busy@vcs1.html

  * igt@prime_vgem@basic-fence-read:
    - shard-rkl:          NOTRUN -> [SKIP][496] ([i915#17448] / [i915#3291] / [i915#3708])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][497] ([i915#3708] / [i915#4077])
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-16/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg1:          NOTRUN -> [SKIP][498] ([i915#3708])
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@prime_vgem@fence-read-hang.html
    - shard-tglu:         NOTRUN -> [SKIP][499] ([i915#17448]) +1 other test skip
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-4/igt@prime_vgem@fence-read-hang.html

  
#### Possible fixes ####

  * igt@drm_read@short-buffer-block:
    - shard-dg2:          [SKIP][500] ([i915#17359]) -> [PASS][501] +1 other test pass
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@drm_read@short-buffer-block.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@drm_read@short-buffer-block.html

  * igt@fbdev@pan:
    - shard-dg2:          [SKIP][502] ([i915#2582]) -> [PASS][503]
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@fbdev@pan.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@fbdev@pan.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [INCOMPLETE][504] ([i915#13356] / [i915#16348]) -> [PASS][505] +1 other test pass
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@gem_ccs@suspend-resume.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-8/igt@gem_ccs@suspend-resume.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          [INCOMPLETE][506] ([i915#13356] / [i915#16466]) -> [PASS][507]
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-glk6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk3/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_eio@in-flight-suspend:
    - shard-mtlp:         [FAIL][508] ([i915#17268]) -> [PASS][509]
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-mtlp-6/igt@gem_eio@in-flight-suspend.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-7/igt@gem_eio@in-flight-suspend.html

  * igt@gem_workarounds@suspend-resume:
    - shard-mtlp:         [INCOMPLETE][510] ([i915#17246]) -> [PASS][511]
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-mtlp-8/igt@gem_workarounds@suspend-resume.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-4/igt@gem_workarounds@suspend-resume.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-rkl:          [ABORT][512] ([i915#15131]) -> [PASS][513]
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-1/igt@gem_workarounds@suspend-resume-context.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-dg2:          [FAIL][514] ([i915#12964]) -> [PASS][515] +1 other test pass
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-6/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk:          [INCOMPLETE][516] ([i915#13356]) -> [PASS][517]
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-glk1/igt@i915_pm_rpm@system-suspend.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk3/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_selftest@live:
    - shard-dg2:          [DMESG-FAIL][518] -> [PASS][519]
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-8/igt@i915_selftest@live.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gem_contexts:
    - shard-dg2:          [DMESG-FAIL][520] ([i915#16880]) -> [PASS][521]
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-8/igt@i915_selftest@live@gem_contexts.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-8/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-rkl:          [INCOMPLETE][522] ([i915#4817]) -> [PASS][523]
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@i915_suspend@fence-restore-tiled2untiled.html
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:
    - shard-mtlp:         [FAIL][524] ([i915#17150]) -> [PASS][525] +1 other test pass
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-mtlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html

  * igt@kms_busy@basic:
    - shard-dg2:          [SKIP][526] ([i915#11190] / [i915#17356]) -> [PASS][527]
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_busy@basic.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_busy@basic.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1:
    - shard-mtlp:         [FAIL][528] ([i915#17158]) -> [PASS][529]
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1.html
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1:
    - shard-mtlp:         [INCOMPLETE][530] ([i915#15582]) -> [PASS][531] +1 other test pass
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1.html

  * igt@kms_color@background-color:
    - shard-dg2:          [SKIP][532] ([i915#17373]) -> [PASS][533]
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_color@background-color.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-5/igt@kms_color@background-color.html

  * igt@kms_color@ctm-blue-to-red:
    - shard-dg2:          [SKIP][534] ([i915#12655] / [i915#17373]) -> [PASS][535]
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_color@ctm-blue-to-red.html
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-8/igt@kms_color@ctm-blue-to-red.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d:
    - shard-dg2:          [SKIP][536] ([i915#15529]) -> [PASS][537] +1 other test pass
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          [FAIL][538] ([i915#13566]) -> [PASS][539] +6 other tests pass
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html
    - shard-tglu:         [FAIL][540] ([i915#13566]) -> [PASS][541] +5 other tests pass
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][542] ([i915#15804]) -> [PASS][543]
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_feature_discovery@hdr:
    - shard-rkl:          [SKIP][544] ([i915#16600]) -> [PASS][545]
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-4/igt@kms_feature_discovery@hdr.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_feature_discovery@hdr.html

  * igt@kms_flip@dpms-off-confusion-interruptible:
    - shard-dg2:          [SKIP][546] ([i915#5354]) -> [PASS][547] +6 other tests pass
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_flip@dpms-off-confusion-interruptible.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-8/igt@kms_flip@dpms-off-confusion-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-dg2:          [SKIP][548] ([i915#3555] / [i915#8813]) -> [PASS][549] +3 other tests pass
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][550] ([i915#16708] / [i915#5354]) -> [PASS][551] +7 other tests pass
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:
    - shard-rkl:          [SKIP][552] ([i915#15989]) -> [PASS][553] +10 other tests pass
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-blt:
    - shard-glk:          [SKIP][554] -> [PASS][555] +5 other tests pass
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-glk9/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-blt.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk8/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-blt.html

  * igt@kms_getfb@getfb2-handle-not-fb:
    - shard-dg1:          [DMESG-WARN][556] ([i915#4423]) -> [PASS][557]
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg1-17/igt@kms_getfb@getfb2-handle-not-fb.html
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-14/igt@kms_getfb@getfb2-handle-not-fb.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          [SKIP][558] ([i915#16644] / [i915#3555] / [i915#8228]) -> [PASS][559] +1 other test pass
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-3/igt@kms_hdr@static-toggle.html
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-1/igt@kms_hdr@static-toggle.html

  * igt@kms_invalid_mode@bad-hsync-end:
    - shard-dg2:          [SKIP][560] ([i915#16746] / [i915#3555]) -> [PASS][561] +1 other test pass
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_invalid_mode@bad-hsync-end.html
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_invalid_mode@bad-hsync-end.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][562] ([i915#12756] / [i915#13356] / [i915#13409] / [i915#13476] / [i915#16789]) -> [PASS][563]
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-glk6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-dg2:          [SKIP][564] ([i915#8825]) -> [PASS][565]
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-rkl:          [INCOMPLETE][566] ([i915#14412]) -> [PASS][567] +1 other test pass
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-dg2:          [SKIP][568] ([i915#15329] / [i915#17356] / [i915#9423]) -> [PASS][569] +1 other test pass
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d:
    - shard-dg2:          [SKIP][570] ([i915#15329] / [i915#17356]) -> [PASS][571] +4 other tests pass
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d.html
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:
    - shard-dg2:          [SKIP][572] ([i915#15329]) -> [PASS][573] +14 other tests pass
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-dg2:          [SKIP][574] ([i915#15329] / [i915#17356] / [i915#6953] / [i915#9423]) -> [PASS][575] +2 other tests pass
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [SKIP][576] ([i915#15073]) -> [PASS][577] +3 other tests pass
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-rkl:          [SKIP][578] ([i915#15073]) -> [PASS][579]
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg1:          [SKIP][580] ([i915#15073]) -> [PASS][581]
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2:          [SKIP][582] ([i915#17356]) -> [PASS][583] +36 other tests pass
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1:
    - shard-mtlp:         [FAIL][584] ([i915#17209]) -> [PASS][585]
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-mtlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1.html
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-7/igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1.html

  * igt@prime_mmap_kms@buffer-sharing:
    - shard-dg2:          [SKIP][586] ([i915#17454]) -> [PASS][587]
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@prime_mmap_kms@buffer-sharing.html
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@prime_mmap_kms@buffer-sharing.html

  
#### Warnings ####

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          [SKIP][588] ([i915#14544] / [i915#280]) -> [SKIP][589] ([i915#280])
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@gem_ctx_sseu@engines.html
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [FAIL][590] ([i915#15944]) -> [FAIL][591] ([i915#15816])
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-tglu-7/igt@gem_exec_big@single.html
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@gem_exec_big@single.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-rkl:          [SKIP][592] ([i915#3711]) -> [SKIP][593] ([i915#14544] / [i915#3711])
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-8/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-rkl:          [SKIP][594] ([i915#17453]) -> [SKIP][595] ([i915#14544] / [i915#17453])
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-4/igt@gem_exec_params@rsvd2-dirt.html
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-rkl:          [SKIP][596] ([i915#14544] / [i915#3281]) -> [SKIP][597] ([i915#3281]) +2 other tests skip
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@gem_exec_reloc@basic-softpin.html
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          [SKIP][598] ([i915#3281]) -> [SKIP][599] ([i915#14544] / [i915#3281]) +3 other tests skip
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-4/igt@gem_exec_reloc@basic-write-read-noreloc.html
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          [SKIP][600] ([i915#4613] / [i915#7582]) -> [SKIP][601] ([i915#14544] / [i915#4613] / [i915#7582])
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-8/igt@gem_lmem_evict@dontneed-evict-race.html
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-rkl:          [SKIP][602] ([i915#14544] / [i915#4613]) -> [SKIP][603] ([i915#4613])
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@gem_lmem_swapping@massive-random.html
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@verify:
    - shard-rkl:          [SKIP][604] ([i915#4613]) -> [SKIP][605] ([i915#14544] / [i915#4613])
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-5/igt@gem_lmem_swapping@verify.html
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@gem_lmem_swapping@verify.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-rkl:          [SKIP][606] ([i915#3282]) -> [SKIP][607] ([i915#14544] / [i915#3282]) +3 other tests skip
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_pread@self:
    - shard-rkl:          [SKIP][608] ([i915#14544] / [i915#3282]) -> [SKIP][609] ([i915#3282])
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@gem_pread@self.html
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@gem_pread@self.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-rkl:          [SKIP][610] ([i915#8411]) -> [SKIP][611] ([i915#14544] / [i915#8411])
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_userptr_blits@access-control:
    - shard-rkl:          [SKIP][612] ([i915#3297]) -> [SKIP][613] ([i915#14544] / [i915#3297])
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-4/igt@gem_userptr_blits@access-control.html
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-rkl:          [SKIP][614] ([i915#14544] / [i915#3297]) -> [SKIP][615] ([i915#3297]) +2 other tests skip
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@gem_userptr_blits@dmabuf-unsync.html
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-2/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gen3_render_tiledx_blits:
    - shard-rkl:          [SKIP][616] ([i915#17455]) -> [SKIP][617] ([i915#14544] / [i915#17455]) +1 other test skip
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-3/igt@gen3_render_tiledx_blits.html
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@gen3_render_tiledx_blits.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          [SKIP][618] ([i915#14544] / [i915#2527]) -> [SKIP][619] ([i915#2527])
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          [SKIP][620] ([i915#14544] / [i915#8399]) -> [SKIP][621] ([i915#8399])
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@i915_pm_freq_api@freq-suspend.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          [SKIP][622] ([i915#14544] / [i915#7707]) -> [SKIP][623] ([i915#7707])
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@intel_hwmon@hwmon-write.html
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@intel_hwmon@hwmon-write.html

  * igt@kms_atomic@atomic-invalid-params:
    - shard-dg2:          [SKIP][624] ([i915#17356]) -> [ABORT][625] ([i915#13562])
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_atomic@atomic-invalid-params.html
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_atomic@atomic-invalid-params.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          [SKIP][626] ([i915#1769] / [i915#3555]) -> [SKIP][627] ([i915#17356])
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-rkl:          [SKIP][628] ([i915#14544] / [i915#4538] / [i915#5286]) -> [SKIP][629] ([i915#4538] / [i915#5286])
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2:          [SKIP][630] ([i915#17431]) -> [SKIP][631] ([i915#17356]) +3 other tests skip
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-rkl:          [SKIP][632] ([i915#5286]) -> [SKIP][633] ([i915#14544] / [i915#5286])
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-rkl:          [SKIP][634] ([i915#4538] / [i915#5286]) -> [SKIP][635] ([i915#14544] / [i915#4538] / [i915#5286]) +1 other test skip
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-rkl:          [SKIP][636] ([i915#17431] / [i915#3638]) -> [SKIP][637] ([i915#14544] / [i915#17431] / [i915#3638]) +1 other test skip
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg1:          [ABORT][638] ([i915#13562]) -> [SKIP][639] ([i915#3638])
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg1-12/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][640] ([i915#3828]) -> [SKIP][641] ([i915#14544] / [i915#3828])
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2:          [SKIP][642] ([i915#3828]) -> [SKIP][643] ([i915#17356]) +1 other test skip
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          [SKIP][644] ([i915#17356]) -> [SKIP][645] ([i915#17431]) +2 other tests skip
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-8/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          [SKIP][646] ([i915#17356] / [i915#5190]) -> [SKIP][647] ([i915#4538] / [i915#5190]) +10 other tests skip
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          [SKIP][648] ([i915#5190]) -> [SKIP][649] ([i915#17356] / [i915#5190]) +2 other tests skip
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2:          [SKIP][650] ([i915#4538] / [i915#5190]) -> [SKIP][651] ([i915#17356] / [i915#5190]) +7 other tests skip
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-rkl:          [SKIP][652] ([i915#4538]) -> [SKIP][653] ([i915#14544] / [i915#4538]) +3 other tests skip
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-rkl:          [SKIP][654] ([i915#14544] / [i915#4538]) -> [SKIP][655] ([i915#4538]) +1 other test skip
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-rkl:          [SKIP][656] ([i915#17432]) -> [SKIP][657] ([i915#14544] / [i915#17432])
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-8/igt@kms_big_fb@yf-tiled-addfb.html
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-rkl:          [SKIP][658] ([i915#14544] / [i915#17432]) -> [SKIP][659] ([i915#17432])
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2:          [SKIP][660] ([i915#10307] / [i915#6095]) -> [SKIP][661] ([i915#17356]) +8 other tests skip
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-dg2:          [SKIP][662] ([i915#17356]) -> [SKIP][663] ([i915#10307] / [i915#6095]) +6 other tests skip
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][664] ([i915#14544] / [i915#6095]) -> [SKIP][665] ([i915#6095]) +1 other test skip
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][666] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][667] ([i915#14098] / [i915#6095]) +1 other test skip
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.html
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2:          [SKIP][668] ([i915#17356]) -> [SKIP][669] ([i915#12313])
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2:          [SKIP][670] ([i915#12805]) -> [SKIP][671] ([i915#17356])
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-dg2:          [SKIP][672] ([i915#6095]) -> [SKIP][673] ([i915#17356])
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-dg2:          [SKIP][674] ([i915#17356]) -> [SKIP][675] ([i915#6095]) +3 other tests skip
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          [SKIP][676] ([i915#14098] / [i915#6095]) -> [SKIP][677] ([i915#14098] / [i915#14544] / [i915#6095]) +2 other tests skip
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2:          [SKIP][678] ([i915#12313]) -> [SKIP][679] ([i915#17356]) +1 other test skip
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:
    - shard-rkl:          [SKIP][680] ([i915#14544] / [i915#17427]) -> [SKIP][681] ([i915#17427]) +2 other tests skip
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-rkl:          [SKIP][682] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][683] ([i915#11151] / [i915#7828])
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@kms_chamelium_frames@dp-frame-dump.html
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-1/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-rkl:          [SKIP][684] ([i915#11151] / [i915#7828]) -> [SKIP][685] ([i915#11151] / [i915#14544] / [i915#7828]) +2 other tests skip
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2:          [SKIP][686] ([i915#17356]) -> [SKIP][687] ([i915#15865])
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_content_protection@content-type-change.html
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          [SKIP][688] ([i915#17356]) -> [SKIP][689] ([i915#15330] / [i915#3299]) +1 other test skip
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-1.html
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-dg2:          [SKIP][690] ([i915#17356]) -> [SKIP][691] ([i915#15330])
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@lic-type-1:
    - shard-rkl:          [SKIP][692] ([i915#14544] / [i915#15865]) -> [SKIP][693] ([i915#15865])
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@kms_content_protection@lic-type-1.html
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          [SKIP][694] ([i915#15865]) -> [SKIP][695] ([i915#17356]) +2 other tests skip
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-1/igt@kms_content_protection@mei-interface.html
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-rkl:          [SKIP][696] ([i915#15865]) -> [SKIP][697] ([i915#14544] / [i915#15865]) +1 other test skip
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-7/igt@kms_content_protection@type1.html
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-dg2:          [SKIP][698] ([i915#3555]) -> [SKIP][699] ([i915#17356])
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          [SKIP][700] ([i915#13049]) -> [SKIP][701] ([i915#17356]) +1 other test skip
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-rkl:          [SKIP][702] ([i915#13049]) -> [SKIP][703] ([i915#13049] / [i915#14544])
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          [SKIP][704] ([i915#17356]) -> [SKIP][705] ([i915#3555]) +3 other tests skip
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-1/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          [SKIP][706] ([i915#4103]) -> [SKIP][707] ([i915#11190] / [i915#17356])
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          [SKIP][708] ([i915#4103]) -> [SKIP][709] ([i915#14544] / [i915#4103])
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - shard-dg2:          [SKIP][710] ([i915#11190] / [i915#17356]) -> [SKIP][711] ([i915#4103])
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2:          [SKIP][712] ([i915#17356]) -> [SKIP][713] ([i915#13046] / [i915#17454] / [i915#5354]) +2 other tests skip
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2:          [SKIP][714] ([i915#13046] / [i915#17454] / [i915#5354]) -> [SKIP][715] ([i915#17356]) +2 other tests skip
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2:          [SKIP][716] ([i915#9833]) -> [SKIP][717] ([i915#17356])
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          [SKIP][718] ([i915#14544] / [i915#3555] / [i915#3804]) -> [SKIP][719] ([i915#3555] / [i915#3804])
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][720] ([i915#14544] / [i915#3804]) -> [SKIP][721] ([i915#3804])
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-dg2:          [SKIP][722] ([i915#17356]) -> [SKIP][723] ([i915#17291])
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
    - shard-rkl:          [SKIP][724] ([i915#14544] / [i915#17286]) -> [SKIP][725] ([i915#17286])
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - shard-dg2:          [SKIP][726] ([i915#17356]) -> [SKIP][727] ([i915#17290])
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-8/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg2:          [SKIP][728] ([i915#13748]) -> [SKIP][729] ([i915#17356])
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-8/igt@kms_dp_link_training@uhbr-mst.html
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-dg2:          [SKIP][730] ([i915#17285]) -> [SKIP][731] ([i915#17356])
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-4/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
    - shard-dg2:          [SKIP][732] ([i915#17356]) -> [SKIP][733] ([i915#17285]) +1 other test skip
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          [SKIP][734] ([i915#16361]) -> [SKIP][735] ([i915#11190] / [i915#17356])
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-4/igt@kms_dsc@dsc-basic.html
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          [SKIP][736] ([i915#16361]) -> [SKIP][737] ([i915#14544] / [i915#16361]) +1 other test skip
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-3/igt@kms_dsc@dsc-fractional-bpp.html
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg2:          [SKIP][738] ([i915#17356]) -> [SKIP][739] ([i915#16361]) +3 other tests skip
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats.html
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_dsc@dsc-with-output-formats.html
    - shard-rkl:          [SKIP][740] ([i915#14544] / [i915#16361]) -> [SKIP][741] ([i915#16361])
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats.html
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2:          [SKIP][742] ([i915#16361]) -> [SKIP][743] ([i915#17356]) +3 other tests skip
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          [SKIP][744] ([i915#16599]) -> [SKIP][745] ([i915#14544] / [i915#16599])
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-8/igt@kms_feature_discovery@dp-mst.html
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-rkl:          [SKIP][746] ([i915#9934]) -> [SKIP][747] ([i915#14544] / [i915#9934])
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-rkl:          [SKIP][748] ([i915#14544] / [i915#9934]) -> [SKIP][749] ([i915#9934]) +1 other test skip
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@kms_flip@2x-flip-vs-fences-interruptible.html
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-2/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][750] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839]) -> [INCOMPLETE][751] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [INCOMPLETE][752] ([i915#12745] / [i915#13356] / [i915#17183]) -> [INCOMPLETE][753] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183])
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][754] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183] / [i915#4839] / [i915#6113]) -> [INCOMPLETE][755] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839] / [i915#6113])
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible.html
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          [INCOMPLETE][756] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183]) -> [INCOMPLETE][757] ([i915#12745] / [i915#13356] / [i915#17183])
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-rkl:          [SKIP][758] ([i915#14544] / [i915#15643]) -> [SKIP][759] ([i915#15643])
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-rkl:          [SKIP][760] ([i915#15643]) -> [SKIP][761] ([i915#14544] / [i915#15643])
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][762] ([i915#16708]) -> [SKIP][763] ([i915#15104] / [i915#15990])
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg1:          [SKIP][764] ([i915#15990] / [i915#4423] / [i915#8708]) -> [SKIP][765] ([i915#15990] / [i915#8708])
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][766] ([i915#16708] / [i915#5354]) -> [SKIP][767] ([i915#15990] / [i915#8708]) +13 other tests skip
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
    - shard-dg2:          [SKIP][768] ([i915#15990] / [i915#8708]) -> [SKIP][769] ([i915#16708] / [i915#5354]) +18 other tests skip
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          [SKIP][770] ([i915#5439]) -> [SKIP][771] ([i915#14544] / [i915#5439])
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          [SKIP][772] ([i915#15991] / [i915#5354]) -> [SKIP][773] ([i915#16708] / [i915#5354]) +21 other tests skip
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][774] ([i915#17428] / [i915#1825]) -> [SKIP][775] ([i915#14544] / [i915#17428] / [i915#1825])
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          [SKIP][776] ([i915#14544] / [i915#17428]) -> [SKIP][777] ([i915#17428]) +17 other tests skip
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-pri-indfb-multidraw:
    - shard-dg2:          [SKIP][778] ([i915#15102]) -> [SKIP][779] ([i915#16708]) +13 other tests skip
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-pri-indfb-multidraw.html
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-pri-indfb-multidraw.html
    - shard-rkl:          [SKIP][780] ([i915#14544] / [i915#15102]) -> [SKIP][781] ([i915#15102]) +7 other tests skip
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-pri-indfb-multidraw.html
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-plflip-blt:
    - shard-dg2:          [SKIP][782] ([i915#16708]) -> [SKIP][783] ([i915#15102]) +17 other tests skip
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-plflip-blt.html
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          [SKIP][784] ([i915#16708]) -> [SKIP][785] ([i915#15990]) +16 other tests skip
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][786] ([i915#15989]) -> [SKIP][787] ([i915#16708]) +17 other tests skip
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc:
    - shard-dg2:          [SKIP][788] ([i915#15990]) -> [SKIP][789] ([i915#16708]) +15 other tests skip
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc.html
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-suspend:
    - shard-dg2:          [SKIP][790] ([i915#16708]) -> [SKIP][791] ([i915#15989]) +11 other tests skip
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-suspend.html
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-suspend.html
    - shard-rkl:          [SKIP][792] ([i915#15989]) -> [ABORT][793] ([i915#15132])
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-suspend.html
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-1/igt@kms_frontbuffer_tracking@hdr-suspend.html
    - shard-glk:          [SKIP][794] -> [INCOMPLETE][795] ([i915#13356] / [i915#16056] / [i915#16593])
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-glk3/igt@kms_frontbuffer_tracking@hdr-suspend.html
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk8/igt@kms_frontbuffer_tracking@hdr-suspend.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg2:          [SKIP][796] ([i915#16708] / [i915#4342] / [i915#5354]) -> [SKIP][797] ([i915#9766])
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-rkl:          [SKIP][798] ([i915#15102]) -> [SKIP][799] ([i915#14544] / [i915#15102]) +13 other tests skip
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [799]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][800] ([i915#14544] / [i915#17428] / [i915#1825]) -> [SKIP][801] ([i915#17428] / [i915#1825])
   [800]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [801]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][802] ([i915#16708] / [i915#5354]) -> [SKIP][803] ([i915#15991] / [i915#5354]) +22 other tests skip
   [802]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html
   [803]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          [SKIP][804] ([i915#15102]) -> [SKIP][805] ([i915#16708] / [i915#5354]) +13 other tests skip
   [804]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [805]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-dg2:          [SKIP][806] ([i915#16708] / [i915#5354]) -> [SKIP][807] ([i915#15102]) +10 other tests skip
   [806]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html
   [807]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:
    - shard-dg2:          [SKIP][808] ([i915#15991]) -> [SKIP][809] ([i915#16708]) +43 other tests skip
   [808]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-1/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html
   [809]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:
    - shard-rkl:          [SKIP][810] ([i915#17428]) -> [SKIP][811] ([i915#14544] / [i915#17428]) +28 other tests skip
   [810]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html
   [811]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2:          [SKIP][812] ([i915#16708]) -> [SKIP][813] ([i915#15991]) +30 other tests skip
   [812]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html
   [813]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-dg2:          [SKIP][814] ([i915#17357]) -> [ABORT][815] ([i915#15132])
   [814]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
   [815]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-5/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-rkl:          [INCOMPLETE][816] ([i915#15436]) -> [SKIP][817] ([i915#16644] / [i915#3555] / [i915#8228])
   [816]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend.html
   [817]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2:          [SKIP][818] ([i915#16518] / [i915#3555] / [i915#8228]) -> [SKIP][819] ([i915#17356])
   [818]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-5/igt@kms_hdr@invalid-hdr.html
   [819]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-rkl:          [SKIP][820] ([i915#15458]) -> [SKIP][821] ([i915#14544] / [i915#15458]) +1 other test skip
   [820]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [821]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-dg2:          [SKIP][822] ([i915#16451]) -> [SKIP][823] ([i915#17356])
   [822]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-3/igt@kms_mst@mst-suspend-read-crc.html
   [823]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          [SKIP][824] ([i915#6301]) -> [SKIP][825] ([i915#14544] / [i915#6301])
   [824]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-1/igt@kms_panel_fitting@legacy.html
   [825]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-glk:          [DMESG-WARN][826] ([i915#118]) -> [DMESG-FAIL][827] ([i915#118])
   [826]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-glk8/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
   [827]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk2/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-dg2:          [SKIP][828] ([i915#14712]) -> [SKIP][829] ([i915#17356])
   [828]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [829]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:
    - shard-rkl:          [SKIP][830] ([i915#15709]) -> [SKIP][831] ([i915#14544] / [i915#15709])
   [830]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html
   [831]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
    - shard-rkl:          [SKIP][832] ([i915#14544] / [i915#15709]) -> [SKIP][833] ([i915#15709])
   [832]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html
   [833]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2:          [SKIP][834] ([i915#13958]) -> [SKIP][835] ([i915#17356]) +1 other test skip
   [834]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-4.html
   [835]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-dg2:          [SKIP][836] ([i915#17356]) -> [SKIP][837] ([i915#13958])
   [836]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-x.html
   [837]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          [SKIP][838] ([i915#17356]) -> [SKIP][839] ([i915#14259])
   [838]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_plane_multiple@tiling-y.html
   [839]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          [SKIP][840] ([i915#6953] / [i915#9423]) -> [SKIP][841] ([i915#17356] / [i915#6953] / [i915#9423])
   [840]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-5/igt@kms_plane_scaling@intel-max-src-size.html
   [841]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-rkl:          [SKIP][842] ([i915#12343] / [i915#5354]) -> [SKIP][843] ([i915#12343] / [i915#14544] / [i915#5354])
   [842]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-4/igt@kms_pm_backlight@fade-with-suspend.html
   [843]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-rkl:          [SKIP][844] ([i915#14544] / [i915#16914]) -> [SKIP][845] ([i915#16914])
   [844]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@kms_pm_dc@dc5-psr-suspend-resume.html
   [845]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][846] ([i915#3828]) -> [SKIP][847] ([i915#9340])
   [846]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html
   [847]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-dg1:          [SKIP][848] ([i915#3828]) -> [SKIP][849] ([i915#9340])
   [848]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg1-14/igt@kms_pm_lpsp@kms-lpsp.html
   [849]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          [SKIP][850] ([i915#11520]) -> [SKIP][851] ([i915#11520] / [i915#14544]) +4 other tests skip
   [850]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
   [851]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          [SKIP][852] ([i915#11520] / [i915#14544]) -> [SKIP][853] ([i915#11520])
   [852]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [853]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-rkl:          [SKIP][854] ([i915#9683]) -> [SKIP][855] ([i915#14544] / [i915#9683])
   [854]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-4/igt@kms_psr2_su@page_flip-p010.html
   [855]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          [SKIP][856] ([i915#1072] / [i915#9732]) -> [SKIP][857] ([i915#1072] / [i915#14544] / [i915#9732]) +6 other tests skip
   [856]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-3/igt@kms_psr@fbc-psr2-sprite-render.html
   [857]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-rkl:          [SKIP][858] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][859] ([i915#1072] / [i915#9732]) +4 other tests skip
   [858]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@kms_psr@psr-sprite-plane-onoff.html
   [859]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          [SKIP][860] ([i915#15949]) -> [SKIP][861] ([i915#14544] / [i915#15949])
   [860]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [861]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2:          [SKIP][862] ([i915#17356]) -> [SKIP][863] ([i915#12755] / [i915#15867])
   [862]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_rotation_crc@bad-tiling.html
   [863]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-5/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2:          [SKIP][864] ([i915#17356] / [i915#5190]) -> [SKIP][865] ([i915#5190]) +2 other tests skip
   [864]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [865]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          [SKIP][866] ([i915#14544] / [i915#17432] / [i915#5289]) -> [SKIP][867] ([i915#17432] / [i915#5289])
   [866]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [867]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-rkl:          [SKIP][868] ([i915#3555]) -> [SKIP][869] ([i915#14544] / [i915#3555])
   [868]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [869]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-mtlp:         [INCOMPLETE][870] ([i915#12276]) -> [FAIL][871] ([i915#17209]) +1 other test fail
   [870]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-mtlp-2/igt@kms_vblank@ts-continuation-suspend.html
   [871]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-7/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flipline:
    - shard-dg2:          [SKIP][872] ([i915#15243] / [i915#3555]) -> [SKIP][873] ([i915#17356])
   [872]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-6/igt@kms_vrr@flipline.html
   [873]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_vrr@flipline.html

  * igt@kms_vrr@max-min:
    - shard-dg2:          [SKIP][874] ([i915#9906]) -> [SKIP][875] ([i915#17356]) +1 other test skip
   [874]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-3/igt@kms_vrr@max-min.html
   [875]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          [SKIP][876] ([i915#3555] / [i915#9906]) -> [SKIP][877] ([i915#17356])
   [876]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-dg2-4/igt@kms_vrr@negative-basic.html
   [877]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_vrr@negative-basic.html

  * igt@perf@mi-rpc:
    - shard-rkl:          [SKIP][878] ([i915#2434]) -> [SKIP][879] ([i915#14544] / [i915#2434])
   [878]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-5/igt@perf@mi-rpc.html
   [879]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@perf@mi-rpc.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          [SKIP][880] ([i915#17448] / [i915#3291] / [i915#3708]) -> [SKIP][881] ([i915#14544] / [i915#17448] / [i915#3291] / [i915#3708])
   [880]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/shard-rkl-4/igt@prime_vgem@basic-read.html
   [881]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@prime_vgem@basic-read.html

  
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#11814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11814
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
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
  [i915#13562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786
  [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15347]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15347
  [i915#15436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15481]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481
  [i915#15492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492
  [i915#15529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
  [i915#15804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15804
  [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
  [i915#15816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15944
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16119]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16119
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16451]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451
  [i915#16466]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
  [i915#16599]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708
  [i915#16746]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746
  [i915#16789]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16789
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16870]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16870
  [i915#16880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16880
  [i915#16914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914
  [i915#16938]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16938
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#17099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17099
  [i915#17103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17103
  [i915#17104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17104
  [i915#17133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17133
  [i915#17150]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17150
  [i915#17158]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158
  [i915#17174]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17174
  [i915#17176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176
  [i915#17183]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
  [i915#17209]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17209
  [i915#17245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17245
  [i915#17246]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17246
  [i915#17268]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17268
  [i915#17285]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285
  [i915#17286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17286
  [i915#17288]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17288
  [i915#17290]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17290
  [i915#17291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17291
  [i915#17356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356
  [i915#17357]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17357
  [i915#17358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17358
  [i915#17359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17359
  [i915#17373]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373
  [i915#17427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427
  [i915#17428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428
  [i915#17431]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431
  [i915#17432]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432
  [i915#17433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17433
  [i915#17434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434
  [i915#17445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17445
  [i915#17448]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448
  [i915#17450]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450
  [i915#17452]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17452
  [i915#17453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17453
  [i915#17454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454
  [i915#17455]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455
  [i915#17463]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17463
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3711]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3711
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
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
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
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
  * IGT: IGT_9164 -> IGTPW_16045

  CI-20190529: 20190529
  CI_DRM_19394: d56ff005f0d16ec136ee31fe3238eb447fefdc1a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16045: 16045
  IGT_9164: 9164

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/index.html

--===============1523931175290452007==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_system_allocator: Skip u=
nsupported PAT madvise indices</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/176802/">https://patchwork.freedesktop.org/series/176802/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16045/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16045/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9164_full -&gt; IGTPW_16045_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_16045_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_16045_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/index=
.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1604=
5_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk10/igt@kms_chamelium_audio@hdmi-audio.ht=
ml">SKIP</a> +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk11/igt@kms_dp_linktrain_fallback@uhbr-to=
-hbr-fallback.html">SKIP</a> +159 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-glk8/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-wc.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16045/shard-glk4/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-wc.ht=
ml">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk8/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.h=
tml">SKIP</a> +405 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-snb5/igt@kms_rotation_crc@bad-pixel-format.=
html">SKIP</a> +34 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_9164_full and IGTPW_16045_ful=
l:</p>
<h3>New IGT tests (45)</h3>
<ul>
<li>
<p>igt@kms_atomic@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@basic-uaf:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@dpms-audio-recovery:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@drm_format_helper:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@fbc-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@hdr-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@hdr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@invalid:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@linear-64bpp-rotate-0:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@load:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@pixel-format-y-tiled-gen12-rc-ccs-modifier:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@system-suspend-idle:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x64@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-linear-to-y-rc-cc=
s:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-linear-to-y-rc-cc=
s-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-x-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-x-to-y-rc-ccs-cc:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-rc-ccs-cc-to-li=
near:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-rc-ccs-cc-to-x:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-rc-ccs-cc-to-y:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-rc-ccs-cc-to-y-=
rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-rc-ccs-cc-to-y-=
rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-rc-ccs-to-linea=
r:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-rc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-rc-ccs-to-y-rc-=
ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-rc-ccs-to-y-rc-=
ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-to-y-rc-ccs-cc:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16045_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@api_intel_bb@object-reloc-purge-=
cache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@device_reset@cold-reset-bound.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@device_reset@unbind-cold-reset-re=
bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11078">i915#11078</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@drm_read@empty-nonblock:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-4/igt@drm_read@empty-nonblock.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt=
@drm_read@empty-nonblock.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17359">i915#17359</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@gem_basic@multigpu-create-close.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/7697">i915#7697</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-2/igt@gem_basic@multigpu-create-close.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/7697">i915#7697</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@gem_ccs@block-copy-compressed.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@gem_ccs@block-multicopy-compress=
ed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@gem_ccs@suspend-resume.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk3/igt@gem_ctx_isolation@preservation-s3@=
bcs0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16466">i915#16466</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@ccs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-4/igt@gem_ctx_isolation@preservation-s=
3@ccs0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17176">i915#17176</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-4/igt@gem_ctx_isolation@preservation-s=
3@vcs1.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17174">i915#17174</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@gem_ctx_sseu@invalid-sseu.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@gem_ctx_sseu@invalid-sseu.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@gem_ctx_sseu@mmap-args.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk3/igt@gem_eio@in-flight-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13390">i915#13390</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@gem_eio@kms.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363">=
i915#13363</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-5/igt@gem_exec_balancer@bonded-dual.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4771">i915#4771</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@gem_exec_balancer@bonded-dual.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@gem_exec_balancer@noheartbeat.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@gem_exec_balancer@parallel.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@gem_exec_balancer@parallel-balanc=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4525">i915#4525</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-3/igt@gem_exec_balancer@parallel-balan=
cer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@gem_exec_capture@capture-invisib=
le@lmem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6334">i915#6334</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk5/igt@gem_exec_capture@capture-invisible=
@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@gem_exec_capture@capture-invisibl=
e@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@gem_exec_fence@submit67.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@gem_exec_flush@basic-batch-kerne=
l-default-wb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-14/igt@gem_exec_flush@basic-uc-set-defa=
ult.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-1/igt@gem_exec_flush@basic-wb-pro-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@gem_exec_reloc@basic-cpu-gtt-nore=
loc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-2/igt@gem_exec_reloc@basic-cpu-gtt-nore=
loc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-5/igt@gem_exec_reloc@basic-gtt-cpu-nor=
eloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@gem_exec_reloc@basic-write-gtt-no=
reloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@gem_exec_reloc@basic-write-read-=
noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3281">i915#3281</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-c=
hain.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-1/i=
gt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other =
test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-mtlp-4/igt@gem_exec_suspend@basic-s4-devices.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shar=
d-mtlp-6/igt@gem_exec_suspend@basic-s4-devices.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13=
356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/7975">i915#7975</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-=
fences-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@too-many-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-3/igt@gem_fenced_exec_thrash@too-many-=
fences.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@gem_lmem_swapping@heavy-multi.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@gem_lmem_swapping@heavy-verify-r=
andom-ccs@lmem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4565">i915#4565</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk4/igt@gem_lmem_swapping@massive-random.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@gem_lmem_swapping@parallel-random=
-verify.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4613">i915#4613</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@gem_lmem_swapping@parallel-rando=
m-verify-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12193">i915#12193</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-6/igt@gem_lmem_swapping@random-engines=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-9/igt@gem_lmem_swapping@smem-oom.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@gem_lmem_swapping@verify-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-object:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-17/igt@gem_mmap@bad-object.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083=
">i915#4083</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-2/igt@gem_mmap_gtt@cpuset-medium-copy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4077">i915#4077</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-8/igt@gem_mmap_wc@write-wc-read-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4083">i915#4083</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-3/igt@gem_mmap_wc@write-wc-read-gtt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-snoop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-2/igt@gem_partial_pwrite_pread@write-sn=
oop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3282">i915#3282</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-14/igt@gem_partial_pwrite_pread@writes-=
after-reads-display.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3282">i915#3282</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@gem_partial_pwrite_pread@writes-a=
fter-reads-snoop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk8/igt@gem_pwrite@basic-exhaustion.html">=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14702">i915#14702</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2658">i915#2658</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@gem_pwrite@basic-exhaustion.html=
">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@gem_pwrite@basic-random.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-8/igt@gem_pxp@hw-rejects-pxp-buffer.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@gem_pxp@protected-encrypted-src-c=
opy-not-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@gem_pxp@verify-pxp-execution-aft=
er-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@new-obj:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-7/igt@gem_readwrite@new-obj.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
82">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@gem_render_copy@linear-to-vebox-y=
-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-2/igt@gem_render_copy@yf-tiled-ccs-to-=
y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@gem_set_tiling_vs_blt@tiled-to-ti=
led.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8411">i915#8411</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-6/igt@gem_set_tiling_vs_blt@tiled-to-t=
iled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@gem_set_tiling_vs_blt@tiled-to-u=
ntiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-1/igt@gem_softpin@evict-snoop-interrupt=
ible.html">SKIP</a></li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@gem_softpin@evict-snoop-interrup=
tible.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@gem_tiling_max_stride:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@gem_tiling_max_stride.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/407=
7">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@gem_userptr_blits@coherency-sync.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@gem_userptr_blits@coherency-sync.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17433">i915#17433</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-10/igt@gem_userptr_blits@coherency-syn=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17433">i915#17433</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-6/igt@gem_userptr_blits@coherency-sync=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-4/igt@gem_userptr_blits@create-destroy=
-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3297">i915#3297</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@gem_userptr_blits@forbidden-opera=
tions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3282">i915#3282</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@gem_userptr_blits@forbidden-opera=
tions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3282">i915#3282</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@gem_userptr_blits@forbidden-oper=
ations.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3282">i915#3282</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-2/igt@gem_userptr_blits@forbidden-oper=
ations.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3282">i915#3282</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-1/igt@gem_userptr_blits@map-fixed-inval=
idate-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@gem_userptr_blits@map-fixed-inva=
lidate-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@gem_userptr_blits@readonly-unsync=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@gem_userptr_blits@unsync-unmap-a=
fter-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk4/igt@gem_workarounds@suspend-resume.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14586">i915#14586</a>) +1 other test incomplete<=
/li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@gen3_render_linear_blits.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17455">i915#17455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@gen7_exec_parse@basic-offset.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17455">i915#17455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@gen7_exec_parse@basic-rejected.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17455">i915#17455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@gen7_exec_parse@bitmasks.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17455">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-6/igt@gen7_exec_parse@oacontrol-tracki=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17455">i915#17455</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@gen7_exec_parse@oacontrol-trackin=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17455">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-8/igt@gen9_exec_parse@batch-zero-lengt=
h.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-8/igt@gen9_exec_parse@bb-start-out.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-1/igt@gen9_exec_parse@bb-start-param.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@gen9_exec_parse@secure-batches.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gpu_buddy@gpu_buddy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-16/igt@gpu_buddy@gpu_buddy.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1567=
8">i915#15678</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@i915_drm_fdinfo@all-busy-idle-ch=
eck-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@ccs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-3/igt@i915_drm_fdinfo@busy-hang@ccs0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14073">i915#14073</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@vcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-8/igt@i915_drm_fdinfo@busy-hang@vcs0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14073">i915#14073</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@vcs1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-14/igt@i915_drm_fdinfo@most-busy-check-=
all@vcs1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14073">i915#14073</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling@basic-x-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@i915_fb_tiling@basic-x-tiling.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13786">i915#13786</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-16/igt@i915_module_load@fault-injection=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11814">i915#11814</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15481">i915#15481</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@i915_driver_mmio_probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-16/igt@i915_module_load@fault-injection=
@i915_driver_mmio_probe.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk11/igt@i915_module_load@fault-injection@=
intel_connector_register.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abor=
t</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@i915_pm_freq_api@freq-reset.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard=
-dg2-5/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#133=
56</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13820">i915#13820</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@i915_pm_freq_mult@media-freq@gt0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6590">i915#6590</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@i915_pm_freq_mult@media-freq@gt0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14498">i915#14498</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-14/igt@i915_pm_rpm@gem-execbuf-stress-p=
c8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17434">i915#17434</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-10/igt@i915_query@test-query-geometry-=
subslices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@i915_suspend@forcewake.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-9/igt@intel_hwmon@hwmon-read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7=
707">i915#7707</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk3/igt@intel_hwmon@hwmon-read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/116=
80">i915#11680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_addfb_basic@basic-x-tiled-le=
gacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4212">i915#4212</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-17/igt@kms_addfb_basic@basic-y-tiled-le=
gacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4215">i915#4215</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-=
on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12454">i915#12454</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-5/igt@kms_addfb_basic@tile-pitch-misma=
tch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk4/igt@kms_async_flips@alternate-sync-asy=
nc-flip-atomic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>) +1 other test=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk11/igt@kms_async_flips@async-flip-suspen=
d-resume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12761">i915#12761</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test=
 incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-=
hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16045/shard-dg2-5/igt@kms_async_flips@async-flip-suspend-resum=
e@pipe-d-hdmi-a-3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12761">i915#12761</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 o=
ther test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-1/igt@kms_async_flips@async-flip-with-page-flip-events-=
linear.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16045/shard-dg2-7/igt@kms_async_flips@async-flip-with-page-flip-=
events-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17356">i915#17356</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-invalid-params@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_atomic@atomic-invalid-params@=
pipe-a-hdmi-a-3.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/13562">i915#13562</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk2/igt@kms_atomic_transition@plane-all-mo=
deset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_atomic_transition@plane-all-=
modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@kms_big_fb@4-tiled-16bpp-rotate-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5286">i915#5286</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-4/igt@kms_big_fb@4-tiled-16bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17431">i915#17431</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@kms_big_fb@4-tiled-64bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5286">i915#5286</a>) +6 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-9/igt@kms_big_fb@4-tiled-64bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_big_fb@4-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_big_fb@linear-16bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@kms_big_fb@linear-8bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3638">i915#3638</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_big_fb@linear-max-hw-stride-3=
2bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-14/igt@kms_big_fb@linear-max-hw-stride-=
32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-2/igt@kms_big_fb@linear-max-hw-stride-=
64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_big_fb@x-tiled-16bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17431">i915#17431</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_big_fb@x-tiled-16bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17431">i915#17431</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-17/igt@kms_big_fb@x-tiled-16bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-4/igt@kms_big_fb@y-tiled-64bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17431">i915#17431</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg1-14/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/sha=
rd-dg1-14/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4=
423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-3/igt@kms_big_fb@yf-tiled-addfb-size-o=
ffset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17432">i915#17432</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_big_fb@yf-tiled-addfb-size-o=
verflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17432">i915#17432</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_big_fb@yf-tiled-addfb-size-o=
verflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17432">i915#17432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride=
-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4538">i915#4538</a>) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4538">i915#4538</a>) +3 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-5/igt@kms_big_fb@yf-tiled-max-hw-stride=
-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-8/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17432">i915#17432</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_ccs@bad-aux-stride-4-tiled-m=
tl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +205 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_ccs@bad-pixel-format-y-tiled-=
gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17356">i915#17356</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_ccs@bad-rotation-90-4-tiled-=
bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-7/igt@kms_ccs@bad-rotation-90-4-tiled-=
dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6095">i915#6095</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_ccs@ccs-on-another-bo-y-tiled=
-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +78 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-1/igt@kms_ccs@crc-primary-basic-4-tiled=
-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a=
-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +24 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-til=
ed-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-3/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk9/igt@kms_ccs@crc-primary-suspend-y-tile=
d-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) =
+1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16045/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +20 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk10/igt@kms_ccs@crc-primary-suspend-yf-ti=
led-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test =
incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-ti=
led-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#=
6095</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-4/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y=
-tiled-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +10=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +50 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-m=
tl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +72 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-=
ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-rejected-max-dotclock:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-9/igt@kms_cdclk@mode-rejected-max-dotc=
lock.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17099">i915#17099</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_cdclk@mode-transition.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-9/igt@kms_cdclk@plane-scaling.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-1/igt@kms_chamelium_audio@dp-audio-afte=
r-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_chamelium_color@ctm-0-50.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17427">i915#17427</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_chamelium_color@ctm-0-50.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17427">i915#17427</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-3/igt@kms_chamelium_color@ctm-0-50.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-9/igt@kms_chamelium_color@ctm-limited-=
range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_chamelium_color@ctm-max.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_chamelium_color@degamma.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17427">i915#17427</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-4/igt@kms_chamelium_color_pipeline@pla=
ne-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_chamelium_color_pipeline@pla=
ne-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_chamelium_color_pipeline@plan=
e-fixed-matrix-yuv-rgb-bt709.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_chamelium_color_pipeline@plan=
e-lut1d-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-post-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_chamelium_edid@hdmi-edid-stre=
ss-resolution-non-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-5/igt@kms_chamelium_edid@hdmi-mode-tim=
ings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-16/igt@kms_chamelium_frames@dp-crc-sing=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7828">i915#7828</a>) +10 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-3/igt@kms_chamelium_frames@dp-crc-sing=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-enable-d=
isable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +12 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-eac=
h-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-with-e=
nabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_color@background-color@pipe-a-background-color:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk11/igt@kms_color@background-color@pipe-a=
-background-color.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17133">i915#17133</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-6/igt@kms_color@gamma.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_col=
or@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12655">i915#12655</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17373">i915#17373</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-c-plane-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-1/igt@kms_color_pipeline@plane-ctm3x4-l=
ut1d@pipe-c-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16990">i915#16990</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-1/igt@kms_color_pipeline@plane-lut1d-lut1d.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/sh=
ard-dg2-7/igt@kms_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529">i915#155=
29</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-3:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_color_pipeline@plane-lut1d-lu=
t1d@pipe-a-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16990">i915#16990</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-5:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_color_pipeline@plane-lut1d-p=
ost-ctm3x4@pipe-d-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_color_pipeline@plane-lut1d-p=
re-ctm3x4@pipe-d-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_content_protection@atomic-dpm=
s-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-6/igt@kms_content_protection@atomic-dp=
ms-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@kms_content_protection@atomic-hd=
cp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_content_protection@content-ty=
pe-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_content_protection@dp-mst-lic=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-7/igt@kms_content_protection@dp-mst-li=
c-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_content_protection@legacy.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15865">i915#15865</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-5=
12x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-10/igt@kms_cursor_crc@cursor-offscreen=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-2/igt@kms_cursor_crc@cursor-offscreen-=
max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-25=
6x85@pipe-a-hdmi-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-32=
x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_cursor_crc@cursor-onscreen-ma=
x-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-tglu-3/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-=
a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16045/shard-tglu-10/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-=
hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_cursor_crc@cursor-random-512=
x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-tglu-1:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-tglu-1/igt@kms_cursor_crc@cursor-random-64x21.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/sha=
rd-tglu-1/igt@kms_cursor_crc@cursor-random-64x21.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566<=
/a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-move=
ment-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-12=
8x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-2=
56x85.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-10/igt@kms_cursor_legacy@2x-cursor-vs-=
flip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-1/igt@kms_cursor_legacy@2x-flip-vs-curs=
or-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17428">i915#17428</a>) +83 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-5/igt@kms_cursor_legacy@2x-flip-vs-cur=
sor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-8/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16119">i915#16119</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</=
li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-a=
tomic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15804">i915#15804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-5/igt@kms_cursor_legacy@modeset-atomic=
-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103=
">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_display_modes@extended-mode-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@kms_dp_link_training@non-uhbr-sst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17288">i915#17288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_dp_link_training@uhbr-sst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@kms_dp_link_training@uhbr-sst-tbt=
alt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17285">i915#17285</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_dp_link_training@uhbr-sst-tb=
talt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17285">i915#17285</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-4/igt@kms_dp_link_training@uhbr-sst-tb=
talt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@kms_dp_linktrain_fallback@dp-fall=
back.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16867">i915#16867</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_dp_linktrain_fallback@dsc-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13707">i915#13707</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-9/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-3/igt@kms_dp_linktrain_fallback@uhbr-t=
o-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16870">i915#16870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@kms_draw_crc@draw-method-mmap-gt=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@kms_dsc@dsc-basic.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">=
i915#16361</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@kms_dsc@dsc-fractional-bpp-bigjo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-3/igt@kms_dsc@dsc-with-formats.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-=
bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-w=
ith-bpc-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-6/igt@kms_dsc@dsc-with-output-formats-=
with-bpc-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-4/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/i=
gt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-17/igt@kms_fbcon_fbt@psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680"=
>i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@kms_feature_discovery@display-4x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_feature_discovery@dsc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@kms_feature_discovery@hdr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16600">i915#16600</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-9/igt@kms_feature_discovery@hdr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-2/igt@kms_feature_discovery@psr1.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_feature_discovery@psr1.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@kms_feature_discovery@psr2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-2/igt@kms_flip@2x-blocking-absolute-wf=
_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@kms_flip@2x-dpms-vs-vblank-race.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9934">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi=
-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16045/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-=
hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_flip@2x-flip-vs-panning-vs-ha=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@kms_flip@2x-plain-flip.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
934">i915#9934</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recrea=
te-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_flip@2x-plain-flip-interrupti=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-4/igt@kms_flip@2x-wf_vblank-ts-check.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-5/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
045/shard-dg2-7/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1735=
8">i915#17358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@kms_flip@flip-vs-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16276">i915#16276</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6113">i915#6113</a>) +1 other test incomplete</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk5/igt@kms_flip@flip-vs-suspend.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12314">i915#12314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">=
i915#4839</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk5/igt@kms_flip@flip-vs-suspend@a-hdmi-a1=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12314">i915#12314</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#=
17183</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-3/igt@kms_flip@modeset-vs-vblank-race.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-d=
g2-7/igt@kms_flip@modeset-vs-vblank-race.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tes=
ts skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-li=
near-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-l=
inear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>=
) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-5/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16045/shard-dg2-7/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4til=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8813">i915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_force_connector_basic@force-=
load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17452">i915#17452</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +9 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/182=
5">i915#1825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915=
#1825</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a=
>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16045/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-til=
ing-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/10055">i915#10055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@kms_frontbuffer_tracking@fbchdr-=
1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +13 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-14/igt@kms_frontbuffer_tracking@fbchdr-=
farfromfence-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +29 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-r=
gb565-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16708">i915#16708</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-stridechange:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-=
stridechange.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15989">i915#15989</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@kms_frontbuffer_tracking@fbchdr-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5439">i915#5439</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-3/igt@kms_frontbuffer_tracking@fbchdr-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5439">i915#5439</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt=
:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15=
990</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102<=
/a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:</=
p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +32 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-=
rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15102">i915#15102</a>) +20 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-=
rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15102">i915#15102</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-=
rgb565-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-t=
iling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>)=
 +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-o=
ffscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +26 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-ms=
flip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16045/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn=
-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15989">i915#15989</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-3/igt@kms_frontbuffer_tracking@hdr-1p-=
primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +8 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-1p-p=
rimscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@kms_frontbuffer_tracking@hdr-1p-=
primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +22 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_frontbuffer_tracking@hdr-2p-p=
rimscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-s=
cndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-7/igt@kms_frontbuffer_tracking@hdr-2p-=
scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) =
+12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fb=
c-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9766">i915#9766</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_frontbuffer_tracking@pipe-fb=
c-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-o=
ffscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +29 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)=
 +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@kms_frontbuffer_tracking@psrhdr-1=
p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +55 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_frontbuffer_tracking@psrhdr-=
2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +94 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-8/igt@kms_frontbuffer_tracking@psrhdr-=
2p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +60 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-5/igt@kms_frontbuffer_tracking@psrhdr-=
2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank160:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-snb7/igt@kms_hdmi_audio_bw@audio-bw-hblank1=
60.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17104">i915#17104</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-4/igt@kms_hdmi_audio_bw@audio-bw-hblan=
k160.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17103">i915#17103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-3/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16045/shard-dg2-7/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17357">i915#17357</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-1/igt@kms_hdr@bpc-switch-dpms.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-2/igt=
@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8=
228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@kms_hdr@invalid-metadata-sizes.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16644">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_hdr@static-swap.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518=
">i915#16518</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@kms_hdr@static-swap.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@kms_hdr@static-toggle-dpms.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-3/igt@kms_invalid_mode@bad-vsync-end.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg=
2-7/igt@kms_invalid_mode@bad-vsync-end.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#16746</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3=
555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_joiner@basic-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-10/igt@kms_joiner@basic-force-big-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_joiner@invalid-modeset-force=
-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@kms_mst@mst-suspend-read-crc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16451">i915#16451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15815">i915#15815</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-10/igt@kms_multipipe_modeset@basic-max=
-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-4/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-=
dg2-7/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i=
915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-cr=
c@pipe-c-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12756">i915#12756</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915=
#13409</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16789">i915#16789</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_pipe_stress@stress-xrgb8888-=
4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-b=
mg-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-8/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifie=
r.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16045/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modif=
ier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8825">i915#8825</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@kms_plane@pixel-format-4-tiled-d=
g2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg=
2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15=
709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5=
:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-1/igt@kms_plane@pixel-format-4-tiled-dg=
2-rc-ccs-cc-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_plane@pixel-format-4-tiled-ln=
l-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-mt=
l-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15709">i915#15709</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-4/igt@kms_plane@pixel-format-4-tiled-m=
tl-mc-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:=
</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-17/igt@kms_plane@pixel-format-y-tiled-g=
en12-rc-ccs-modifier@pipe-a-plane-7.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-17/igt@kms_plane@pixel-format-yf-tiled-=
ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-16/igt@kms_plane@planar-pixel-format-se=
ttings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk2/igt@kms_plane@plane-panning-bottom-rig=
ht-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/13026">i915#13026</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other te=
st incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk3/igt@kms_plane_alpha_blend@alpha-opaque=
-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk3/igt@kms_plane_alpha_blend@alpha-opaque=
-fb@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk11/igt@kms_plane_alpha_blend@constant-al=
pha-max.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk11/igt@kms_plane_alpha_blend@constant-al=
pha-max@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-3/igt@kms_plane_multiple@2x-tiling-non=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_plane_multiple@2x-tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@kms_plane_scaling@intel-max-src-=
size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-3/igt@kms_plane_scaling@plane-downscal=
e-factor-0-5-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +9 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-wit=
h-modifiers.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-fac=
tor-0-75-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#=
9423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-c:=
</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-wit=
h-modifiers@pipe-c.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_plane_scaling@plane-downsc=
ale-factor-0-75-with-modifiers@pipe-c.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +8 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-17/igt@kms_plane_scaling@plane-scaler-w=
ith-clipping-clamping-rotation.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-2=
0x20-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-10/igt@kms_plane_scaling@plane-upscale=
-20x20-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-f=
actor-0-25-with-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">=
i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-b=
:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-f=
actor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d=
:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-f=
actor-0-25-with-pixel-format@pipe-d.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#173=
56</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_plane_scaling@plane-upscale-=
factor-0-25-with-rotation@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other te=
sts skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-17/igt@kms_plane_scaling@plane-upscale-=
factor-0-25-with-rotation@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +18 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-=
factor-0-75.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_plane_scaling@planes-unity-scalin=
g-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#=
3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6953">i915#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d:=
</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-=
factor-0-75@pipe-d.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_plane_scaling@planes-unity=
-scaling-downscale-factor-0-75@pipe-d.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#1=
7356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@kms_pm_backlight@brightness-with-=
dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-4/igt@kms_pm_backlight@fade.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12=
343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9812">i915#9812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@kms_pm_backlight@fade-with-dpms.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-14/igt@kms_pm_backlight@fade-with-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk10/igt@kms_pm_dc@dc5-dpms-suspend-resume=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16938">i915#16938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_pm_dc@dc5-pageflip-negative.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479"=
>i915#16479</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-16/igt@kms_pm_dc@dc6-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361"=
>i915#3361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_pm_dc@dc6-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948"=
>i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-10/igt@kms_pm_dc@dc9-dpms.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1573=
9">i915#15739</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@kms_pm_rpm@cursor.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">=
i915#4077</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-9/igt@kms_pm_rpm@dpms-non-lpsp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress-no=
-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
045/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1507=
3">i915#15073</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
045/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1507=
3">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-5/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rk=
l-6/igt@kms_pm_rpm@system-suspend-idle.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#14419</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_prime@d3hot.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i9=
15#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-8/igt@kms_properties@colorop-properties-legacy.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1604=
5/shard-dg2-7/igt@kms_properties@colorop-properties-legacy.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15347">i=
915#15347</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk10/igt@kms_psr2_sf@fbc-pr-cursor-plane-m=
ove-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-1/igt@kms_psr2_sf@fbc-psr2-overlay-plan=
e-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:<=
/p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-pri=
mary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk11/igt@kms_psr2_sf@fbc-psr2-plane-move-s=
f-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-snb5/igt@kms_psr2_sf@psr2-cursor-plane-move=
-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_psr2_sf@psr2-cursor-plane-mo=
ve-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-up=
date-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other te=
sts skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-10/igt@kms_psr2_sf@psr2-overlay-plane-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk3/igt@kms_psr2_sf@psr2-overlay-primary-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@kms_psr2_sf@psr2-overlay-primary-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-14/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9683">i915#9683</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-5/igt@kms_psr@fbc-psr-sprite-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9688">i915#9688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@kms_psr@fbc-psr2-primary-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9732">i915#9732</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_psr@fbc-psr2-sprite-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@kms_psr@pr-dpms.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i9=
15#9732</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk8/igt@kms_psr@psr-cursor-plane-move.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_psr@psr-dpms.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i9=
15#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9732">i915#9732</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_psr@psr-sprite-mmap-cpu.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_psr@psr2-sprite-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-14/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15949">i915#15949</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-2/igt@kms_rotation_crc@bad-pixel-forma=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_rotation_crc@bad-pixel-format=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-17/igt@kms_rotation_crc@exhaust-fences.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4884">i915#4884</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk2/igt@kms_rotation_crc@multiplane-rotati=
on.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15492">i915#15492</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16184">i915#16184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@kms_rotation_crc@primary-4-tiled-=
reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-5/igt@kms_rotation_crc@primary-4-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@kms_rotation_crc@primary-4-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-3/igt@kms_scaling_modes@scaling-mode-n=
one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-17/igt@kms_selftest@drm_framebuffer.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13179">i915#13179</a>) +1 other test abort</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk11/igt@kms_selftest@drm_framebuffer.html=
">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-6/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_s=
etmode@basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-15/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>) +8 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk1/igt@kms_setmode@basic-clone-single-crt=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17463">i915#17463</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_tv_load_detect@load-detect.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17445">i915#17445</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-14/igt@kms_tv_load_detect@load-detect.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17445">i915#17445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-glk5/igt@kms_vblank@ts-continuation-suspend=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12276">i915#12276</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incompl=
ete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_vrr@lobf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#=
11920</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915=
#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@kms_vrr@max-min.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i91=
5#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-18/igt@kms_vrr@seamless-rr-switch-drrs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_vrr@seamless-rr-switch-virtua=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9906">i915#9906</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-9/igt@kms_vrr@seamless-rr-switch-virtu=
al.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9906">i915#9906</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-4/igt@kms_vrr@seamless-rr-switch-virtu=
al.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8808">i915#8808</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-5/igt@perf@global-sseu-config.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
7387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-12/igt@perf@mi-rpc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2=
434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@perf@per-context-mode-unprivilege=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2435">i915#2435</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@perf@unprivileged-single-ctx-coun=
ters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2433">i915#2433</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@perf@unprivileged-single-ctx-cou=
nters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17455">i915#17455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-7/igt@perf_pmu@busy-double-start.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4349">i915#4349</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-mtlp-2/igt@perf_pmu@rc6-suspend.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-6/igt@=
perf_pmu@rc6-suspend.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17245">i915#17245</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-7/igt@perf_pmu@rc6@other-idle-gt0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-mtlp-7/igt@perf_pmu@semaphore-busy@vcs1.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtl=
p-5/igt@perf_pmu@semaphore-busy@vcs1.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +4 other =
tests fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@prime_vgem@basic-fence-read.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17448">i915#17448</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-16/igt@prime_vgem@basic-gtt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/370=
8">i915#3708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg1-19/igt@prime_vgem@fence-read-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3708">i915#3708</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-tglu-4/igt@prime_vgem@fence-read-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17448">i915#17448</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_read@short-buffer-block:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@drm_read@short-buffer-block.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17359">i915#1=
7359</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
6045/shard-dg2-4/igt@drm_read@short-buffer-block.html">PASS</a> +1 other te=
st pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@fbdev@pan.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt=
@fbdev@pan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#=
13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16348">i915#16348</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16045/shard-dg2-8/igt@gem_ccs@suspend-resume.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-glk6/igt@gem_ctx_isolation@preservation-s3@rcs0.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16466">i915#16466</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16045/shard-glk3/igt@gem_ctx_isolation@prese=
rvation-s3@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-mtlp-6/igt@gem_eio@in-flight-suspend.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17268">i915#17=
268</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
045/shard-mtlp-7/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-mtlp-8/igt@gem_workarounds@suspend-resume.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/172=
46">i915#17246</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16045/shard-mtlp-4/igt@gem_workarounds@suspend-resume.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-1/igt@gem_workarounds@suspend-resume-context.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5131">i915#15131</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16045/shard-rkl-5/igt@gem_workarounds@suspend-resume-context.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-6/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964"=
>i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16045/shard-dg2-7/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-glk1/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i9=
15#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16045/shard-glk3/igt@i915_pm_rpm@system-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-8/igt@i915_selftest@live.html">DMESG-FAIL</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-8/ig=
t@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-8/igt@i915_selftest@live@gem_contexts.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/168=
80">i915#16880</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16045/shard-dg2-8/igt@i915_selftest@live@gem_contexts.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@i915_suspend@fence-restore-tiled2untiled.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4817">i915#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16045/shard-rkl-3/igt@i915_suspend@fence-restore-tiled2unti=
led.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-mtlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-d=
-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17150">i915#17150</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-6/igt@kms_async_flips@async-fli=
p-suspend-resume@pipe-d-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_busy@basic.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i91=
5#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16045/shard-dg2-4/igt@kms_busy@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-c=
c@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17158">i915#17158</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-7/igt@kms_ccs@crc-prima=
ry-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-c=
c@pipe-c-edp-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-mtlp-7/igt@kms_ccs@crc=
-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1.html">PASS</a> +1 other=
 test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@background-color:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_color@background-color.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373">i915#17=
373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
045/shard-dg2-5/igt@kms_color@background-color.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_color@ctm-blue-to-red.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#126=
55</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17373">i915#17373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16045/shard-dg2-8/igt@kms_color@ctm-blue-to-red.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2=
020-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15529">i915#15529</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_color_pipeline@plan=
e-fixed-matrix-yuv-rgb-bt2020-lut1d.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/135=
66">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16045/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html">=
PASS</a> +6 other tests pass</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16045/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-128x42.html=
">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transition=
s.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15804">i915#15804</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16045/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor=
-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-4/igt@kms_feature_discovery@hdr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#166=
00</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_160=
45/shard-rkl-6/igt@kms_feature_discovery@hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_flip@dpms-off-confusion-interruptible.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16045/shard-dg2-8/igt@kms_flip@dpms-off-confusion-interruptible.=
html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4ti=
le-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-8/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">PASS</a> +3 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indf=
b-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-5/igt@kms_frontbuf=
fer_tracking@fbc-1p-primscrn-cur-indfb-move.html">PASS</a> +7 other tests p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-i=
ndfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_frontbuffer_=
tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html">PASS</a> +10 other =
tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-glk9/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-blt.ht=
ml">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16045/shard-glk8/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-blt.html=
">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-handle-not-fb:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg1-17/igt@kms_getfb@getfb2-handle-not-fb.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/442=
3">i915#4423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16045/shard-dg1-14/igt@kms_getfb@getfb2-handle-not-fb.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-3/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/355=
5">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16045/shard-rkl-1/igt@kms_hdr@static-toggle.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_invalid_mode@bad-hsync-end.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i91=
5#16746</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_invalid_mode@bad-hsync-end.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-glk6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-=
1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12756">i915#12756</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915=
#13476</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16789">i915#16789</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16045/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc@p=
ipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modi=
fier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8825">i915#8825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16045/shard-dg2-1/igt@kms_plane@pixel-format-4-tiled=
-dg2-rc-ccs-cc-modifier.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe=
-a.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14412">i915#14412</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_plane@plane-panning-=
bottom-right-suspend@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with=
-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard=
-dg2-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.h=
tml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with=
-rotation@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@=
kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d.html">PAS=
S</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pip=
e-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15329">i915#15329</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_plane_scaling@planes-down=
scale-factor-0-5@pipe-a.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-down=
scale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423=
">i915#9423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16045/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-do=
wnscale-factor-0-5.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073"=
>i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16045/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</=
a> +3 other tests pass</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073"=
>i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16045/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16045/shard-dg1-19/igt@kms_pm_rpm@modeset-non-lpsp-stress-no=
-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_vblank@ts-continuation-dpms-suspend.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16045/shard-dg2-6/igt@kms_vblank@ts-continuation-dpms-suspend.ht=
ml">PASS</a> +36 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-mtlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17209">i915#17209</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-mtlp-7/igt@kms_vblank@ts-continuation-suspe=
nd@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_mmap_kms@buffer-sharing:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@prime_mmap_kms@buffer-sharing.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915=
#17454</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16045/shard-dg2-3/igt@prime_mmap_kms@buffer-sharing.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280"=
>i915#280</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16045/shard-rkl-5/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-tglu-7/igt@gem_exec_big@single.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15944">i915#15944</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/sh=
ard-tglu-7/igt@gem_exec_big@single.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15816">i915#15816</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-8/igt@gem_exec_flush@basic-batch-kernel-default-cmd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3711">i915#3711</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16045/shard-rkl-6/igt@gem_exec_flush@basic-batch-kernel-defa=
ult-cmd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3711">i915#3711</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-4/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17453">i915#17=
453</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
045/shard-rkl-6/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1745=
3">i915#17453</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-softpin:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16045/shard-rkl-3/igt@gem_exec_reloc@basic-softpin.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
81">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-4/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16045/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-8/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">=
i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/7582">i915#7582</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16045/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@gem_lmem_swapping@massive-random.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16045/shard-rkl-7/igt@gem_lmem_swapping@massive-random.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-5/igt@gem_lmem_swapping@verify.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045=
/shard-rkl-6/igt@gem_lmem_swapping@verify.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i91=
5#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-displ=
ay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-=
after-reads-display.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@self:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@gem_pread@self.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915=
#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16045/shard-rkl-4/igt@gem_pread@self.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/84=
11">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16045/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-4/igt@gem_userptr_blits@access-control.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i9=
15#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16045/shard-rkl-6/igt@gem_userptr_blits@access-control.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16045/shard-rkl-2/igt@gem_userptr_blits@dmabuf-unsync.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-3/igt@gen3_render_tiledx_blits.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#174=
55</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_160=
45/shard-rkl-6/igt@gen3_render_tiledx_blits.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">=
i915#17455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16045/shard-rkl-7/igt@gen9_exec_parse@valid-registers.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8399">i915#8399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16045/shard-rkl-5/igt@i915_pm_freq_api@freq-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/7707">i915#7707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16045/shard-rkl-3/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915=
#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-invalid-params:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_atomic@atomic-invalid-params.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i=
915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16045/shard-dg2-3/igt@kms_atomic@atomic-invalid-params.html">ABORT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562">=
i915#13562</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transitio=
n-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7=
/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-pa=
nels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@kms_big_fb@4-tiled=
-16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431"=
>i915#17431</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16045/shard-dg2-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1735=
6">i915#17356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/52=
86">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16045/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-a=
sync-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_big_fb@=
4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/453=
8">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431"=
>i915#17431</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg1-12/igt@kms_big_fb@linear-64bpp-rotate-90.html">ABORT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562=
">i915#13562</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16045/shard-dg1-19/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/363=
8">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-=
hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stri=
de-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-=
hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_big_fb@linear-max-hw-stri=
de-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356"=
>i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16045/shard-dg2-8/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1743=
1">i915#17431</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356"=
>i915#17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-18=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5190">i915#5190</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-offset-o=
verflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-a=
sync-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_big_fb@=
y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/519=
0">i915#5190</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538"=
>i915#4538</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16045/shard-rkl-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4538">i915#4538</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4538">i915#4538</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16045/shard-rkl-2/igt@kms_big_fb@yf-tiled-64bpp-rotat=
e-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-8/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#174=
32</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_160=
45/shard-rkl-6/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432"=
>i915#17432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17432">i915#17432</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@kms_big_fb@yf-tiled=
-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/10307">i915#10307</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_ccs@bad-aux-stride-=
4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +8 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-m=
c-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pip=
e-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_cc=
s@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#=
6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pip=
e-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-=
rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12805">i915#12805</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-ln=
l-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6=
095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16045/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_ccs@crc-primary-suspend=
-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
2313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16045/shard-dg2-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17356">i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-y=
uv-rgb-bt601-lim.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@=
kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7427">i915#17427</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151"=
>i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-1/igt@kms_chamelium_fra=
mes@dp-frame-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-afte=
r-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_content_protection@content-type-change.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_content_protection@content-type-cha=
nge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-1.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16045/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3299">i915#3299</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0-suspend-resu=
me.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_content_protection@dp-mst-=
type-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@kms_content_protection@lic-type-1.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@kms_content_protection@lic-type-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-1/igt@kms_content_protection@mei-interface.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1586=
5">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16045/shard-dg2-7/igt@kms_content_protection@mei-interface.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17356">i915#17356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-7/igt@kms_content_protection@type1.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#=
15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16045/shard-rkl-6/igt@kms_content_protection@type1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/355=
5">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16045/shard-dg2-7/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
3049">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16045/shard-dg2-7/igt@kms_cursor_crc@cursor-offscreen-512x512.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17356">i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13049">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13049">i915#13049</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356=
">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16045/shard-dg2-1/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-a=
tomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-l=
egacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-l=
egacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-5/igt@kms_cursor_=
legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16045/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legac=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17454">i915#17454</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_cursor=
_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833">i915#=
9833</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
6045/shard-dg2-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#173=
56</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@kms_dither@fb-8bpc-vs=
-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-7/igt@kms_dither@fb-8bpc-=
vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_dp_link_training@non-uhbr-mst-t=
btalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17291">i915#17291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst-direct-train.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17286">i915#17286</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@kms_dp_link_trainin=
g@non-uhbr-sst-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17286">i915#17286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16045/shard-dg2-8/igt@kms_dp_link_training@non-uhbr-sst-t=
btalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17290">i915#17290</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-8/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915=
#13748</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16045/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17=
356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-4/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17285">i915#17285</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst-tbtalt-tr=
ain.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_dp_link_training@uhbr-sst-tbtalt-tr=
ain.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17285">i915#17285</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard=
-dg2-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-3/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16=
361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
045/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1636=
1">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i9=
15#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16045/shard-dg2-3/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i91=
5#16361</a>) +3 other tests skip</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16045/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17356">i915#17356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-8/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i915#=
16599</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16045/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16599">i915#16599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interrupti=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_flip@2x-flip-vs-absolute-wf=
_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16045/shard-rkl-2/igt@kms_flip@2x-flip-vs-fences-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard=
-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i9=
15#12314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-=
a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/=
shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12314">i915#12314</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#=
17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12314">i915#12314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i9=
15#4839</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/6113">i915#6113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16045/shard-glk2/igt@kms_flip@flip-vs-suspend-interruptible=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4=
839</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/12314">i915#12314</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17=
183</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
045/shard-glk2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp=
-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/i=
gt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp=
-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_flip_scaled=
_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shr=
fb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-1/igt@kms_frontbuffer_=
tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#151=
04</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-ind=
fb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shar=
d-dg1-15/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-g=
tt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15990">i915#15990</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrf=
b-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@km=
s_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1599=
0">i915#15990</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8708">i915#8708</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-=
gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15990">i915#15990</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_frontbuffer=
_tracking@fbc-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#53=
54</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/543=
9">i915#5439</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16045/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-s=
hrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@km=
s_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/167=
08">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5354">i915#5354</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-i=
ndfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@k=
ms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-3/igt@kms_f=
rontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915=
#17428</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-pri-indfb-m=
ultidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_frontbuffer_tracking=
@fbcpsrhdr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +13 other =
tests skip</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-pri-indfb-m=
ultidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#151=
02</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-in=
dfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_frontbuffer_tr=
acking@fbcpsrhdr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>=
) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-flipt=
rack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_frontbuffer_tra=
cking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) =
+16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indf=
b-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_frontbuffer_tra=
cking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) =
+17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-=
wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15990">i915#15990</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-r=
gb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +15 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-suspend.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1670=
8">i915#16708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16045/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15989">i915#15989</a>) +11 other tests skip</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-suspend.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1598=
9">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16045/shard-rkl-1/igt@kms_frontbuffer_tracking@hdr-suspend.html">AB=
ORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15132">i915#15132</a>)</li>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-glk3/igt@kms_frontbuffer_tracking@hdr-suspend.html">SKIP</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/sha=
rd-glk8/igt@kms_frontbuffer_tracking@hdr-suspend.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#=
13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16056">i915#16056</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16593">i915#16593</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/167=
08">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4342">i915#4342</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_frontbuffer_=
tracking@pipe-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indf=
b-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_frontbuffer_tracking@p=
sr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>=
) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indf=
b-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shar=
d-rkl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indf=
b-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-6/igt@kms_frontbuf=
fer_tracking@psr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i=
915#5354</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-indf=
b-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +13 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-1/igt@kms_frontbuffer_t=
racking@psr-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +10 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-1/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-mult=
idraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15991">i915#15991</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_frontbuffer_tracking@ps=
rhdr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +43 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-i=
ndfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_frontbuffer_trackin=
g@psrhdr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#174=
28</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-s=
hrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-3/igt@kms_frontbuffer_tra=
cking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) =
+30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17357">i915#17357</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16045/shard-dg2-5/igt@kms_hdmi_audio_bw@suspend-disk-audio=
-recovery.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436">i=
915#15436</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16045/shard-rkl-8/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16=
644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"=
>i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_hdr@invalid-hdr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356"=
>i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15458">i915#15458</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-ult=
ra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-3/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451">i915#=
16451</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16045/shard-dg2-7/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#173=
56</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-1/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045=
/shard-rkl-6/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i91=
5#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-glk8/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/118">i915#118</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16045/shard-glk2/igt@kms_pipe_stress@stress-xrgb8888-untiled.ht=
ml">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4712">i915#14712</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16045/shard-dg2-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15709">i915#15709</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-bmg=
-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@kms_plane@pixel-forma=
t-yf-tiled-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i91=
5#13958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16045/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#=
17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i91=
5#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16045/shard-dg2-4/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#=
13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#1=
7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
6045/shard-dg2-3/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-5/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953=
">i915#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9423">i915#9423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-dg2-7/igt@kms_plane_scaling@intel-max-src-s=
ize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-4/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343"=
>i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_pm_backlight@fade-with-suspen=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16914">i915#16914</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@kms_pm_dc@dc5-psr-suspend-resume.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16914">i915#16914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shar=
d-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg1-14/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/sha=
rd-dg1-19/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-=
area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-p=
rimary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +4=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-4/igt@kms_psr2_sf@pr-o=
verlay-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-4/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#968=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1604=
5/shard-rkl-6/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">=
i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-3/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915=
#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-render.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915=
#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-5/igt@kms_psr@psr-sprite-plan=
e-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overl=
ay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15949">i915#15949</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_psr_stress_test@flip-prima=
ry-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#1=
7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
6045/shard-dg2-5/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2-4/igt@kms_rotation_crc@prima=
ry-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-8/igt@km=
s_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289"=
>i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16045/shard-rkl-6/igt@kms_setmode@invalid-clone-single-crtc=
-stealing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-mtlp-2/igt@kms_vblank@ts-continuation-suspend.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/12276">i915#12276</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16045/shard-mtlp-7/igt@kms_vblank@ts-continuation-suspend.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17209">i915#17209</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-6/igt@kms_vrr@flipline.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i9=
15#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16045/shard-dg2-7/igt@kms_vrr@flipline.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-3/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-dg2=
-7/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-dg2-4/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906=
">i915#9906</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16045/shard-dg2-7/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#173=
56</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-5/igt@perf@mi-rpc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16045/shard-rkl-6/i=
gt@perf@mi-rpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9164/shard-rkl-4/igt@prime_vgem@basic-read.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17448</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/329=
1">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16045/shard-rkl-6/igt@prime_vgem@basic-read.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17448">i915#17448</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9164 -&gt; IGTPW_16045</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19394: d56ff005f0d16ec136ee31fe3238eb447fefdc1a @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_16045: 16045<br />
  IGT_9164: 9164</p>

</body>
</html>

--===============1523931175290452007==--
