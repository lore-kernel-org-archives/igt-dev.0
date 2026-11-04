Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F072D606A328
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 09:56:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9139610FABB;
	Wed,  4 Nov 2026 09:56:03 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A7A10FAA4;
 Wed,  4 Nov 2026 09:55:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7492991824864534757=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_DRM=5FCOLOROP=5F3D=5FLUT?=
 =?utf-8?q?=5FDMA_colorop_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harry Wentland" <harry.wentland@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 04 Nov 2026 09:55:08 -0000
Message-ID: <179378610837.115931.13953923197214351307@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261103213800.618130-1-harry.wentland@amd.com>
In-Reply-To: <20261103213800.618130-1-harry.wentland@amd.com>
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

--===============7492991824864534757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: DRM_COLOROP_3D_LUT_DMA colorop tests
URL   : https://patchwork.freedesktop.org/series/177635/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9177_full -> IGTPW_16097_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_16097_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_16097_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_16097_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gt_engines:
    - shard-mtlp:         [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-3/igt@i915_selftest@live@gt_engines.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-5/igt@i915_selftest@live@gt_engines.html

  * igt@perf_pmu@frequency:
    - shard-dg1:          [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg1-19/igt@perf_pmu@frequency.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-16/igt@perf_pmu@frequency.html

  
New tests
---------

  New tests have been introduced between IGT_9177_full and IGTPW_16097_full:

### New IGT tests (95) ###

  * igt@i915_selftest@4-tiled-max-hw-stride-32bpp-rotate-0:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@async-flip-suspend-resume:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@atomic-fastset:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@bad-vsync-start:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@basic-with_fd_dup:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@close-race:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@cold-reset-bound:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@content-type-change:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@crc-primary-basic-4-tiled-bmg-ccs:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@crc-primary-suspend-y-tiled-ccs:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@crtc-invalid-params:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@cursor-onscreen-64x64:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@disable-crc-after-crtc:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@double-destroy:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@drm-resources-equal:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@dsc-fractional-bpp-ultrajoiner:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@etime-multi-wait-all-available-unsubmitted:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@execute-one:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@fbc-2p-primscrn-cur-indfb-draw-render:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@fbc-2p-primscrn-indfb-plflip-blt:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@fbc-pr-overlay-primary-update-sf-dmg-area:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@fbc-psr-primary-render:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@fbchdr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@fbchdr-2p-primscrn-indfb-plflip-blt:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@fbcpsrhdr-2p-indfb-fliptrack-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@fbcpsrhdr-2p-primscrn-shrfb-msflip-blt:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@file:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@flip-basic-fastset:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@flip-vs-panning-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@full:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@getfb-reject-nv12:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@hdr-1p-offscreen-pri-shrfb-draw-render:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@hdr-1p-primscrn-shrfb-pgflip-blt:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@hdr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@hdr-rgb101010-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@intel-bb-blit-x:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@invalid-create-userspace-config:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@invalid-multi-wait-unsubmitted-submitted-signaled:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@invalid-reset-bad-pad:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@lease-get:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@lic-type-0:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@linear-max-hw-stride-32bpp-rotate-0:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@manyslice:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@mode-rejected-max-dotclock:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@multi-wait-for-submit-available-unsubmitted-signaled:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@multi-wait-for-submit-unsubmitted-submitted:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@multiplane-atomic-fence-wait:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@multiplane-rotation:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@plane-downscale-factor-0-75-with-pixel-format:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@pr-cursor-plane-update-sf:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@protected-raw-src-copy-not-readible:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@psr-1p-primscrn-spr-indfb-onoff:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@psr-2p-scndscrn-cur-indfb-draw-blt:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@psr-rgb565-draw-mmap-wc:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@psr2-primary-page-flip:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@psrhdr-2p-primscrn-cur-indfb-onoff:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@psrhdr-modesetfrombusy:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@sync_multi_consumer:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@syncobj-timeline-invalid-wait:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@uhbr-sst-direct-train:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@vm:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@wait-all-complex:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@wait-zero-handles:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@y-tiled-32bpp-rotate-180:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@256x256-top-edge:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@etime-multi-wait-all-for-submit-unsubmitted-signaled:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@implicit-read-write:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@invalid-get-no-zeromap:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@lessee-list:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@no-handle:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@plane-downscale-factor-0-5-with-modifiers:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@query-garbage:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@reset:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@signal-point-0:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@switch-modeset-ultra-joiner-big-joiner:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@yf-tiled-ccs-to-x-tiled:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_16097_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_allocator@execbuf-with-allocator:
    - shard-snb:          NOTRUN -> [SKIP][5] ([i915#17647])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb1/igt@api_intel_allocator@execbuf-with-allocator.html

  * igt@api_intel_bb@blit-noreloc-purge-cache:
    - shard-snb:          NOTRUN -> [SKIP][6] ([i915#17667])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@api_intel_bb@blit-noreloc-purge-cache.html

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#8411])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@crc32:
    - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#6230])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-14/igt@api_intel_bb@crc32.html
    - shard-snb:          NOTRUN -> [SKIP][9] ([i915#17576])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@api_intel_bb@crc32.html
    - shard-tglu:         NOTRUN -> [SKIP][10] ([i915#6230])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-8/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@delta-check:
    - shard-snb:          NOTRUN -> [SKIP][11] ([i915#17645])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb7/igt@api_intel_bb@delta-check.html

  * igt@api_intel_bb@object-noreloc-keep-cache-simple:
    - shard-snb:          NOTRUN -> [SKIP][12] ([i915#17641])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb7/igt@api_intel_bb@object-noreloc-keep-cache-simple.html

  * igt@device_reset@cold-reset-bound:
    - shard-snb:          NOTRUN -> [SKIP][13] ([i915#17620])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@device_reset@cold-reset-bound.html
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#11078])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#11078])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-4/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@dmabuf@dma-buf-fence-chain:
    - shard-glk10:        NOTRUN -> [SKIP][16] ([i915#17712])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@dmabuf@dma-buf-fence-chain.html

  * igt@drm_read@empty-nonblock:
    - shard-dg2:          [PASS][17] -> [SKIP][18] ([i915#17359]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@drm_read@empty-nonblock.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@drm_read@empty-nonblock.html

  * igt@drm_read@short-buffer-nonblock:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#17359])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@drm_read@short-buffer-nonblock.html

  * igt@fbdev@nullptr:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#2582])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@fbdev@nullptr.html

  * igt@fbdev@pan:
    - shard-dg2:          [PASS][21] -> [SKIP][22] ([i915#2582])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-5/igt@fbdev@pan.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@fbdev@pan.html

  * igt@gem_bad_reloc@negative-reloc:
    - shard-snb:          NOTRUN -> [SKIP][23] ([i915#17682])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@gem_bad_reloc@negative-reloc.html

  * igt@gem_barrier_race@remote-request:
    - shard-snb:          NOTRUN -> [SKIP][24] ([i915#17589]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@gem_barrier_race@remote-request.html

  * igt@gem_busy@semaphore:
    - shard-snb:          NOTRUN -> [SKIP][25] ([i915#17671])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-glk:          NOTRUN -> [SKIP][26] ([i915#17499])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk1/igt@gem_ccs@block-multicopy-compressed.html
    - shard-snb:          NOTRUN -> [SKIP][27] ([i915#17499])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@suspend-resume:
    - shard-glk11:        NOTRUN -> [SKIP][28] ([i915#17499])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-glk10:        NOTRUN -> [SKIP][29] ([i915#17568])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_ctx_param@get-priority-new-ctx:
    - shard-snb:          NOTRUN -> [SKIP][30] ([i915#17646])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@gem_ctx_param@get-priority-new-ctx.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-tglu:         NOTRUN -> [SKIP][31] ([i915#17444])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-5/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@engines-hang@bcs0:
    - shard-glk11:        NOTRUN -> [SKIP][32] ([i915#17527])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@gem_ctx_persistence@engines-hang@bcs0.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#8555])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#8555]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][35] ([i915#1099]) +5 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-snb:          NOTRUN -> [SKIP][36] ([i915#17621]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-glk11:        NOTRUN -> [DMESG-WARN][37] ([i915#118])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_ctx_shared@q-promotion:
    - shard-snb:          NOTRUN -> [SKIP][38] ([i915#17342]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb1/igt@gem_ctx_shared@q-promotion.html

  * igt@gem_ctx_sseu@engines:
    - shard-glk11:        NOTRUN -> [SKIP][39] ([i915#17496])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@gem_ctx_sseu@engines.html
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#280])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-4/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#280])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-14/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          [PASS][42] -> [INCOMPLETE][43] ([i915#13390] / [i915#17327])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-7/igt@gem_eio@in-flight-suspend.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@gem_eio@in-flight-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][44] ([i915#13356] / [i915#13390])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk9/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@suspend:
    - shard-rkl:          [PASS][45] -> [ABORT][46] ([i915#15131])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-8/igt@gem_eio@suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-1/igt@gem_eio@suspend.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-snb:          NOTRUN -> [SKIP][47] ([i915#17587]) +7 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#4771]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@fairslice:
    - shard-glk:          NOTRUN -> [SKIP][49] ([i915#17547])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk8/igt@gem_exec_balancer@fairslice.html

  * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
    - shard-tglu:         NOTRUN -> [SKIP][50] ([i915#4525])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-2/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-glk10:        NOTRUN -> [SKIP][51] ([i915#17547]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][52] ([i915#6334]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk9/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_fence@submit3:
    - shard-snb:          NOTRUN -> [SKIP][53] ([i915#17599]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb7/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#3539] / [i915#4852]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#3539] / [i915#4852])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_params@invalid-bsd2-flag-on-vebox:
    - shard-snb:          NOTRUN -> [SKIP][56] ([i915#17659])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb7/igt@gem_exec_params@invalid-bsd2-flag-on-vebox.html

  * igt@gem_exec_params@larger-than-life-batch:
    - shard-glk:          NOTRUN -> [SKIP][57] ([i915#16871])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk2/igt@gem_exec_params@larger-than-life-batch.html
    - shard-snb:          NOTRUN -> [SKIP][58] ([i915#17662])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb7/igt@gem_exec_params@larger-than-life-batch.html

  * igt@gem_exec_params@secure-non-master:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#17416]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@gem_exec_params@secure-non-master.html
    - shard-glk:          NOTRUN -> [SKIP][60] ([i915#17523])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk4/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_params@secure-non-root:
    - shard-glk10:        NOTRUN -> [SKIP][61] ([i915#17523])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@gem_exec_params@secure-non-root.html
    - shard-snb:          NOTRUN -> [SKIP][62] ([i915#17523])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-cpu-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#14544] / [i915#3281]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#3281]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-4/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-wc:
    - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#3281]) +5 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@gem_exec_reloc@basic-wc.html

  * igt@gem_exec_reloc@basic-wc-cpu-active:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#3281]) +4 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@gem_exec_reloc@basic-wc-cpu-active.html

  * igt@gem_exec_reloc@basic-wc-read-active:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#3281]) +6 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@gem_exec_reloc@basic-wc-read-active.html

  * igt@gem_exec_schedule@fairslice:
    - shard-snb:          NOTRUN -> [SKIP][68] ([i915#17590]) +10 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@gem_exec_schedule@fairslice.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#4537] / [i915#4812])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-5/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#7276])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_whisper@basic-contexts-priority:
    - shard-snb:          NOTRUN -> [SKIP][71] ([i915#17628])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@gem_exec_whisper@basic-contexts-priority.html

  * igt@gem_exercise_blt@fast-copy-emit:
    - shard-snb:          NOTRUN -> [SKIP][72] ([i915#17622])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@gem_exercise_blt@fast-copy-emit.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4860]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-16/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4860])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_huc_copy@huc-copy:
    - shard-glk11:        NOTRUN -> [SKIP][75] ([i915#17456])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-glk:          NOTRUN -> [SKIP][76] ([i915#17503] / [i915#4613]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk8/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#4613])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-glk11:        NOTRUN -> [SKIP][78] ([i915#17503])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#12193]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#4565]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@gem_lmem_swapping@verify-ccs@lmem0.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-snb:          NOTRUN -> [SKIP][81] ([i915#17503]) +7 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][82] ([i915#4613]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-8/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#4613]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-4/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-glk10:        NOTRUN -> [SKIP][84] ([i915#17503]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_mmap@big-bo:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4083]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-18/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@basic-write-cpu-read-gtt:
    - shard-glk10:        NOTRUN -> [SKIP][86] ([i915#17572])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#4077]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#3282]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-5/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#3282]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@snoop:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#3282]) +8 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-14/igt@gem_pread@snoop.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#4270])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-glk10:        NOTRUN -> [SKIP][92] ([i915#17521]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@gem_pxp@verify-pxp-stale-buf-execution.html
    - shard-snb:          NOTRUN -> [SKIP][93] ([i915#17521]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@gem_pxp@verify-pxp-stale-buf-execution.html
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#4270]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-18/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-rkl:          [PASS][95] -> [SKIP][96] ([i915#4270])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-5/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-4/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-glk:          NOTRUN -> [SKIP][97] ([i915#17521]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk2/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_readwrite@write-bad-handle:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#3282]) +5 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@gem_readwrite@write-bad-handle.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:
    - shard-snb:          NOTRUN -> [SKIP][99] ([i915#17591]) +5 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-snb:          NOTRUN -> [SKIP][100] ([i915#17492]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-glk:          NOTRUN -> [SKIP][101] ([i915#17492]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
    - shard-glk10:        NOTRUN -> [SKIP][102] ([i915#17492]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][103] ([i915#8428])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-8/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#5190] / [i915#8428]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#4079])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-single-offset:
    - shard-snb:          NOTRUN -> [SKIP][106] ([i915#17471]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@gem_softpin@evict-single-offset.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#4885]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@gem_softpin@evict-snoop.html
    - shard-glk:          NOTRUN -> [SKIP][108] ([i915#17551])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk1/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#17430])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-4/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_partial_pwrite_pread@reads:
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#4077]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-5/igt@gem_tiled_partial_pwrite_pread@reads.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-glk11:        NOTRUN -> [SKIP][111] ([i915#17507])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-glk:          NOTRUN -> [SKIP][112] ([i915#17507]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk2/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#3297])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-3/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
    - shard-snb:          NOTRUN -> [SKIP][114] ([i915#17507])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb7/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#3297] / [i915#4880])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#3297])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_vm_create@create-ext:
    - shard-snb:          NOTRUN -> [SKIP][117] ([i915#17596]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@gem_vm_create@create-ext.html

  * igt@gem_watchdog@default-physical:
    - shard-snb:          NOTRUN -> [SKIP][118] ([i915#17669])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@gem_watchdog@default-physical.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          NOTRUN -> [INCOMPLETE][119] ([i915#13356]) +1 other test incomplete
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk3/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen3_mixed_blits:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#17455]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@gen3_mixed_blits.html

  * igt@gen3_render_linear_blits:
    - shard-snb:          NOTRUN -> [SKIP][121] ([i915#17555])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@gen3_render_linear_blits.html
    - shard-mtlp:         NOTRUN -> [SKIP][122] ([i915#17455]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-8/igt@gen3_render_linear_blits.html
    - shard-glk:          NOTRUN -> [SKIP][123] ([i915#17555])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk1/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-snb:          NOTRUN -> [SKIP][124] ([i915#17505]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb7/igt@gen7_exec_parse@basic-offset.html
    - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#17455]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-7/igt@gen7_exec_parse@basic-offset.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-glk10:        NOTRUN -> [SKIP][126] ([i915#17505])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-glk:          NOTRUN -> [SKIP][127] ([i915#17505]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk9/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#2527])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-2/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#2527]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#2856]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-7/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#2856]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-snb:          NOTRUN -> [SKIP][132] ([i915#17597]) +5 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb1/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#2527] / [i915#2856]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-8/igt@gen9_exec_parse@unaligned-jump.html

  * igt@gpu_buddy@gpu_buddy:
    - shard-glk:          NOTRUN -> [SKIP][134] ([i915#17514])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk1/igt@gpu_buddy@gpu_buddy.html
    - shard-snb:          NOTRUN -> [SKIP][135] ([i915#17514])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@gpu_buddy@gpu_buddy.html

  * igt@i915_drm_fdinfo@all-busy-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#14123])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@i915_drm_fdinfo@all-busy-check-all.html

  * igt@i915_drm_fdinfo@busy-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#11527]) +5 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@i915_drm_fdinfo@busy-check-all.html
    - shard-snb:          NOTRUN -> [SKIP][138] ([i915#17603]) +6 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@i915_drm_fdinfo@busy-check-all.html

  * igt@i915_drm_fdinfo@virtual-busy-idle:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#14118])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@i915_drm_fdinfo@virtual-busy-idle.html

  * igt@i915_fb_tiling@basic-x-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#13786])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@i915_fb_tiling@basic-x-tiling.html

  * igt@i915_hangman@engine-engine-hang:
    - shard-snb:          NOTRUN -> [SKIP][141] ([i915#17610]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@i915_hangman@engine-engine-hang.html

  * igt@i915_module_load@fault-injection:
    - shard-snb:          NOTRUN -> [ABORT][142] ([i915#15342] / [i915#15840])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@i915_module_load@fault-injection.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#15479]) +4 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_module_load@fault-injection@i915_driver_mmio_probe:
    - shard-snb:          NOTRUN -> [DMESG-WARN][144] ([i915#17755])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-rkl:          NOTRUN -> [ABORT][145] ([i915#15342]) +1 other test abort
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@i915_module_load@fault-injection@intel_connector_register.html
    - shard-snb:          NOTRUN -> [ABORT][146] ([i915#15342])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@i915_module_load@fault-injection@intel_connector_register.html
    - shard-glk:          NOTRUN -> [ABORT][147] ([i915#15342]) +1 other test abort
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk9/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@fault-injection@intel_gt_init-enodev:
    - shard-glk:          NOTRUN -> [SKIP][148] ([i915#17600]) +4 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk9/igt@i915_module_load@fault-injection@intel_gt_init-enodev.html

  * igt@i915_module_load@fault-injection@intel_guc_ct_init:
    - shard-snb:          NOTRUN -> [SKIP][149] ([i915#17600]) +4 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@i915_module_load@fault-injection@intel_guc_ct_init.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-glk:          NOTRUN -> [SKIP][150] ([i915#17526]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk1/igt@i915_pm_freq_api@freq-reset-multiple.html
    - shard-snb:          NOTRUN -> [SKIP][151] ([i915#17526])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb7/igt@i915_pm_freq_api@freq-reset-multiple.html
    - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#8399])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-3/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [PASS][153] -> [INCOMPLETE][154] ([i915#13356] / [i915#13820]) +1 other test incomplete
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_freq_mult@media-freq:
    - shard-glk11:        NOTRUN -> [SKIP][155] ([i915#17699]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@i915_pm_freq_mult@media-freq.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-snb:          NOTRUN -> [SKIP][156] ([i915#17541])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - shard-glk:          NOTRUN -> [SKIP][157] ([i915#17541])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk4/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - shard-snb:          NOTRUN -> [SKIP][158] ([i915#17473]) +9 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb1/igt@i915_pm_rpm@debugfs-forcewake-user.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#17434] / [i915#17450])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#17434] / [i915#17450])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#11681] / [i915#6621]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-14/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          NOTRUN -> [TIMEOUT][162] ([i915#16162])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@waitboost:
    - shard-mtlp:         [PASS][163] -> [FAIL][164] ([i915#15365])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-8/igt@i915_pm_rps@waitboost.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-7/igt@i915_pm_rps@waitboost.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#7984])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-4/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-snb:          NOTRUN -> [SKIP][166] ([i915#17584])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@i915_query@hwconfig_table.html
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#6245])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-8/igt@i915_query@hwconfig_table.html
    - shard-glk10:        NOTRUN -> [SKIP][168] ([i915#17584])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-snb:          NOTRUN -> [SKIP][169] ([i915#17629])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@query-topology-unsupported:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#16079])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@i915_query@query-topology-unsupported.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-glk:          NOTRUN -> [SKIP][171] ([i915#17673])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk6/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][172] ([i915#13356] / [i915#16182] / [i915#4817])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@i915_suspend@debugfs-reader.html

  * igt@intel_hwmon@hwmon-read:
    - shard-snb:          NOTRUN -> [SKIP][173] ([i915#17674])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@intel_hwmon@hwmon-read.html
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#7707])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-3/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#4212]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#4212])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#12454] / [i915#12712])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-snb:          NOTRUN -> [SKIP][178] ([i915#17668])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-glk11:        NOTRUN -> [SKIP][179] ([i915#17668])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][180] ([i915#12761]) +1 other test incomplete
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][181] ([i915#17752]) +3 other tests dmesg-warn
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:
    - shard-glk:          NOTRUN -> [SKIP][182] ([i915#17562])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html
    - shard-snb:          NOTRUN -> [SKIP][183] ([i915#17562])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb7/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-glk11:        NOTRUN -> [SKIP][184] ([i915#17485])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#1769] / [i915#3555])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-6/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-snb:          NOTRUN -> [SKIP][186] ([i915#1769])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-glk10:        NOTRUN -> [SKIP][187] ([i915#1769])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#4538] / [i915#5286]) +2 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-glk:          NOTRUN -> [SKIP][189] ([i915#17478]) +9 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-glk11:        NOTRUN -> [SKIP][190] ([i915#17478]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#5286])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#5286])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-8/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
    - shard-glk10:        NOTRUN -> [SKIP][193] ([i915#17557])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-snb:          NOTRUN -> [SKIP][194] ([i915#17478]) +21 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-glk10:        NOTRUN -> [SKIP][195] ([i915#17478]) +4 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#4538] / [i915#5286]) +4 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#17432] / [i915#5286]) +6 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#3638]) +6 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-glk:          NOTRUN -> [SKIP][199] ([i915#17524]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#3828])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-16/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-snb:          NOTRUN -> [SKIP][201] ([i915#17524])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#3828])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-glk11:        NOTRUN -> [SKIP][203] ([i915#17500]) +2 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#17431])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#17431] / [i915#3638])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#17431]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
    - shard-glk10:        NOTRUN -> [SKIP][207] ([i915#17500]) +5 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-snb:          NOTRUN -> [SKIP][208] ([i915#17500]) +4 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#17431]) +4 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-snb:          NOTRUN -> [SKIP][210] ([i915#17557]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-snb:          NOTRUN -> [SKIP][211] ([i915#17544])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#4538] / [i915#5190]) +4 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#4538]) +3 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#14544] / [i915#4538])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#17432])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][216] ([i915#17432]) +5 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-glk:          NOTRUN -> [SKIP][217] ([i915#17500]) +8 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#4538]) +6 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_busy@basic:
    - shard-dg2:          [PASS][219] -> [SKIP][220] ([i915#11190] / [i915#17356]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_busy@basic.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_busy@basic.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [SKIP][221] ([i915#17491]) +20 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
    - shard-glk10:        NOTRUN -> [SKIP][222] ([i915#17490] / [i915#17491]) +15 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][223] ([i915#17491]) +43 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#12313]) +2 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#6095]) +151 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-16/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#6095]) +69 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][227] ([i915#17490] / [i915#17491]) +49 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][228] ([i915#6095]) +64 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#6095]) +24 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-glk:          NOTRUN -> [SKIP][230] ([i915#17525])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-snb:          NOTRUN -> [SKIP][231] ([i915#17594]) +28 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - shard-glk11:        NOTRUN -> [SKIP][232] ([i915#17490] / [i915#17491]) +5 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#12805])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#14098] / [i915#6095]) +41 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [INCOMPLETE][236] ([i915#15582])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1:
    - shard-mtlp:         [PASS][237] -> [INCOMPLETE][238] ([i915#15582])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#6095]) +15 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-rkl:          [PASS][240] -> [INCOMPLETE][241] ([i915#14694] / [i915#15582])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][242] ([i915#14694] / [i915#15582])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#12313])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#10307] / [i915#6095]) +109 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#12313])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-glk10:        NOTRUN -> [SKIP][246] ([i915#17525]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#12313] / [i915#14544])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][248] ([i915#17491]) +128 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#3742])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-2/igt@kms_cdclk@mode-transition.html
    - shard-glk10:        NOTRUN -> [SKIP][250] ([i915#17550])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#16017])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-7/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-glk:          NOTRUN -> [SKIP][252] ([i915#17550])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_cdclk@plane-scaling.html
    - shard-snb:          NOTRUN -> [SKIP][253] ([i915#17550])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#11151] / [i915#7828]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-2/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#11151] / [i915#7828]) +11 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-18/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#17427])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-8/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#17427])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-snb:          NOTRUN -> [SKIP][258] ([i915#17489]) +3 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb7/igt@kms_chamelium_color@ctm-0-75.html
    - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#17427]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-3/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-glk10:        NOTRUN -> [SKIP][260] ([i915#17489]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@gamma:
    - shard-glk:          NOTRUN -> [SKIP][261] ([i915#17489]) +3 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk3/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#17427])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
    - shard-glk10:        NOTRUN -> [SKIP][263] ([i915#17497])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
    - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#17427]) +4 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#16471] / [i915#17427]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-glk:          NOTRUN -> [SKIP][266] ([i915#17497]) +4 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk1/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html
    - shard-tglu:         NOTRUN -> [SKIP][267] ([i915#16471] / [i915#17427]) +2 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-3/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#16464] / [i915#16471] / [i915#17427])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-8/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#16471] / [i915#17427]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
    - shard-snb:          NOTRUN -> [SKIP][270] ([i915#17497]) +4 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#11151] / [i915#7828]) +3 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-glk:          NOTRUN -> [SKIP][272] ([i915#17483]) +13 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-glk10:        NOTRUN -> [SKIP][273] ([i915#17483]) +5 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-glk11:        NOTRUN -> [SKIP][274] ([i915#17483]) +2 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#11151])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-snb:          NOTRUN -> [SKIP][276] ([i915#17483]) +13 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#11151] / [i915#7828]) +8 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-2/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - shard-mtlp:         NOTRUN -> [SKIP][278] ([i915#11151] / [i915#7828]) +3 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-2/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color@background-color:
    - shard-dg2:          [PASS][279] -> [SKIP][280] ([i915#17373])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-6/igt@kms_color@background-color.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_color@background-color.html

  * igt@kms_color@ctm-0-50:
    - shard-dg2:          [PASS][281] -> [SKIP][282] ([i915#12655] / [i915#17373]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_color@ctm-0-50.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_color@ctm-0-50.html

  * igt@kms_color@deep-color:
    - shard-dg1:          NOTRUN -> [SKIP][283] ([i915#12655] / [i915#3555])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-16/igt@kms_color@deep-color.html

  * igt@kms_color@invalid-degamma-lut-sizes:
    - shard-snb:          NOTRUN -> [SKIP][284] ([i915#17656]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_color@invalid-degamma-lut-sizes.html

  * igt@kms_color@invalid-degamma-lut-sizes@pipe-a:
    - shard-snb:          NOTRUN -> [SKIP][285] ([i915#17657])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_color@invalid-degamma-lut-sizes@pipe-a.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d:
    - shard-snb:          NOTRUN -> [SKIP][286] ([i915#17510]) +7 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:
    - shard-glk10:        NOTRUN -> [SKIP][287] ([i915#17510]) +2 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d:
    - shard-dg2:          [PASS][288] -> [SKIP][289] ([i915#15529]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-5/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-glk:          NOTRUN -> [SKIP][290] ([i915#17510]) +5 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk2/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#16990]) +15 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#15529])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-4:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#16990]) +5 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-3/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-4.html

  * igt@kms_content_protection@content-type-change:
    - shard-snb:          NOTRUN -> [SKIP][294] ([i915#17508]) +2 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_content_protection@content-type-change.html
    - shard-mtlp:         NOTRUN -> [SKIP][295] ([i915#15865])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][296] ([i915#15330] / [i915#3116] / [i915#3299]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-4/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-glk11:        NOTRUN -> [SKIP][297] ([i915#17502]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-snb:          NOTRUN -> [SKIP][298] ([i915#17502])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#15330] / [i915#3116])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-glk:          NOTRUN -> [SKIP][300] ([i915#17502])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk1/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-glk10:        NOTRUN -> [SKIP][301] ([i915#17502])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#15330])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-10/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@legacy:
    - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#15865]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-glk:          NOTRUN -> [SKIP][304] ([i915#17508]) +3 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#15865]) +2 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-8/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#17356]) +15 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-glk10:        NOTRUN -> [SKIP][307] ([i915#17508])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#3555]) +2 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][309] -> [FAIL][310] ([i915#13566]) +1 other test fail
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#3555])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#13049]) +3 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#13049])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-3/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-snb:          NOTRUN -> [SKIP][314] ([i915#17504]) +4 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-mtlp:         NOTRUN -> [SKIP][315] ([i915#3555] / [i915#8814])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-glk:          NOTRUN -> [SKIP][316] ([i915#17504]) +1 other test skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk9/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-glk10:        NOTRUN -> [SKIP][317] ([i915#17504]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-glk10:        NOTRUN -> [SKIP][318] ([i915#17533])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-snb:          NOTRUN -> [SKIP][319] ([i915#17533]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-rkl:          [PASS][320] -> [FAIL][321] ([i915#13566])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [FAIL][322] ([i915#13566]) +3 other tests fail
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][323] ([i915#13566])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][324] ([i915#17428] / [i915#9809]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-5/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][325] ([i915#11190] / [i915#17356])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-tglu:         NOTRUN -> [SKIP][326] ([i915#17428] / [i915#17454]) +7 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#13046] / [i915#17454] / [i915#5354]) +2 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          NOTRUN -> [FAIL][328] ([i915#15768])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#9067])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-glk10:        NOTRUN -> [SKIP][330] ([i915#17549])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][331] ([i915#4103])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-tglu:         NOTRUN -> [SKIP][332] ([i915#4103]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-glk:          NOTRUN -> [SKIP][333] ([i915#17457])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-snb:          NOTRUN -> [SKIP][334] ([i915#17457])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-glk:          NOTRUN -> [SKIP][335] ([i915#17515])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-snb:          NOTRUN -> [SKIP][336] ([i915#17515])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-snb:          NOTRUN -> [SKIP][337] ([i915#17486]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [SKIP][338] ([i915#17487])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][339] ([i915#17486]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-tglu:         NOTRUN -> [SKIP][340] ([i915#17289])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-10/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-mtlp:         NOTRUN -> [SKIP][341] ([i915#17289])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-7/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-mtlp:         NOTRUN -> [SKIP][342] ([i915#17291])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-7/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html
    - shard-glk:          NOTRUN -> [SKIP][343] ([i915#17616])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk5/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
    - shard-dg1:          NOTRUN -> [SKIP][344] ([i915#17286])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-rkl:          NOTRUN -> [SKIP][345] ([i915#17285])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html
    - shard-tglu:         NOTRUN -> [SKIP][346] ([i915#17285]) +2 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-10/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2:          NOTRUN -> [SKIP][347] ([i915#13748])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
    - shard-glk:          NOTRUN -> [SKIP][348] ([i915#17477])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html
    - shard-snb:          NOTRUN -> [SKIP][349] ([i915#17477]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg1:          NOTRUN -> [SKIP][350] ([i915#16867])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg1:          NOTRUN -> [SKIP][351] ([i915#13707])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-16/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-tglu:         NOTRUN -> [SKIP][352] ([i915#13707])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg1:          NOTRUN -> [SKIP][353] ([i915#16361]) +5 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-14/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
    - shard-rkl:          NOTRUN -> [SKIP][354] ([i915#16361])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-glk11:        NOTRUN -> [SKIP][355] ([i915#17458])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-glk10:        NOTRUN -> [SKIP][356] ([i915#17458]) +1 other test skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-snb:          NOTRUN -> [SKIP][357] ([i915#17458]) +4 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-tglu:         NOTRUN -> [SKIP][358] ([i915#16361]) +3 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-5/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-glk:          NOTRUN -> [SKIP][359] ([i915#17458]) +3 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-dg2:          [PASS][360] -> [SKIP][361] ([i915#1849])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-5/igt@kms_fbcon_fbt@fbc.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][362] ([i915#13356] / [i915#9878])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-glk:          NOTRUN -> [SKIP][363] ([i915#17516])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk4/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][364] ([i915#16680])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-snb:          NOTRUN -> [SKIP][365] ([i915#17516]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-glk11:        NOTRUN -> [SKIP][366] ([i915#17516])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@hdr:
    - shard-glk:          NOTRUN -> [SKIP][367] ([i915#17539]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk4/igt@kms_feature_discovery@hdr.html
    - shard-dg1:          NOTRUN -> [SKIP][368] ([i915#16600])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_feature_discovery@hdr.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu:         NOTRUN -> [SKIP][369] ([i915#658])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-7/igt@kms_feature_discovery@psr2.html
    - shard-glk:          NOTRUN -> [SKIP][370] ([i915#17585])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk3/igt@kms_feature_discovery@psr2.html
    - shard-rkl:          NOTRUN -> [SKIP][371] ([i915#658])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_feature_discovery@psr2.html

  * igt@kms_feature_discovery@vrr:
    - shard-glk11:        NOTRUN -> [SKIP][372] ([i915#17539])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_feature_discovery@vrr.html
    - shard-rkl:          NOTRUN -> [SKIP][373] ([i915#16600])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-4/igt@kms_feature_discovery@vrr.html
    - shard-snb:          NOTRUN -> [SKIP][374] ([i915#17539]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][375] ([i915#3637] / [i915#9934]) +9 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][376] ([i915#8381]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-16/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][377] ([i915#3637] / [i915#9934]) +4 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-5/igt@kms_flip@2x-flip-vs-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][378] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839] / [i915#6113]) +1 other test incomplete
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk2/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][379] ([i915#12745] / [i915#13356] / [i915#17183])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk2/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][380] ([i915#9934])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-8/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][381] ([i915#9934]) +5 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-16/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-rkl:          NOTRUN -> [SKIP][382] ([i915#9934]) +3 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][383] ([i915#17358])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][384] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][385] ([i915#12745] / [i915#13356] / [i915#17183])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][386] ([i915#16276] / [i915#6113]) +1 other test incomplete
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][387] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#6113])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk3/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
    - shard-snb:          NOTRUN -> [DMESG-WARN][388] ([i915#15840] / [i915#17752])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb7/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][389] ([i915#5354])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2:          [PASS][390] -> [SKIP][391] ([i915#5354]) +6 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-6/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][392] ([i915#17484]) +2 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
    - shard-snb:          NOTRUN -> [SKIP][393] ([i915#17593]) +9 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][394] ([i915#15643]) +2 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][395] ([i915#17493])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-glk10:        NOTRUN -> [SKIP][396] ([i915#17493])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-glk11:        NOTRUN -> [SKIP][397] ([i915#17484]) +1 other test skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-dg2:          [PASS][398] -> [SKIP][399] ([i915#3555] / [i915#8813]) +1 other test skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][400] ([i915#3555] / [i915#8813])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][401] ([i915#3555] / [i915#8810] / [i915#8813]) +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode:
    - shard-glk:          NOTRUN -> [SKIP][402] ([i915#17522]) +11 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][403] ([i915#15643]) +2 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][404] ([i915#15643]) +2 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-glk11:        NOTRUN -> [SKIP][405] ([i915#17493])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][406] ([i915#3555]) +2 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking:
    - shard-snb:          NOTRUN -> [INCOMPLETE][407] ([i915#16545])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_frontbuffer_tracking.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][408] ([i915#15104] / [i915#15990]) +2 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:
    - shard-dg2:          [PASS][409] -> [SKIP][410] ([i915#16708])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-dg2:          [PASS][411] -> [SKIP][412] ([i915#16708] / [i915#5354]) +7 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-glk10:        NOTRUN -> [SKIP][413] ([i915#17559])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-snb:          NOTRUN -> [SKIP][414] ([i915#17559]) +1 other test skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][415] ([i915#17428]) +50 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][416] ([i915#15990]) +1 other test skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][417] ([i915#15104] / [i915#15990])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-rkl:          NOTRUN -> [SKIP][418] ([i915#15102]) +24 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][419] ([i915#15102]) +11 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][420] ([i915#17428] / [i915#1825]) +5 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][421] ([i915#15991] / [i915#17428] / [i915#1825]) +11 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-glk10:        NOTRUN -> [SKIP][422] ([i915#17482]) +61 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][423] ([i915#15990] / [i915#8708]) +12 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][424] ([i915#14544] / [i915#17428]) +4 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-glk11:        NOTRUN -> [SKIP][425] ([i915#17482]) +27 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][426] ([i915#17482]) +133 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-snb:          NOTRUN -> [SKIP][427] ([i915#17588]) +132 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][428] ([i915#14544] / [i915#15102]) +2 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
    - shard-snb:          NOTRUN -> [SKIP][429] ([i915#17606]) +1 other test skip
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-glk:          NOTRUN -> [SKIP][430] ([i915#17559])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][431] ([i915#5439])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][432] ([i915#15102]) +28 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][433] ([i915#15990]) +25 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][434] ([i915#17428]) +75 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][435] ([i915#15990]) +5 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][436] ([i915#15989]) +24 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][437] ([i915#15989]) +4 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][438] ([i915#17517]) +58 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk4/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-snb:          NOTRUN -> [SKIP][439] ([i915#17517]) +30 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-2p-rte:
    - shard-dg1:          NOTRUN -> [SKIP][440] ([i915#17428]) +72 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-16/igt@kms_frontbuffer_tracking@hdr-2p-rte.html

  * igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary:
    - shard-dg1:          NOTRUN -> [SKIP][441] ([i915#15989]) +14 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-16/igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][442] ([i915#15989]) +15 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite:
    - shard-rkl:          [PASS][443] -> [SKIP][444] ([i915#15989])
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][445] ([i915#13356] / [i915#16056] / [i915#16593])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk8/igt@kms_frontbuffer_tracking@hdr-suspend.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-snb:          NOTRUN -> [SKIP][446] ([i915#17534] / [i915#17588]) +1 other test skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-glk:          NOTRUN -> [SKIP][447] ([i915#17534])
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][448] ([i915#15990] / [i915#8708]) +3 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][449] ([i915#16708] / [i915#5354]) +6 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][450] ([i915#15991] / [i915#5354]) +7 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][451] ([i915#15990] / [i915#8708]) +4 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-tglu:         NOTRUN -> [SKIP][452] ([i915#15102]) +42 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][453] ([i915#15991]) +7 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][454] ([i915#16708]) +10 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-snb:          NOTRUN -> [SKIP][455] ([i915#17482]) +62 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][456] ([i915#15991] / [i915#17428]) +12 other tests skip
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-7/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][457] ([i915#15989]) +11 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-5/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-pwrite.html

  * igt@kms_getfb@getfb2-accept-nv12:
    - shard-snb:          NOTRUN -> [SKIP][458] ([i915#17658])
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_getfb@getfb2-accept-nv12.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-dg2:          NOTRUN -> [ABORT][459] ([i915#15132])
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-8/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][460] ([i915#17110])
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html

  * igt@kms_hdr@invalid-hdr:
    - shard-glk:          NOTRUN -> [SKIP][461] ([i915#17498]) +1 other test skip
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk3/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-tglu:         NOTRUN -> [SKIP][462] ([i915#3555] / [i915#8228]) +2 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-9/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][463] ([i915#12713] / [i915#16490] / [i915#3555] / [i915#8228])
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-4/igt@kms_hdr@static-toggle-dpms.html
    - shard-glk10:        NOTRUN -> [SKIP][464] ([i915#17498]) +1 other test skip
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_hdr@static-toggle-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][465] ([i915#16518] / [i915#3555] / [i915#8228])
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_hdr@static-toggle-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][466] ([i915#3555] / [i915#8228])
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][467] ([i915#16644] / [i915#3555] / [i915#8228]) +1 other test skip
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@kms_hdr@static-toggle-suspend.html
    - shard-snb:          NOTRUN -> [SKIP][468] ([i915#17498]) +2 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_hdr@static-toggle-suspend.html
    - shard-glk11:        NOTRUN -> [SKIP][469] ([i915#17498])
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@bad-hsync-end:
    - shard-dg2:          [PASS][470] -> [SKIP][471] ([i915#16746] / [i915#3555]) +1 other test skip
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-5/igt@kms_invalid_mode@bad-hsync-end.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_invalid_mode@bad-hsync-end.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][472] ([i915#15458])
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-glk:          NOTRUN -> [SKIP][473] ([i915#17575])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk8/igt@kms_joiner@basic-max-non-joiner.html
    - shard-snb:          NOTRUN -> [SKIP][474] ([i915#17575])
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][475] ([i915#15459])
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-snb:          NOTRUN -> [SKIP][476] ([i915#17567])
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][477] ([i915#15458])
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-glk10:        NOTRUN -> [SKIP][478] ([i915#17567])
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-glk11:        NOTRUN -> [SKIP][479] ([i915#17567])
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-glk:          NOTRUN -> [SKIP][480] ([i915#17617])
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-snb:          NOTRUN -> [SKIP][481] ([i915#17617])
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][482] ([i915#15638] / [i915#15722])
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-rkl:          NOTRUN -> [SKIP][483] ([i915#16451])
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-2/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-glk:          NOTRUN -> [SKIP][484] ([i915#17701])
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg1:          NOTRUN -> [SKIP][485] ([i915#15815])
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-tglu:         NOTRUN -> [SKIP][486] ([i915#15815])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-9/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][487] ([i915#6301])
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-8/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-snb:          NOTRUN -> [SKIP][488] ([i915#17540]) +3 other tests skip
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb7/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-dg1:          NOTRUN -> [SKIP][489] ([i915#17455]) +3 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-18/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-glk10:        NOTRUN -> [SKIP][490] ([i915#17540])
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
    - shard-glk:          NOTRUN -> [SKIP][491] ([i915#17540]) +2 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk3/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html
    - shard-rkl:          NOTRUN -> [SKIP][492] ([i915#17455])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-glk:          NOTRUN -> [INCOMPLETE][493] ([i915#12756] / [i915#13356] / [i915#13409] / [i915#13476] / [i915#16789])
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk5/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][494] ([i915#12756] / [i915#13356] / [i915#13409] / [i915#16789])
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html

  * igt@kms_pipe_stress@stress-xrgb8888-xtiled:
    - shard-glk10:        NOTRUN -> [DMESG-WARN][495] ([i915#118])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-tglu:         NOTRUN -> [SKIP][496] ([i915#14712])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-10/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][497] ([i915#118])
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-rkl:          NOTRUN -> [SKIP][498] ([i915#14712])
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-glk:          NOTRUN -> [SKIP][499] ([i915#17479]) +8 other tests skip
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-glk11:        NOTRUN -> [SKIP][500] ([i915#17479])
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-dg2:          [PASS][501] -> [SKIP][502] ([i915#8825])
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-5/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-tglu:         NOTRUN -> [SKIP][503] ([i915#15709]) +3 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html
    - shard-mtlp:         NOTRUN -> [SKIP][504] ([i915#15709]) +1 other test skip
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][505] ([i915#16386]) +3 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-glk10:        NOTRUN -> [SKIP][506] ([i915#17479])
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-dg2:          NOTRUN -> [SKIP][507] ([i915#15709]) +2 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-4:
    - shard-glk:          NOTRUN -> [SKIP][508] ([i915#17494]) +1 other test skip
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk4/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-4.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][509] ([i915#15709]) +4 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-18/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][510] ([i915#16386]) +1 other test skip
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:
    - shard-tglu:         NOTRUN -> [SKIP][511] ([i915#16386]) +1 other test skip
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-10/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][512] ([i915#15709]) +2 other tests skip
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-snb:          NOTRUN -> [SKIP][513] ([i915#17479]) +9 other tests skip
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-4:
    - shard-glk11:        NOTRUN -> [SKIP][514] ([i915#17494]) +1 other test skip
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-4.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-4:
    - shard-glk10:        NOTRUN -> [SKIP][515] ([i915#17494]) +3 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-4.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-glk10:        NOTRUN -> [SKIP][516] ([i915#17700])
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html
    - shard-dg1:          NOTRUN -> [SKIP][517] ([i915#16112])
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][518] ([i915#10647] / [i915#12177])
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-snb:          NOTRUN -> [SKIP][519] ([i915#17595]) +1 other test skip
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb7/igt@kms_plane_alpha_blend@constant-alpha-max.html
    - shard-glk:          NOTRUN -> [FAIL][520] ([i915#10647] / [i915#12169])
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk1/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][521] ([i915#10647]) +3 other tests fail
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk1/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-snb:          NOTRUN -> [SKIP][522] ([i915#17509])
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_plane_lowres@tiling-4.html
    - shard-glk10:        NOTRUN -> [SKIP][523] ([i915#17509])
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-snb:          NOTRUN -> [SKIP][524] ([i915#17586])
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_plane_multiple@2x-tiling-4.html
    - shard-mtlp:         NOTRUN -> [SKIP][525] ([i915#13958])
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-7/igt@kms_plane_multiple@2x-tiling-4.html
    - shard-glk:          NOTRUN -> [SKIP][526] ([i915#17586])
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk8/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-tglu:         NOTRUN -> [SKIP][527] ([i915#13958])
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-2/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][528] ([i915#13958])
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][529] ([i915#14259])
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-4/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg1:          NOTRUN -> [SKIP][530] ([i915#14259]) +1 other test skip
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-18/igt@kms_plane_multiple@tiling-yf.html
    - shard-snb:          NOTRUN -> [SKIP][531] ([i915#17542])
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> [SKIP][532] ([i915#6953] / [i915#9423])
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@invalid-parameters:
    - shard-dg2:          [PASS][533] -> [SKIP][534] ([i915#17356] / [i915#9423])
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-6/igt@kms_plane_scaling@invalid-parameters.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_plane_scaling@invalid-parameters.html
    - shard-snb:          NOTRUN -> [SKIP][535] ([i915#17626])
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_plane_scaling@invalid-parameters.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-dg2:          [PASS][536] -> [SKIP][537] ([i915#15329] / [i915#17356] / [i915#9423]) +1 other test skip
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][538] ([i915#15329]) +12 other tests skip
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:
    - shard-glk:          NOTRUN -> [SKIP][539] ([i915#17528]) +5 other tests skip
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:
    - shard-snb:          NOTRUN -> [SKIP][540] ([i915#17528] / [i915#17529]) +1 other test skip
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-tglu:         NOTRUN -> [SKIP][541] ([i915#15329]) +4 other tests skip
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:
    - shard-dg2:          NOTRUN -> [SKIP][542] ([i915#15329] / [i915#17356] / [i915#9423])
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][543] ([i915#15329]) +2 other tests skip
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][544] ([i915#15329] / [i915#17356])
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-glk:          NOTRUN -> [SKIP][545] ([i915#17529]) +5 other tests skip
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][546] ([i915#15329]) +3 other tests skip
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-mtlp:         NOTRUN -> [SKIP][547] ([i915#15329] / [i915#6953])
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-dg2:          [PASS][548] -> [SKIP][549] ([i915#15329] / [i915#17356] / [i915#6953] / [i915#9423])
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][550] ([i915#15329] / [i915#3555] / [i915#6953])
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b:
    - shard-snb:          NOTRUN -> [SKIP][551] ([i915#17528]) +9 other tests skip
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-dg2:          [PASS][552] -> [SKIP][553] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#6953] / [i915#9423]) +1 other test skip
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c:
    - shard-dg2:          [PASS][554] -> [SKIP][555] ([i915#15329]) +14 other tests skip
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a:
    - shard-snb:          NOTRUN -> [SKIP][556] ([i915#17529]) +5 other tests skip
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:
    - shard-dg2:          [PASS][557] -> [SKIP][558] ([i915#15329] / [i915#17356]) +4 other tests skip
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2:          NOTRUN -> [SKIP][559] ([i915#12343] / [i915#5354])
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-snb:          NOTRUN -> [SKIP][560] ([i915#17462])
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_pm_backlight@fade.html
    - shard-glk:          NOTRUN -> [SKIP][561] ([i915#17462])
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_pm_backlight@fade.html
    - shard-dg1:          NOTRUN -> [SKIP][562] ([i915#12343] / [i915#5354])
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-16/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][563] ([i915#12343] / [i915#5354]) +1 other test skip
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-2/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-snb:          NOTRUN -> [SKIP][564] ([i915#17602]) +1 other test skip
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_pm_dc@dc5-dpms-negative.html
    - shard-dg2:          [PASS][565] -> [SKIP][566] ([i915#13441])
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-3/igt@kms_pm_dc@dc5-dpms-negative.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-rkl:          [PASS][567] -> [INCOMPLETE][568] ([i915#16943])
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-5/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-3/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-glk:          NOTRUN -> [SKIP][569] ([i915#17495])
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk2/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2:          NOTRUN -> [SKIP][570] ([i915#15948])
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_pm_dc@dc6-psr.html
    - shard-dg1:          NOTRUN -> [SKIP][571] ([i915#15948])
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-glk:          NOTRUN -> [SKIP][572] ([i915#17703])
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk4/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          [PASS][573] -> [SKIP][574] ([i915#9340])
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg1:          NOTRUN -> [SKIP][575] ([i915#4077]) +8 other tests skip
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg1:          [PASS][576] -> [SKIP][577] ([i915#15073])
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg1-15/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-mtlp:         NOTRUN -> [SKIP][578] ([i915#15073])
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2:          [PASS][579] -> [SKIP][580] ([i915#17446] / [i915#3547])
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-5/igt@kms_pm_rpm@drm-resources-equal.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          [PASS][581] -> [SKIP][582] ([i915#17446])
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-6/igt@kms_pm_rpm@i2c.html
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][583] ([i915#15073]) +2 other tests skip
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [PASS][584] -> [SKIP][585] ([i915#15073])
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2:          NOTRUN -> [SKIP][586] ([i915#15073])
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-glk:          NOTRUN -> [SKIP][587] ([i915#17710])
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_pm_rpm@pc8-residency.html
    - shard-mtlp:         NOTRUN -> [SKIP][588] ([i915#17450])
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-6/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][589] ([i915#14419])
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-glk11:        NOTRUN -> [SKIP][590] ([i915#17569])
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_prime@basic-modeset-hybrid.html
    - shard-rkl:          NOTRUN -> [SKIP][591] ([i915#6524])
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-4/igt@kms_prime@basic-modeset-hybrid.html
    - shard-snb:          NOTRUN -> [SKIP][592] ([i915#17569]) +1 other test skip
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-glk:          NOTRUN -> [SKIP][593] ([i915#17569]) +1 other test skip
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk3/igt@kms_prime@d3hot.html

  * igt@kms_properties@colorop-properties-atomic:
    - shard-dg2:          [PASS][594] -> [SKIP][595] ([i915#15347])
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@kms_properties@colorop-properties-atomic.html
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_properties@colorop-properties-atomic.html
    - shard-glk10:        NOTRUN -> [SKIP][596] ([i915#17481])
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_properties@colorop-properties-atomic.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][597] ([i915#11520]) +10 other tests skip
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][598] ([i915#11520]) +3 other tests skip
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-glk10:        NOTRUN -> [SKIP][599] ([i915#11520]) +4 other tests skip
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][600] ([i915#9808])
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][601] ([i915#12316]) +3 other tests skip
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-glk11:        NOTRUN -> [SKIP][602] ([i915#11520]) +2 other tests skip
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][603] ([i915#11520]) +12 other tests skip
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk9/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
    - shard-rkl:          NOTRUN -> [SKIP][604] ([i915#11520]) +3 other tests skip
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][605] ([i915#11520]) +13 other tests skip
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][606] ([i915#11520]) +14 other tests skip
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglu:         NOTRUN -> [SKIP][607] ([i915#9683])
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-9/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg1:          NOTRUN -> [SKIP][608] ([i915#9683])
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-snb:          NOTRUN -> [SKIP][609] ([i915#17546])
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-glk10:        NOTRUN -> [SKIP][610] ([i915#17546]) +1 other test skip
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-mtlp:         NOTRUN -> [SKIP][611] ([i915#9688]) +3 other tests skip
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-render:
    - shard-glk10:        NOTRUN -> [SKIP][612] ([i915#17480]) +12 other tests skip
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_psr@fbc-psr2-cursor-render.html

  * igt@kms_psr@fbc-psr2-primary-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][613] ([i915#9732]) +17 other tests skip
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-9/igt@kms_psr@fbc-psr2-primary-mmap-gtt.html

  * igt@kms_psr@pr-basic:
    - shard-glk:          NOTRUN -> [SKIP][614] ([i915#17480]) +20 other tests skip
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_psr@pr-basic.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-snb:          NOTRUN -> [SKIP][615] ([i915#17480]) +25 other tests skip
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb7/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][616] ([i915#1072] / [i915#9732]) +4 other tests skip
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][617] ([i915#1072] / [i915#9732]) +9 other tests skip
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-3/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][618] ([i915#1072] / [i915#9732]) +20 other tests skip
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr@psr2-suspend:
    - shard-glk11:        NOTRUN -> [SKIP][619] ([i915#17480]) +4 other tests skip
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][620] ([i915#14544] / [i915#15949])
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-tglu:         NOTRUN -> [SKIP][621] ([i915#15949])
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-glk:          NOTRUN -> [SKIP][622] ([i915#17554]) +1 other test skip
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk9/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-snb:          NOTRUN -> [SKIP][623] ([i915#17554])
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-snb:          NOTRUN -> [SKIP][624] ([i915#17676])
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_rotation_crc@exhaust-fences.html
    - shard-dg1:          NOTRUN -> [SKIP][625] ([i915#4884])
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-glk:          NOTRUN -> [INCOMPLETE][626] ([i915#15500] / [i915#16184])
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-dg1:          NOTRUN -> [SKIP][627] ([i915#5289])
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-mtlp:         NOTRUN -> [SKIP][628] ([i915#15867]) +1 other test skip
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-8/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-glk11:        NOTRUN -> [SKIP][629] ([i915#17488])
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2:          NOTRUN -> [SKIP][630] ([i915#5190])
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-glk:          NOTRUN -> [SKIP][631] ([i915#17488]) +1 other test skip
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-glk10:        NOTRUN -> [SKIP][632] ([i915#17488]) +1 other test skip
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][633] ([i915#17432] / [i915#5289])
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-tglu:         NOTRUN -> [SKIP][634] ([i915#17432] / [i915#5289])
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-snb:          NOTRUN -> [SKIP][635] ([i915#17488]) +3 other tests skip
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-glk:          NOTRUN -> [SKIP][636] ([i915#17501])
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk5/igt@kms_scaling_modes@scaling-mode-center.html
    - shard-snb:          NOTRUN -> [SKIP][637] ([i915#17501])
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-dg1:          NOTRUN -> [ABORT][638] ([i915#13179] / [i915#16508]) +1 other test abort
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-18/igt@kms_selftest@drm_framebuffer.html
    - shard-snb:          NOTRUN -> [ABORT][639] ([i915#13179]) +1 other test abort
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb7/igt@kms_selftest@drm_framebuffer.html
    - shard-glk:          NOTRUN -> [ABORT][640] ([i915#13179]) +1 other test abort
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk1/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic:
    - shard-dg2:          [PASS][641] -> [SKIP][642] ([i915#3555])
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_setmode@basic.html
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-glk:          NOTRUN -> [SKIP][643] ([i915#17463])
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk8/igt@kms_setmode@invalid-clone-exclusive-crtc.html
    - shard-snb:          NOTRUN -> [SKIP][644] ([i915#17604])
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb7/igt@kms_setmode@invalid-clone-exclusive-crtc.html
    - shard-mtlp:         NOTRUN -> [SKIP][645] ([i915#3555] / [i915#8809] / [i915#8823])
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-dg1:          NOTRUN -> [SKIP][646] ([i915#3555]) +3 other tests skip
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2:          NOTRUN -> [SKIP][647] ([i915#17445])
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2:          [PASS][648] -> [SKIP][649] ([i915#17356]) +53 other tests skip
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-5/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][650] ([i915#12276] / [i915#13356]) +1 other test incomplete
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk4/igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-1.html

  * igt@kms_vrr@flip-basic:
    - shard-glk11:        NOTRUN -> [SKIP][651] ([i915#17520])
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flipline:
    - shard-glk10:        NOTRUN -> [SKIP][652] ([i915#17520])
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-dg1:          NOTRUN -> [SKIP][653] ([i915#11920])
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-glk:          NOTRUN -> [SKIP][654] ([i915#17520])
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-dg1:          NOTRUN -> [SKIP][655] ([i915#9906])
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-snb:          NOTRUN -> [SKIP][656] ([i915#17520])
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          NOTRUN -> [SKIP][657] ([i915#9906])
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-4/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@perf@gen12-group-exclusive-stream-sample-oa:
    - shard-glk:          NOTRUN -> [SKIP][658] ([i915#17536])
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk1/igt@perf@gen12-group-exclusive-stream-sample-oa.html

  * igt@perf@gen12-oa-tlb-invalidate:
    - shard-glk10:        NOTRUN -> [SKIP][659] ([i915#17536])
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@perf@gen12-oa-tlb-invalidate.html

  * igt@perf@mi-rpc:
    - shard-dg1:          NOTRUN -> [SKIP][660] ([i915#2434])
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@perf@mi-rpc.html
    - shard-snb:          NOTRUN -> [SKIP][661] ([i915#17592]) +10 other tests skip
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@perf@mi-rpc.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-glk:          NOTRUN -> [SKIP][662] ([i915#17704]) +1 other test skip
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk1/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy-double-start@vecs0:
    - shard-mtlp:         [PASS][663] -> [FAIL][664] ([i915#4349])
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-8/igt@perf_pmu@busy-double-start@vecs0.html
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-7/igt@perf_pmu@busy-double-start@vecs0.html

  * igt@perf_pmu@enable-race@bcs0:
    - shard-snb:          NOTRUN -> [SKIP][665] ([i915#17638]) +1 other test skip
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb7/igt@perf_pmu@enable-race@bcs0.html

  * igt@perf_pmu@enable-race@vcs0:
    - shard-snb:          NOTRUN -> [SKIP][666] ([i915#17637]) +3 other tests skip
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb7/igt@perf_pmu@enable-race@vcs0.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-rkl:          NOTRUN -> [SKIP][667] ([i915#17416]) +1 other test skip
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-2/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          NOTRUN -> [FAIL][668] ([i915#17119])
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-glk:          NOTRUN -> [SKIP][669] ([i915#17583])
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk9/igt@perf_pmu@rc6-all-gts.html
    - shard-snb:          NOTRUN -> [SKIP][670] ([i915#17583])
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6-suspend:
    - shard-snb:          NOTRUN -> [ABORT][671] ([i915#15840]) +11 other tests abort
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb1/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-glk10:        NOTRUN -> [SKIP][672] ([i915#17583])
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk10/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-dg2:          NOTRUN -> [SKIP][673] ([i915#8516])
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@perf_pmu@semaphore-busy@bcs0:
    - shard-snb:          NOTRUN -> [SKIP][674] ([i915#17683]) +1 other test skip
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@perf_pmu@semaphore-busy@bcs0.html

  * igt@prime_udl@share-import:
    - shard-snb:          NOTRUN -> [SKIP][675] ([i915#16420])
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb6/igt@prime_udl@share-import.html

  * igt@prime_udl@share-import-addfb:
    - shard-glk:          NOTRUN -> [SKIP][676] ([i915#16420])
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk6/igt@prime_udl@share-import-addfb.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg1:          NOTRUN -> [SKIP][677] ([i915#3708] / [i915#4077])
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-14/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-glk:          NOTRUN -> [SKIP][678] ([i915#17467]) +1 other test skip
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk6/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-snb:          NOTRUN -> [SKIP][679] ([i915#17467])
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@prime_vgem@fence-read-hang.html
    - shard-tglu:         NOTRUN -> [SKIP][680] ([i915#17448])
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-3/igt@prime_vgem@fence-read-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][681] ([i915#3708])
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-8/igt@prime_vgem@fence-read-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-glk11:        NOTRUN -> [SKIP][682] ([i915#17467])
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk11/igt@prime_vgem@fence-write-hang.html

  * igt@sysfs_preempt_timeout@timeout:
    - shard-snb:          NOTRUN -> [SKIP][683] ([i915#17631]) +1 other test skip
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@sysfs_preempt_timeout@timeout.html

  * igt@sysfs_timeslice_duration@idempotent@vcs0:
    - shard-snb:          NOTRUN -> [SKIP][684] ([i915#17632]) +13 other tests skip
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb4/igt@sysfs_timeslice_duration@idempotent@vcs0.html

  
#### Possible fixes ####

  * igt@drm_read@short-buffer-wakeup:
    - shard-dg2:          [SKIP][685] ([i915#17359]) -> [PASS][686]
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@drm_read@short-buffer-wakeup.html
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@drm_read@short-buffer-wakeup.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [INCOMPLETE][687] ([i915#13356] / [i915#16348]) -> [PASS][688] +1 other test pass
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@gem_ccs@suspend-resume.html
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-8/igt@gem_ccs@suspend-resume.html

  * igt@gem_eio@hibernate:
    - shard-mtlp:         [INCOMPLETE][689] ([i915#17190] / [i915#7975]) -> [PASS][690]
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-4/igt@gem_eio@hibernate.html
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-5/igt@gem_eio@hibernate.html

  * igt@gem_eio@in-flight-suspend:
    - shard-mtlp:         [INCOMPLETE][691] ([i915#17190]) -> [PASS][692]
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-7/igt@gem_eio@in-flight-suspend.html
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-4/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [FAIL][693] ([i915#15816]) -> [PASS][694]
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-tglu-2/igt@gem_exec_big@single.html
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-3/igt@gem_exec_big@single.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-rkl:          [SKIP][695] ([i915#4270]) -> [PASS][696] +1 other test pass
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-dg2:          [FAIL][697] ([i915#12964]) -> [PASS][698] +1 other test pass
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-5/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          [INCOMPLETE][699] ([i915#13356] / [i915#15172]) -> [PASS][700]
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-glk4/igt@i915_pm_rpm@system-suspend-execbuf.html
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk4/igt@i915_pm_rpm@system-suspend-execbuf.html
    - shard-rkl:          [INCOMPLETE][701] ([i915#13356]) -> [PASS][702]
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@i915_pm_rpm@system-suspend-execbuf.html
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [SKIP][703] ([i915#7984]) -> [PASS][704]
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-6/igt@i915_power@sanity.html
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-6/igt@i915_power@sanity.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-mtlp:         [INCOMPLETE][705] ([i915#17037]) -> [PASS][706] +1 other test pass
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-3/igt@kms_async_flips@async-flip-suspend-resume.html
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-5/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1:
    - shard-mtlp:         [FAIL][707] ([i915#17150]) -> [PASS][708]
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1.html
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-5/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1.html

  * igt@kms_atomic_interruptible@atomic-setmode:
    - shard-dg2:          [SKIP][709] ([i915#17356]) -> [PASS][710] +41 other tests pass
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_atomic_interruptible@atomic-setmode.html
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_atomic_interruptible@atomic-setmode.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         [INCOMPLETE][711] ([i915#15582]) -> [PASS][712]
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-mtlp:         [FAIL][713] ([i915#17158]) -> [PASS][714] +1 other test pass
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_color@degamma:
    - shard-dg2:          [SKIP][715] ([i915#12655] / [i915#17373]) -> [PASS][716]
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_color@degamma.html
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_color@degamma.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:
    - shard-dg2:          [SKIP][717] ([i915#15529]) -> [PASS][718] +3 other tests pass
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-tglu:         [FAIL][719] ([i915#13566]) -> [PASS][720] +1 other test pass
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-tglu-10/igt@kms_cursor_crc@cursor-random-64x21.html
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-9/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglu:         [ABORT][721] ([i915#15840]) -> [PASS][722] +1 other test pass
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-tglu-8/igt@kms_fbcon_fbt@fbc-suspend.html
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-9/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2:          [SKIP][723] ([i915#5354]) -> [PASS][724] +6 other tests pass
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg2:          [SKIP][725] ([i915#3555] / [i915#8813]) -> [PASS][726] +3 other tests pass
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
    - shard-dg2:          [SKIP][727] ([i915#16708]) -> [PASS][728]
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2:          [SKIP][729] ([i915#16708] / [i915#5354]) -> [PASS][730] +6 other tests pass
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:
    - shard-rkl:          [SKIP][731] ([i915#15989]) -> [PASS][732] +1 other test pass
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-glk:          [SKIP][733] ([i915#17517]) -> [PASS][734] +4 other tests pass
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-glk2/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-cpu.html
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:
    - shard-dg2:          [SKIP][735] ([i915#17357]) -> [PASS][736]
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-mtlp:         [INCOMPLETE][737] ([i915#17319]) -> [PASS][738] +1 other test pass
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-4/igt@kms_hdr@bpc-switch-suspend.html
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-8/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_invalid_mode@bad-vsync-end:
    - shard-dg2:          [SKIP][739] ([i915#16746] / [i915#3555]) -> [PASS][740] +3 other tests pass
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_invalid_mode@bad-vsync-end.html
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_invalid_mode@bad-vsync-end.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - shard-dg2:          [SKIP][741] ([i915#11190] / [i915#17356]) -> [PASS][742] +1 other test pass
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
    - shard-dg2:          [SKIP][743] ([i915#8825]) -> [PASS][744] +2 other tests pass
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d:
    - shard-dg2:          [SKIP][745] ([i915#15329] / [i915#17356]) -> [PASS][746] +3 other tests pass
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-dg2:          [SKIP][747] ([i915#15329] / [i915#17356] / [i915#9423]) -> [PASS][748] +2 other tests pass
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - shard-dg2:          [SKIP][749] ([i915#15329] / [i915#17356] / [i915#6953] / [i915#9423]) -> [PASS][750]
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20.html
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-20x20.html

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-b:
    - shard-dg2:          [SKIP][751] ([i915#15329]) -> [PASS][752] +11 other tests pass
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20@pipe-b.html
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-20x20@pipe-b.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [SKIP][753] ([i915#15073]) -> [PASS][754]
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_pm_rpm@dpms-lpsp.html
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg1:          [SKIP][755] ([i915#15073]) -> [PASS][756]
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg1-19/igt@kms_pm_rpm@modeset-lpsp.html
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [SKIP][757] ([i915#14544] / [i915#15073]) -> [PASS][758]
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [SKIP][759] ([i915#15073]) -> [PASS][760] +2 other tests pass
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp.html
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-dg2:          [SKIP][761] ([i915#9519]) -> [PASS][762]
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-dg2:          [SKIP][763] ([i915#11521]) -> [PASS][764] +1 other test pass
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_properties@plane-properties-legacy.html
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_properties@plane-properties-legacy.html

  * igt@perf@polling:
    - shard-dg2:          [FAIL][765] ([i915#10538]) -> [PASS][766] +1 other test pass
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@perf@polling.html
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-8/igt@perf@polling.html

  * igt@perf@polling@1-vcs1:
    - shard-mtlp:         [FAIL][767] ([i915#10538]) -> [PASS][768] +1 other test pass
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-5/igt@perf@polling@1-vcs1.html
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-6/igt@perf@polling@1-vcs1.html

  * igt@perf_pmu@rc6:
    - shard-tglu:         [WARN][769] ([i915#17771]) -> [PASS][770]
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-tglu-9/igt@perf_pmu@rc6.html
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-2/igt@perf_pmu@rc6.html

  * igt@perf_pmu@rc6@runtime-pm-long-gt0:
    - shard-tglu:         [SKIP][771] ([i915#17771]) -> [PASS][772] +1 other test pass
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-tglu-9/igt@perf_pmu@rc6@runtime-pm-long-gt0.html
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-2/igt@perf_pmu@rc6@runtime-pm-long-gt0.html

  
#### Warnings ####

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          [SKIP][773] ([i915#3555] / [i915#9323]) -> [SKIP][774] ([i915#14544] / [i915#3555] / [i915#9323])
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-7/igt@gem_ccs@block-copy-compressed.html
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          [SKIP][775] ([i915#280]) -> [SKIP][776] ([i915#14544] / [i915#280])
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-2/igt@gem_ctx_sseu@invalid-sseu.html
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-rkl:          [SKIP][777] ([i915#4525]) -> [SKIP][778] ([i915#14544] / [i915#4525])
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_reloc@basic-cpu-gtt:
    - shard-rkl:          [SKIP][779] ([i915#3281]) -> [SKIP][780] ([i915#14544] / [i915#3281])
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-7/igt@gem_exec_reloc@basic-cpu-gtt.html
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-gtt.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-rkl:          [SKIP][781] ([i915#14544] / [i915#3281]) -> [SKIP][782] ([i915#3281]) +3 other tests skip
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-active.html
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-4/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-rkl:          [ABORT][783] ([i915#15131] / [i915#15542]) -> [INCOMPLETE][784] ([i915#13356]) +1 other test incomplete
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-1/igt@gem_exec_suspend@basic-s3.html
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-3/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          [SKIP][785] ([i915#14544] / [i915#2190]) -> [SKIP][786] ([i915#2190])
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@gem_huc_copy@huc-copy.html
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-rkl:          [SKIP][787] ([i915#4613]) -> [SKIP][788] ([i915#14544] / [i915#4613])
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-8/igt@gem_lmem_swapping@verify-random-ccs.html
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-rkl:          [SKIP][789] ([i915#14544] / [i915#3282]) -> [SKIP][790] ([i915#3282]) +1 other test skip
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@gem_madvise@dontneed-before-pwrite.html
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-4/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_pread@exhaustion:
    - shard-rkl:          [SKIP][791] ([i915#3282]) -> [SKIP][792] ([i915#14544] / [i915#3282])
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-4/igt@gem_pread@exhaustion.html
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@gem_pread@exhaustion.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-rkl:          [SKIP][793] ([i915#14544] / [i915#17433] / [i915#3297]) -> [SKIP][794] ([i915#17433] / [i915#3297])
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@gem_userptr_blits@coherency-sync.html
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          [SKIP][795] ([i915#14544] / [i915#3297]) -> [SKIP][796] ([i915#3297])
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@gem_userptr_blits@coherency-unsync.html
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-rkl:          [SKIP][797] ([i915#17455]) -> [SKIP][798] ([i915#14544] / [i915#17455]) +2 other tests skip
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-8/igt@gen7_exec_parse@chained-batch.html
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-rkl:          [SKIP][799] ([i915#14544] / [i915#2527]) -> [SKIP][800] ([i915#2527])
   [799]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@gen9_exec_parse@basic-rejected-ctx-param.html
   [800]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          [SKIP][801] ([i915#8399]) -> [SKIP][802] ([i915#14544] / [i915#8399])
   [801]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-8/igt@i915_pm_freq_api@freq-reset-multiple.html
   [802]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          [SKIP][803] ([i915#14544] / [i915#16080] / [i915#16166]) -> [SKIP][804] ([i915#16080] / [i915#16166])
   [803]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
   [804]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          [SKIP][805] ([i915#17356]) -> [SKIP][806] ([i915#1769] / [i915#3555])
   [805]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [806]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-rkl:          [SKIP][807] ([i915#14544] / [i915#1769] / [i915#3555]) -> [SKIP][808] ([i915#1769] / [i915#3555])
   [807]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [808]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-dg2:          [SKIP][809] ([i915#17356]) -> [SKIP][810] ([i915#17431])
   [809]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [810]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-rkl:          [SKIP][811] ([i915#14544] / [i915#4538] / [i915#5286]) -> [SKIP][812] ([i915#4538] / [i915#5286]) +2 other tests skip
   [811]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [812]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-rkl:          [SKIP][813] ([i915#4538] / [i915#5286]) -> [SKIP][814] ([i915#14544] / [i915#4538] / [i915#5286])
   [813]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
   [814]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2:          [SKIP][815] ([i915#17356]) -> [SKIP][816] ([i915#3828])
   [815]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [816]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2:          [SKIP][817] ([i915#17431]) -> [SKIP][818] ([i915#17356]) +1 other test skip
   [817]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [818]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-dg2:          [SKIP][819] ([i915#17356] / [i915#5190]) -> [SKIP][820] ([i915#4538] / [i915#5190]) +2 other tests skip
   [819]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
   [820]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-8/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          [SKIP][821] ([i915#4538] / [i915#5190]) -> [SKIP][822] ([i915#17356] / [i915#5190]) +8 other tests skip
   [821]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [822]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          [SKIP][823] ([i915#17356] / [i915#5190]) -> [SKIP][824] ([i915#5190]) +3 other tests skip
   [823]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [824]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2:          [SKIP][825] ([i915#5190]) -> [SKIP][826] ([i915#17356] / [i915#5190])
   [825]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [826]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][827] ([i915#4538]) -> [SKIP][828] ([i915#14544] / [i915#4538]) +1 other test skip
   [827]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [828]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-rkl:          [SKIP][829] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][830] ([i915#14098] / [i915#6095]) +5 other tests skip
   [829]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [830]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-dg2:          [SKIP][831] ([i915#17356]) -> [SKIP][832] ([i915#10307] / [i915#6095]) +9 other tests skip
   [831]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [832]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2:          [SKIP][833] ([i915#10307] / [i915#6095]) -> [SKIP][834] ([i915#17356]) +5 other tests skip
   [833]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-5/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [834]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][835] ([i915#12313]) -> [SKIP][836] ([i915#12313] / [i915#14544])
   [835]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [836]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          [SKIP][837] ([i915#12313]) -> [SKIP][838] ([i915#17356])
   [837]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [838]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2:          [SKIP][839] ([i915#12805]) -> [SKIP][840] ([i915#17356])
   [839]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [840]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-mtlp:         [ABORT][841] ([i915#17345]) -> [INCOMPLETE][842] ([i915#15582])
   [841]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [842]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2:          [SKIP][843] ([i915#6095]) -> [SKIP][844] ([i915#17356]) +1 other test skip
   [843]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [844]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-edp-1:
    - shard-mtlp:         [ABORT][845] ([i915#17345]) -> [FAIL][846] ([i915#17158])
   [845]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-edp-1.html
   [846]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2:          [SKIP][847] ([i915#17356]) -> [SKIP][848] ([i915#6095])
   [847]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [848]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2:          [SKIP][849] ([i915#17356]) -> [SKIP][850] ([i915#12313])
   [849]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [850]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][851] ([i915#14544] / [i915#6095]) -> [SKIP][852] ([i915#6095]) +3 other tests skip
   [851]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html
   [852]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][853] ([i915#6095]) -> [SKIP][854] ([i915#14544] / [i915#6095]) +1 other test skip
   [853]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-2.html
   [854]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][855] ([i915#14098] / [i915#6095]) -> [SKIP][856] ([i915#14098] / [i915#14544] / [i915#6095]) +1 other test skip
   [855]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-2.html
   [856]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg2:          [SKIP][857] ([i915#13781]) -> [SKIP][858] ([i915#17356])
   [857]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_cdclk@mode-transition.html
   [858]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-rkl:          [SKIP][859] ([i915#17427]) -> [SKIP][860] ([i915#14544] / [i915#17427]) +3 other tests skip
   [859]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-3/igt@kms_chamelium_color@ctm-red-to-blue.html
   [860]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@gamma:
    - shard-rkl:          [SKIP][861] ([i915#14544] / [i915#17427]) -> [SKIP][862] ([i915#17427]) +2 other tests skip
   [861]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_chamelium_color@gamma.html
   [862]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-rkl:          [SKIP][863] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][864] ([i915#11151] / [i915#7828])
   [863]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_chamelium_frames@dp-crc-fast.html
   [864]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-rkl:          [SKIP][865] ([i915#11151] / [i915#7828]) -> [SKIP][866] ([i915#11151] / [i915#14544] / [i915#7828]) +3 other tests skip
   [865]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-8/igt@kms_chamelium_frames@hdmi-crc-multiple.html
   [866]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:
    - shard-rkl:          [SKIP][867] ([i915#11151] / [i915#14544]) -> [SKIP][868] ([i915#11151])
   [867]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html
   [868]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2:          [SKIP][869] ([i915#15865]) -> [SKIP][870] ([i915#17356]) +3 other tests skip
   [869]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-5/igt@kms_content_protection@content-type-change.html
   [870]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2:          [SKIP][871] ([i915#15330] / [i915#3299]) -> [SKIP][872] ([i915#17356])
   [871]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@kms_content_protection@dp-mst-type-0.html
   [872]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2:          [SKIP][873] ([i915#17356]) -> [SKIP][874] ([i915#15330] / [i915#3299])
   [873]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_content_protection@dp-mst-type-1.html
   [874]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-rkl:          [SKIP][875] ([i915#15330]) -> [SKIP][876] ([i915#14544] / [i915#15330])
   [875]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-8/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
   [876]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@lic-type-0-hdcp14:
    - shard-dg2:          [SKIP][877] ([i915#17356]) -> [SKIP][878] ([i915#15865])
   [877]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_content_protection@lic-type-0-hdcp14.html
   [878]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_content_protection@lic-type-0-hdcp14.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          [SKIP][879] ([i915#14544] / [i915#15865]) -> [SKIP][880] ([i915#15865]) +1 other test skip
   [879]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_content_protection@mei-interface.html
   [880]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-dg2:          [SKIP][881] ([i915#17356]) -> [SKIP][882] ([i915#3555]) +4 other tests skip
   [881]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_cursor_crc@cursor-offscreen-32x10.html
   [882]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-rkl:          [SKIP][883] ([i915#13049] / [i915#14544]) -> [SKIP][884] ([i915#13049])
   [883]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [884]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2:          [SKIP][885] ([i915#3555]) -> [SKIP][886] ([i915#17356]) +2 other tests skip
   [885]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [886]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          [SKIP][887] ([i915#17428]) -> [SKIP][888] ([i915#14544] / [i915#17428]) +15 other tests skip
   [887]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [888]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2:          [SKIP][889] ([i915#13046] / [i915#17454] / [i915#5354]) -> [SKIP][890] ([i915#17356]) +4 other tests skip
   [889]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [890]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2:          [SKIP][891] ([i915#17356]) -> [SKIP][892] ([i915#13046] / [i915#17454] / [i915#5354]) +4 other tests skip
   [891]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [892]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          [SKIP][893] ([i915#17356]) -> [SKIP][894] ([i915#4103])
   [893]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [894]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          [SKIP][895] ([i915#13691]) -> [SKIP][896] ([i915#17356])
   [895]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-3/igt@kms_display_modes@extended-mode-basic.html
   [896]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_aux_dev@basic:
    - shard-rkl:          [SKIP][897] ([i915#1257] / [i915#14544]) -> [SKIP][898] ([i915#1257])
   [897]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_dp_aux_dev@basic.html
   [898]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-3/igt@kms_dp_aux_dev@basic.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-dg2:          [SKIP][899] ([i915#17291]) -> [SKIP][900] ([i915#17356])
   [899]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html
   [900]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2:          [SKIP][901] ([i915#17356]) -> [SKIP][902] ([i915#17288])
   [901]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst.html
   [902]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
    - shard-dg2:          [SKIP][903] ([i915#17356]) -> [SKIP][904] ([i915#17286])
   [903]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
   [904]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-8/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
    - shard-rkl:          [SKIP][905] ([i915#14544] / [i915#17286]) -> [SKIP][906] ([i915#17286])
   [905]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
   [906]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-dg2:          [SKIP][907] ([i915#16867]) -> [SKIP][908] ([i915#17356])
   [907]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-5/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
   [908]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          [SKIP][909] ([i915#17356]) -> [SKIP][910] ([i915#8812])
   [909]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-wc.html
   [910]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-rkl:          [SKIP][911] ([i915#14544] / [i915#16361]) -> [SKIP][912] ([i915#16361]) +1 other test skip
   [911]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_dsc@dsc-basic-ultrajoiner.html
   [912]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-2/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          [SKIP][913] ([i915#16361]) -> [SKIP][914] ([i915#17356]) +2 other tests skip
   [913]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_dsc@dsc-fractional-bpp.html
   [914]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:
    - shard-dg2:          [SKIP][915] ([i915#17356]) -> [SKIP][916] ([i915#16361]) +1 other test skip
   [915]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html
   [916]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][917] ([i915#14544] / [i915#16680]) -> [SKIP][918] ([i915#16680])
   [917]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html
   [918]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          [SKIP][919] ([i915#17356]) -> [SKIP][920] ([i915#4881])
   [919]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_fence_pin_leak.html
   [920]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-rkl:          [SKIP][921] ([i915#9934]) -> [SKIP][922] ([i915#14544] / [i915#9934])
   [921]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [922]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][923] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839]) -> [INCOMPLETE][924] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [923]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [924]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [INCOMPLETE][925] ([i915#12745] / [i915#13356] / [i915#17183]) -> [INCOMPLETE][926] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183])
   [925]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html
   [926]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-rkl:          [SKIP][927] ([i915#14544] / [i915#9934]) -> [SKIP][928] ([i915#9934]) +2 other tests skip
   [927]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [928]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][929] ([i915#15104] / [i915#15990]) -> [SKIP][930] ([i915#16708])
   [929]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [930]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][931] ([i915#16708]) -> [SKIP][932] ([i915#15104] / [i915#15990]) +2 other tests skip
   [931]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html
   [932]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][933] ([i915#16708] / [i915#5354]) -> [SKIP][934] ([i915#15990] / [i915#8708]) +18 other tests skip
   [933]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [934]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
    - shard-rkl:          [SKIP][935] ([i915#14544] / [i915#17428] / [i915#1825]) -> [SKIP][936] ([i915#17428] / [i915#1825])
   [935]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [936]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          [SKIP][937] ([i915#16708] / [i915#5354]) -> [SKIP][938] ([i915#15991] / [i915#5354]) +26 other tests skip
   [937]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [938]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2:          [SKIP][939] ([i915#16708] / [i915#5354]) -> [SKIP][940] ([i915#10055])
   [939]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [940]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][941] ([i915#15990]) -> [SKIP][942] ([i915#16708]) +29 other tests skip
   [941]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
   [942]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-dg2:          [SKIP][943] ([i915#16708]) -> [SKIP][944] ([i915#15102]) +20 other tests skip
   [943]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
   [944]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][945] ([i915#15990] / [i915#8708]) -> [SKIP][946] ([i915#16708] / [i915#5354]) +17 other tests skip
   [945]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [946]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-rkl:          [SKIP][947] ([i915#14544] / [i915#17428]) -> [SKIP][948] ([i915#17428]) +25 other tests skip
   [947]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [948]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
    - shard-dg2:          [SKIP][949] ([i915#16708] / [i915#5354]) -> [SKIP][950] ([i915#15102]) +9 other tests skip
   [949]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html
   [950]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          [SKIP][951] ([i915#10055]) -> [SKIP][952] ([i915#16708] / [i915#5354])
   [951]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [952]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:
    - shard-rkl:          [SKIP][953] ([i915#15102]) -> [SKIP][954] ([i915#14544] / [i915#15102]) +9 other tests skip
   [953]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html
   [954]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          [SKIP][955] ([i915#16708]) -> [SKIP][956] ([i915#15990]) +15 other tests skip
   [955]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html
   [956]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear:
    - shard-dg2:          [SKIP][957] ([i915#15102]) -> [SKIP][958] ([i915#16708]) +14 other tests skip
   [957]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear.html
   [958]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][959] ([i915#15989]) -> [SKIP][960] ([i915#16708]) +12 other tests skip
   [959]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html
   [960]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-suspend:
    - shard-dg2:          [SKIP][961] ([i915#16708]) -> [SKIP][962] ([i915#15989]) +13 other tests skip
   [961]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-suspend.html
   [962]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_frontbuffer_tracking@hdr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][963] ([i915#15102]) -> [SKIP][964] ([i915#16708] / [i915#5354]) +10 other tests skip
   [963]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [964]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          [SKIP][965] ([i915#14544] / [i915#15102]) -> [SKIP][966] ([i915#15102]) +11 other tests skip
   [965]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
   [966]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][967] ([i915#15991] / [i915#5354]) -> [SKIP][968] ([i915#16708] / [i915#5354]) +21 other tests skip
   [967]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html
   [968]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-indfb-plflip-blt:
    - shard-dg2:          [SKIP][969] ([i915#15991]) -> [SKIP][970] ([i915#16708]) +30 other tests skip
   [969]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-6/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-indfb-plflip-blt.html
   [970]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2:          [SKIP][971] ([i915#16708]) -> [SKIP][972] ([i915#15991]) +26 other tests skip
   [971]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-render.html
   [972]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-tglu:         [ABORT][973] ([i915#15840]) -> [FAIL][974] ([i915#17101] / [i915#17108] / [i915#17188])
   [973]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-tglu-9/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
   [974]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tglu-10/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          [SKIP][975] ([i915#12713] / [i915#16518]) -> [SKIP][976] ([i915#17356])
   [975]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_hdr@brightness-with-hdr.html
   [976]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2:          [SKIP][977] ([i915#17356]) -> [SKIP][978] ([i915#16518] / [i915#3555] / [i915#8228])
   [977]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_hdr@invalid-hdr.html
   [978]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-dg2:          [SKIP][979] ([i915#17356]) -> [SKIP][980] ([i915#16451])
   [979]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_mst@mst-suspend-read-crc.html
   [980]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          [SKIP][981] ([i915#6301]) -> [SKIP][982] ([i915#17356]) +1 other test skip
   [981]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_panel_fitting@atomic-fastset.html
   [982]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
    - shard-snb:          [INCOMPLETE][983] ([i915#13356]) -> [DMESG-WARN][984] ([i915#17752] / [i915#17763])
   [983]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-snb5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html
   [984]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-glk:          [DMESG-FAIL][985] ([i915#118]) -> [DMESG-WARN][986] ([i915#118])
   [985]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-glk2/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
   [986]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk8/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-rkl:          [SKIP][987] ([i915#14544] / [i915#15709]) -> [SKIP][988] ([i915#15709]) +2 other tests skip
   [987]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html
   [988]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2:          [SKIP][989] ([i915#8821]) -> [SKIP][990] ([i915#17356])
   [989]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-6/igt@kms_plane_lowres@tiling-y.html
   [990]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2:          [SKIP][991] ([i915#17356]) -> [SKIP][992] ([i915#13958]) +1 other test skip
   [991]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-none.html
   [992]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2:          [SKIP][993] ([i915#14259]) -> [SKIP][994] ([i915#17356])
   [993]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_plane_multiple@tiling-yf.html
   [994]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_backlight@fade:
    - shard-rkl:          [SKIP][995] ([i915#12343] / [i915#14544] / [i915#5354]) -> [SKIP][996] ([i915#12343] / [i915#5354])
   [995]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_pm_backlight@fade.html
   [996]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_pm_backlight@fade.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          [SKIP][997] ([i915#6524]) -> [SKIP][998] ([i915#14544] / [i915#6524])
   [997]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-4/igt@kms_prime@basic-crc-hybrid.html
   [998]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          [SKIP][999] ([i915#11520]) -> [SKIP][1000] ([i915#11520] / [i915#14544]) +2 other tests skip
   [999]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
   [1000]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@psr-primary-blt:
    - shard-rkl:          [SKIP][1001] ([i915#1072] / [i915#9732]) -> [SKIP][1002] ([i915#1072] / [i915#14544] / [i915#9732]) +3 other tests skip
   [1001]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-8/igt@kms_psr@psr-primary-blt.html
   [1002]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_psr@psr-primary-blt.html

  * igt@kms_psr@psr2-sprite-render:
    - shard-rkl:          [SKIP][1003] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][1004] ([i915#1072] / [i915#9732]) +4 other tests skip
   [1003]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_psr@psr2-sprite-render.html
   [1004]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_psr@psr2-sprite-render.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2:          [SKIP][1005] ([i915#12755] / [i915#15867]) -> [SKIP][1006] ([i915#17356]) +1 other test skip
   [1005]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@kms_rotation_crc@bad-tiling.html
   [1006]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          [SKIP][1007] ([i915#4235]) -> [SKIP][1008] ([i915#17356])
   [1007]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_rotation_crc@exhaust-fences.html
   [1008]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2:          [SKIP][1009] ([i915#17356] / [i915#5190]) -> [SKIP][1010] ([i915#12755] / [i915#15867] / [i915#5190]) +1 other test skip
   [1009]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [1010]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2:          [SKIP][1011] ([i915#17356]) -> [SKIP][1012] ([i915#12755] / [i915#15867]) +2 other tests skip
   [1011]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-90.html
   [1012]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-8/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-rkl:          [SKIP][1013] ([i915#14544] / [i915#3555]) -> [SKIP][1014] ([i915#3555]) +1 other test skip
   [1013]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-center.html
   [1014]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-rkl:          [SKIP][1015] ([i915#3555]) -> [SKIP][1016] ([i915#14544] / [i915#3555])
   [1015]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [1016]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2:          [SKIP][1017] ([i915#17356]) -> [SKIP][1018] ([i915#8623])
   [1017]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [1018]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-snb:          [DMESG-WARN][1019] ([i915#15840]) -> [DMESG-WARN][1020] ([i915#15840] / [i915#17752])
   [1019]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-snb1/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [1020]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2:          [SKIP][1021] ([i915#9906]) -> [SKIP][1022] ([i915#17356])
   [1021]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-3/igt@kms_vrr@flip-basic-fastset.html
   [1022]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          [SKIP][1023] ([i915#11920]) -> [SKIP][1024] ([i915#17356])
   [1023]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-3/igt@kms_vrr@lobf.html
   [1024]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          [SKIP][1025] ([i915#3555] / [i915#9906]) -> [SKIP][1026] ([i915#17356])
   [1025]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-3/igt@kms_vrr@negative-basic.html
   [1026]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_vrr@negative-basic.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          [SKIP][1027] ([i915#14544] / [i915#2436]) -> [SKIP][1028] ([i915#2436])
   [1027]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [1028]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          [SKIP][1029] ([i915#2433]) -> [SKIP][1030] ([i915#14544] / [i915#2433])
   [1029]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-4/igt@perf@unprivileged-single-ctx-counters.html
   [1030]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-rkl:          [SKIP][1031] ([i915#8516]) -> [SKIP][1032] ([i915#14544] / [i915#8516])
   [1031]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-2/igt@perf_pmu@rc6-all-gts.html
   [1032]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          [SKIP][1033] ([i915#17448] / [i915#3291] / [i915#3708]) -> [SKIP][1034] ([i915#14544] / [i915#17448] / [i915#3291] / [i915#3708])
   [1033]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-7/igt@prime_vgem@basic-write.html
   [1034]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          [SKIP][1035] ([i915#14544] / [i915#17448] / [i915#3708]) -> [SKIP][1036] ([i915#17448] / [i915#3708])
   [1035]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@prime_vgem@fence-write-hang.html
   [1036]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@prime_vgem@fence-write-hang.html

  
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521
  [i915#11527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
  [i915#13441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786
  [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15172]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15172
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15347]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15347
  [i915#15365]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15365
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
  [i915#15500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500
  [i915#15529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529
  [i915#15542]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15542
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15722]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
  [i915#15768]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15768
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
  [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
  [i915#16079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079
  [i915#16080]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16162]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16162
  [i915#16166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16451]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451
  [i915#16464]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490
  [i915#16508]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16508
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16545
  [i915#16593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708
  [i915#16746]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746
  [i915#16789]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16789
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16871]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16871
  [i915#16943]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16943
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#17037]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17037
  [i915#17101]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17101
  [i915#17108]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17108
  [i915#17110]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17110
  [i915#17119]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17119
  [i915#17150]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17150
  [i915#17158]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158
  [i915#17183]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
  [i915#17188]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17188
  [i915#17190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17190
  [i915#17285]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285
  [i915#17286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17286
  [i915#17288]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17288
  [i915#17289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289
  [i915#17291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17291
  [i915#17319]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17319
  [i915#17327]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17327
  [i915#17342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17342
  [i915#17345]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17345
  [i915#17356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356
  [i915#17357]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17357
  [i915#17358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17358
  [i915#17359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17359
  [i915#17373]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373
  [i915#17416]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416
  [i915#17427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427
  [i915#17428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428
  [i915#17430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17430
  [i915#17431]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431
  [i915#17432]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432
  [i915#17433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17433
  [i915#17434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434
  [i915#17444]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17444
  [i915#17445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17445
  [i915#17446]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17446
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
  [i915#17509]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17509
  [i915#17510]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510
  [i915#17514]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17514
  [i915#17515]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17515
  [i915#17516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17516
  [i915#17517]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517
  [i915#17520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520
  [i915#17521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521
  [i915#17522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522
  [i915#17523]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17523
  [i915#17524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17524
  [i915#17525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525
  [i915#17526]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17526
  [i915#17527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17527
  [i915#17528]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528
  [i915#17529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529
  [i915#17533]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533
  [i915#17534]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17534
  [i915#17536]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17536
  [i915#17539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17539
  [i915#17540]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17540
  [i915#17541]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17541
  [i915#17542]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17542
  [i915#17544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17544
  [i915#17546]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546
  [i915#17547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547
  [i915#17549]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17549
  [i915#17550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17550
  [i915#17551]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17551
  [i915#17554]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17554
  [i915#17555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17555
  [i915#17557]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17557
  [i915#17559]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17559
  [i915#17562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17562
  [i915#17567]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17567
  [i915#17568]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17568
  [i915#17569]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569
  [i915#17572]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17572
  [i915#17575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17575
  [i915#17576]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17576
  [i915#17583]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17583
  [i915#17584]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17584
  [i915#17585]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17585
  [i915#17586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17586
  [i915#17587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17587
  [i915#17588]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17588
  [i915#17589]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17589
  [i915#17590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17590
  [i915#17591]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17591
  [i915#17592]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17592
  [i915#17593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17593
  [i915#17594]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17594
  [i915#17595]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17595
  [i915#17596]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17596
  [i915#17597]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17597
  [i915#17599]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17599
  [i915#17600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17600
  [i915#17602]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17602
  [i915#17603]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17603
  [i915#17604]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17604
  [i915#17606]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17606
  [i915#17610]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17610
  [i915#17616]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17616
  [i915#17617]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17617
  [i915#17620]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17620
  [i915#17621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17621
  [i915#17622]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17622
  [i915#17626]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17626
  [i915#17628]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17628
  [i915#17629]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17629
  [i915#17631]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17631
  [i915#17632]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17632
  [i915#17637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17637
  [i915#17638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17638
  [i915#17641]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17641
  [i915#17645]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17645
  [i915#17646]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17646
  [i915#17647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17647
  [i915#17656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17656
  [i915#17657]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17657
  [i915#17658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17658
  [i915#17659]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17659
  [i915#17662]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17662
  [i915#17667]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17667
  [i915#17668]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17668
  [i915#17669]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17669
  [i915#17671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17671
  [i915#17673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17673
  [i915#17674]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17674
  [i915#17676]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17676
  [i915#17682]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17682
  [i915#17683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17683
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#17699]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17699
  [i915#17700]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17700
  [i915#17701]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17701
  [i915#17703]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17703
  [i915#17704]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17704
  [i915#17710]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17710
  [i915#17712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17712
  [i915#17752]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17752
  [i915#17755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17755
  [i915#17763]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17763
  [i915#17771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17771
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3547
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
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
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
  [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
  [i915#4884]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#8823]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8823
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9177 -> IGTPW_16097

  CI-20190529: 20190529
  CI_DRM_19443: d11bbfdac0f3d443b367857ffe683ae6bb80d560 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16097: 16097
  IGT_9177: 9177

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/index.html

--===============7492991824864534757==
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
<tr><td><b>Series:</b></td><td>DRM_COLOROP_3D_LUT_DMA colorop tests</td></t=
r>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/177635/">https://patchwork.freedesktop.org/series/177635/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16097/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16097/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9177_full -&gt; IGTPW_16097_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_16097_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_16097_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/index=
.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1609=
7_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-3/igt@i915_selftest@live@gt_engines.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mt=
lp-5/igt@i915_selftest@live@gt_engines.html">ABORT</a> +1 other test abort<=
/li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg1-19/igt@perf_pmu@frequency.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg1-16/igt@p=
erf_pmu@frequency.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_9177_full and IGTPW_16097_ful=
l:</p>
<h3>New IGT tests (95)</h3>
<ul>
<li>
<p>igt@i915_selftest@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@async-flip-suspend-resume:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@atomic-fastset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@bad-vsync-start:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@basic-with_fd_dup:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@close-race:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@cold-reset-bound:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@content-type-change:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@crtc-invalid-params:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@cursor-onscreen-64x64:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@disable-crc-after-crtc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@double-destroy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@drm-resources-equal:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@etime-multi-wait-all-available-unsubmitted:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@execute-one:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@fbc-psr-primary-render:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@fbchdr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@fbchdr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@fbcpsrhdr-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@fbcpsrhdr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@file:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@flip-basic-fastset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@flip-vs-panning-interruptible:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@full:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@getfb-reject-nv12:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@hdr-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@hdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@hdr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@hdr-rgb101010-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@intel-bb-blit-x:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@invalid-create-userspace-config:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@invalid-multi-wait-unsubmitted-submitted-signaled:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@invalid-reset-bad-pad:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@lease-get:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@lic-type-0:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@linear-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@manyslice:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mode-rejected-max-dotclock:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@multi-wait-for-submit-available-unsubmitted-signaled:<=
/p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@multi-wait-for-submit-unsubmitted-submitted:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@multiplane-atomic-fence-wait:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@multiplane-rotation:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-cla=
mping:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@plane-downscale-factor-0-75-with-pixel-format:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@pr-cursor-plane-update-sf:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@protected-raw-src-copy-not-readible:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@psr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@psr2-primary-page-flip:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@psrhdr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@psrhdr-modesetfrombusy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@sync_multi_consumer:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@syncobj-timeline-invalid-wait:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@uhbr-sst-direct-train:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@vm:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@wait-all-complex:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@wait-zero-handles:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@256x256-top-edge:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@etime-multi-wait-all-for-submit-unsubmitted=
-signaled:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@implicit-read-write:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@invalid-get-no-zeromap:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@lessee-list:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@no-handle:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-downscale-factor-0-5-with-modifiers:<=
/p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@query-garbage:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@reset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@signal-point-0:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@yf-tiled-ccs-to-x-tiled:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16097_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_allocator@execbuf-with-allocator:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb1/igt@api_intel_allocator@execbuf-with-a=
llocator.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17647">i915#17647</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@blit-noreloc-purge-cache:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@api_intel_bb@blit-noreloc-purge-ca=
che.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17667">i915#17667</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@api_intel_bb@blit-reloc-keep-cac=
he.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-14/igt@api_intel_bb@crc32.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230"=
>i915#6230</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@api_intel_bb@crc32.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17576">=
i915#17576</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-8/igt@api_intel_bb@crc32.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230"=
>i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@delta-check:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb7/igt@api_intel_bb@delta-check.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7645">i915#17645</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-noreloc-keep-cache-simple:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb7/igt@api_intel_bb@object-noreloc-keep-c=
ache-simple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17641">i915#17641</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@device_reset@cold-reset-bound.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17620">i915#17620</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@device_reset@cold-reset-bound.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-4/igt@device_reset@unbind-cold-reset-r=
ebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@dma-buf-fence-chain:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@dmabuf@dma-buf-fence-chain.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17712">i915#17712</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_read@empty-nonblock:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@drm_read@empty-nonblock.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt=
@drm_read@empty-nonblock.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17359">i915#17359</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@drm_read@short-buffer-nonblock:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@drm_read@short-buffer-nonblock.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17359">i915#17359</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@fbdev@nullptr.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#=
2582</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-5/igt@fbdev@pan.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@fbdev@pan.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@gem_bad_reloc@negative-reloc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17682">i915#17682</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_barrier_race@remote-request:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@gem_barrier_race@remote-request.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17589">i915#17589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@gem_busy@semaphore.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17671">=
i915#17671</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk1/igt@gem_ccs@block-multicopy-compressed=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17499">i915#17499</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@gem_ccs@block-multicopy-compressed=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17499">i915#17499</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@gem_ccs@suspend-resume.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
499">i915#17499</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@gem_close_race@multigpu-basic-pro=
cess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17568">i915#17568</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@get-priority-new-ctx:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@gem_ctx_param@get-priority-new-ctx=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17646">i915#17646</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-5/igt@gem_ctx_param@set-priority-not-s=
upported.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17444">i915#17444</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@bcs0:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@gem_ctx_persistence@engines-hang@=
bcs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17527">i915#17527</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@gem_ctx_persistence@hang.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@gem_ctx_persistence@heartbeat-st=
op.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@gem_ctx_persistence@legacy-engines=
-mixed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/1099">i915#1099</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@gem_ctx_persistence@saturated-host=
ile-nopreempt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17621">i915#17621</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@gem_ctx_persistence@smoketest.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-promotion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb1/igt@gem_ctx_shared@q-promotion.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17342">i915#17342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@gem_ctx_sseu@engines.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1749=
6">i915#17496</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-4/igt@gem_ctx_sseu@engines.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280"=
>i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-14/igt@gem_ctx_sseu@invalid-args.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-7/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/i=
gt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13390">i915#13390</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17327">i915#173=
27</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk9/igt@gem_eio@in-flight-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13390">i915#13390</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-8/igt@gem_eio@suspend.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-1/igt@gem_eio=
@suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15131">i915#15131</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@gem_exec_balancer@bonded-false-han=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17587">i915#17587</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@gem_exec_balancer@bonded-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@fairslice:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk8/igt@gem_exec_balancer@fairslice.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17547">i915#17547</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-2/igt@gem_exec_balancer@parallel-dmabu=
f-import-out-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@gem_exec_balancer@parallel-keep-s=
ubmit-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17547">i915#17547</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk9/igt@gem_exec_capture@capture-invisible=
@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb7/igt@gem_exec_fence@submit3.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/175=
99">i915#17599</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@gem_exec_flush@basic-uc-ro-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@gem_exec_flush@basic-wb-prw-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@invalid-bsd2-flag-on-vebox:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb7/igt@gem_exec_params@invalid-bsd2-flag-=
on-vebox.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17659">i915#17659</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@larger-than-life-batch:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk2/igt@gem_exec_params@larger-than-life-b=
atch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16871">i915#16871</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb7/igt@gem_exec_params@larger-than-life-b=
atch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17662">i915#17662</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@gem_exec_params@secure-non-maste=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17416">i915#17416</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk4/igt@gem_exec_params@secure-non-master.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17523">i915#17523</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@gem_exec_params@secure-non-root.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17523">i915#17523</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@gem_exec_params@secure-non-root.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17523">i915#17523</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-noreloc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-4/igt@gem_exec_reloc@basic-gtt-cpu.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@gem_exec_reloc@basic-wc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@gem_exec_reloc@basic-wc-cpu-activ=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@gem_exec_reloc@basic-wc-read-act=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fairslice:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@gem_exec_schedule@fairslice.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17590">i915#17590</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-5/igt@gem_exec_schedule@preempt-queue.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@gem_exec_schedule@semaphore-power=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/7276">i915#7276</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@gem_exec_whisper@basic-contexts-pr=
iority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17628">i915#17628</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@gem_exercise_blt@fast-copy-emit.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17622">i915#17622</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-16/igt@gem_fence_thrash@bo-write-verify=
-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4860">i915#4860</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@gem_fenced_exec_thrash@no-spare-f=
ences-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@gem_huc_copy@huc-copy.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
56">i915#17456</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk8/igt@gem_lmem_swapping@heavy-verify-mul=
ti-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17503">i915#17503</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@gem_lmem_swapping@heavy-verify-ra=
ndom.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@gem_lmem_swapping@parallel-random=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17503">i915#17503</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@gem_lmem_swapping@verify-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12193">i915#12193</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@gem_lmem_swapping@verify-ccs@lme=
m0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4565">i915#4565</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@gem_lmem_swapping@verify-random-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17503">i915#17503</a>) +7 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-8/igt@gem_lmem_swapping@verify-random-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-4/igt@gem_lmem_swapping@verify-random-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4613">i915#4613</a>) +1 other test skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@gem_lmem_swapping@verify-random-c=
cs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17503">i915#17503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@big-bo:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-18/igt@gem_mmap@big-bo.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i9=
15#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-write-cpu-read-gtt:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@gem_mmap_gtt@basic-write-cpu-read=
-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17572">i915#17572</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@gem_mmap_gtt@cpuset-big-copy-odd.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-snoop:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-5/igt@gem_partial_pwrite_pread@reads-s=
noop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@gem_partial_pwrite_pread@writes-a=
fter-reads-uncached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-14/igt@gem_pread@snoop.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i9=
15#3282</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@gem_pxp@verify-pxp-key-change-aft=
er-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@gem_pxp@verify-pxp-stale-buf-exec=
ution.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17521">i915#17521</a>) +2 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@gem_pxp@verify-pxp-stale-buf-execu=
tion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17521">i915#17521</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-18/igt@gem_pxp@verify-pxp-stale-buf-exe=
cution.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-5/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16097/shard-rkl-4/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk2/igt@gem_pxp@verify-pxp-stale-ctx-execu=
tion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17521">i915#17521</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@write-bad-handle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@gem_readwrite@write-bad-handle.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3282">i915#3282</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@gem_render_copy@y-tiled-ccs-to-yf-=
tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17591">i915#17591</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb1/igt@gem_render_copy@y-tiled-mc-ccs-to-=
vebox-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17492">i915#17492</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk1/igt@gem_render_copy@y-tiled-mc-ccs-to-=
vebox-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17492">i915#17492</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@gem_render_copy@y-tiled-to-vebox-=
x-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17492">i915#17492</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-8/igt@gem_render_copy@yf-tiled-mc-ccs-=
to-vebox-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@gem_render_copy@yf-tiled-mc-ccs-t=
o-vebox-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@gem_set_tiling_vs_gtt.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/40=
79">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@gem_softpin@evict-single-offset.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17471">i915#17471</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@gem_softpin@evict-snoop.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4885">i915#4885</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk1/igt@gem_softpin@evict-snoop.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
551">i915#17551</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-4/igt@gem_softpin@evict-snoop-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17430">i915#17430</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-5/igt@gem_tiled_partial_pwrite_pread@r=
eads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@gem_userptr_blits@coherency-unsyn=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17507">i915#17507</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk2/igt@gem_userptr_blits@invalid-mmap-off=
set-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17507">i915#17507</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-3/igt@gem_userptr_blits@invalid-mmap-of=
fset-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb7/igt@gem_userptr_blits@invalid-mmap-off=
set-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17507">i915#17507</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@gem_userptr_blits@map-fixed-inval=
idate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@gem_userptr_blits@unsync-unmap.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@create-ext:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@gem_vm_create@create-ext.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7596">i915#17596</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_watchdog@default-physical:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@gem_watchdog@default-physical.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17669">i915#17669</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk3/igt@gem_workarounds@suspend-resume-con=
text.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@gen3_mixed_blits.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i=
915#17455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@gen3_render_linear_blits.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7555">i915#17555</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-8/igt@gen3_render_linear_blits.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17455">i915#17455</a>) +2 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk1/igt@gen3_render_linear_blits.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7555">i915#17555</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb7/igt@gen7_exec_parse@basic-offset.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17505">i915#17505</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-7/igt@gen7_exec_parse@basic-offset.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17455">i915#17455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@gen7_exec_parse@batch-without-end=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17505">i915#17505</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk9/igt@gen7_exec_parse@chained-batch.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17505">i915#17505</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-2/igt@gen9_exec_parse@basic-rejected.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@gen9_exec_parse@batch-without-en=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2527">i915#2527</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-7/igt@gen9_exec_parse@batch-zero-lengt=
h.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@gen9_exec_parse@bb-chained.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb1/igt@gen9_exec_parse@bb-start-cmd.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17597">i915#17597</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-8/igt@gen9_exec_parse@unaligned-jump.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gpu_buddy@gpu_buddy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk1/igt@gpu_buddy@gpu_buddy.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17514"=
>i915#17514</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@gpu_buddy@gpu_buddy.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17514"=
>i915#17514</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@i915_drm_fdinfo@all-busy-check-a=
ll.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@i915_drm_fdinfo@busy-check-all.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11527">i915#11527</a>) +5 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@i915_drm_fdinfo@busy-check-all.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17603">i915#17603</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@i915_drm_fdinfo@virtual-busy-idl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling@basic-x-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@i915_fb_tiling@basic-x-tiling.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13786">i915#13786</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@i915_hangman@engine-engine-hang.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17610">i915#17610</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@i915_module_load@fault-injection.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15342">i915#15342</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15840">i915#15840</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@i915_module_load@fault-injection@=
__uc_init.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@i915_driver_mmio_probe:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@i915_module_load@fault-injection@i=
915_driver_mmio_probe.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17755">i915#17755</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@i915_module_load@fault-injection@=
intel_connector_register.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abor=
t</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@i915_module_load@fault-injection@i=
ntel_connector_register.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15342">i915#15342</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk9/igt@i915_module_load@fault-injection@i=
ntel_connector_register.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abort=
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_gt_init-enodev:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk9/igt@i915_module_load@fault-injection@i=
ntel_gt_init-enodev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17600">i915#17600</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_guc_ct_init:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@i915_module_load@fault-injection@i=
ntel_guc_ct_init.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17600">i915#17600</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk1/igt@i915_pm_freq_api@freq-reset-multip=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17526">i915#17526</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb7/igt@i915_pm_freq_api@freq-reset-multip=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17526">i915#17526</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-3/igt@i915_pm_freq_api@freq-reset-mult=
iple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard=
-dg2-4/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#133=
56</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13820">i915#13820</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@i915_pm_freq_mult@media-freq.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17699">i915#17699</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@i915_pm_rc6_residency@media-rc6-ac=
curacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17541">i915#17541</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk4/igt@i915_pm_rc6_residency@media-rc6-ac=
curacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17541">i915#17541</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@debugfs-forcewake-user:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb1/igt@i915_pm_rpm@debugfs-forcewake-user=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17473">i915#17473</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@i915_pm_rpm@gem-execbuf-stress-pc=
8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17434">i915#17434</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-8/igt@i915_pm_rpm@gem-execbuf-stress-p=
c8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17434">i915#17434</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-14/igt@i915_pm_rps@basic-api.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6621">i915#6621</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@i915_pm_rps@reset.html">TIMEOUT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16162=
">i915#16162</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-8/igt@i915_pm_rps@waitboost.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-7/igt=
@i915_pm_rps@waitboost.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15365">i915#15365</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-4/igt@i915_power@sanity.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i=
915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@i915_query@hwconfig_table.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17584">i915#17584</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-8/igt@i915_query@hwconfig_table.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6245">i915#6245</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@i915_query@hwconfig_table.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17584">i915#17584</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@i915_query@query-topology-coherent=
-slice-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17629">i915#17629</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@i915_query@query-topology-unsupp=
orted.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16079">i915#16079</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk6/igt@i915_query@test-query-geometry-sub=
slices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17673">i915#17673</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@i915_suspend@debugfs-reader.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@intel_hwmon@hwmon-read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/176=
74">i915#17674</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-3/igt@intel_hwmon@hwmon-read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7=
707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_addfb_basic@addfb25-x-tiled-=
mismatch-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_addfb_basic@basic-x-tiled-leg=
acy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@kms_addfb_basic@invalid-smem-bo-o=
n-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12454">i915#12454</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_addfb_basic@invalid-smem-bo-on=
-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17668">i915#17668</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_addfb_basic@invalid-smem-bo-o=
n-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17668">i915#17668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_async_flips@async-flip-suspen=
d-resume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12761">i915#12761</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_async_flips@async-flip-suspend=
-resume@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17752">i915#17752</a>) +3 other tests=
 dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk2/igt@kms_async_flips@async-flip-with-pa=
ge-flip-events-linear-atomic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17562">i915#17562</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb7/igt@kms_async_flips@async-flip-with-pa=
ge-flip-events-linear-atomic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17562">i915#17562</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_atomic@plane-primary-overlay-=
mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17485">i915#17485</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-6/igt@kms_atomic_transition@plane-all-=
modeset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_atomic_transition@plane-all-mo=
deset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_atomic_transition@plane-all-m=
odeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@kms_big_fb@4-tiled-16bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk8/igt@kms_big_fb@4-tiled-64bpp-rotate-18=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17478">i915#17478</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_big_fb@4-tiled-8bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17478">i915#17478</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-8/igt@kms_big_fb@4-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5286">i915#5286</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_big_fb@4-tiled-addfb-size-off=
set-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17557">i915#17557</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb7/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +21 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_big_fb@4-tiled-max-hw-stride-=
64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other t=
ests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +6 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@kms_big_fb@linear-8bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk2/igt@kms_big_fb@linear-max-hw-stride-32=
bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17524">i915#17524</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-16/igt@kms_big_fb@linear-max-hw-stride-=
32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_big_fb@linear-max-hw-stride-64=
bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17524">i915#17524</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-5/igt@kms_big_fb@linear-max-hw-stride-=
64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_big_fb@x-tiled-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17500">i915#17500</a>) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_big_fb@x-tiled-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17431">i915#17431</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-4/igt@kms_big_fb@x-tiled-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17431">i915#17431</a>) +1 other test skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_big_fb@x-tiled-8bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17500">i915#17500</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_big_fb@x-tiled-max-hw-stride-6=
4bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-2/igt@kms_big_fb@y-tiled-8bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17431">i915#17431</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_big_fb@y-tiled-addfb-size-offs=
et-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17557">i915#17557</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_big_fb@y-tiled-addfb-size-over=
flow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17544">i915#17544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-=
64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +4 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-=
180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4538">i915#4538</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-3/igt@kms_big_fb@yf-tiled-64bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17432">i915#17432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-8/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +8 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4538">i915#4538</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_busy@basic.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_busy=
@basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_ccs@bad-pixel-format-4-tiled-=
dg2-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +20 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_ccs@bad-pixel-format-y-tiled-=
gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +15 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_ccs@bad-pixel-format-yf-tiled=
-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +43 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_ccs@bad-rotation-90-4-tiled-l=
nl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-16/igt@kms_ccs@bad-rotation-90-4-tiled-=
mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +151 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-m=
tl-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +69 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk4/igt@kms_ccs@ccs-on-another-bo-4-tiled-=
mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +=
49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-2/igt@kms_ccs@ccs-on-another-bo-y-tile=
d-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +64 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-8/igt@kms_ccs@crc-primary-basic-4-tile=
d-dg2-rc-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +24 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_ccs@crc-primary-basic-4-tiled-=
lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17525">i915#17525</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_ccs@crc-primary-basic-4-tiled-=
mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17594">i915#17594</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-=
yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">=
i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-til=
ed-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-til=
ed-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a=
>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-mc-ccs@pipe-d-edp-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@p=
ipe-c-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16097/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-=
mtl-rc-ccs@pipe-c-edp-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-til=
ed-mtl-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +15 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16097/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14694">i915#14694</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs@pipe-c-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#1=
5582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +109 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-b=
mg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_ccs@random-ccs-data-4-tiled-l=
nl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17525">i915#17525</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-l=
nl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12313">i915#12313</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk8/igt@kms_ccs@random-ccs-data-y-tiled-ge=
n12-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +128 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-2/igt@kms_cdclk@mode-transition.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3742">i915#3742</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_cdclk@mode-transition.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17550">i915#17550</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-7/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16017">i915#16017</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_cdclk@plane-scaling.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
550">i915#17550</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_cdclk@plane-scaling.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
550">i915#17550</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-2/igt@kms_chamelium_audio@hdmi-audio.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-18/igt@kms_chamelium_audio@hdmi-audio-e=
did.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-8/igt@kms_chamelium_color@ctm-0-25.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_chamelium_color@ctm-0-50.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb7/igt@kms_chamelium_color@ctm-0-75.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17489">i915#17489</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-3/igt@kms_chamelium_color@ctm-0-75.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17427">i915#17427</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_chamelium_color@ctm-blue-to-r=
ed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17489">i915#17489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk3/igt@kms_chamelium_color@gamma.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17489">i915#17489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_chamelium_color_pipeline@plan=
e-fixed-matrix-yuv-rgb-bt601-lim.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lu=
t1d:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_chamelium_color_pipeline@plan=
e-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:=
</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@kms_chamelium_color_pipeline@pla=
ne-fixed-matrix-yuv-rgb-bt601-lut1d.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_chamelium_color_pipeline@plan=
e-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk1/igt@kms_chamelium_color_pipeline@plane=
-lut1d-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17497">i915#17497</a>) +4 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-3/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +2 other test=
s skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-8/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16464">i915#16464</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-2/igt@kms_chamelium_color_pipeline@plan=
e-lut1d-post-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +2 other=
 tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_chamelium_color_pipeline@plane=
-lut1d-post-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17497">i915#17497</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_chamelium_edid@dp-mode-timing=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_chamelium_edid@hdmi-mode-timin=
gs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17483">i915#17483</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_chamelium_frames@dp-crc-singl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17483">i915#17483</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_chamelium_frames@hdmi-crc-sin=
gle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17483">i915#17483</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_chamelium_hpd@dp-hpd-after-r=
untime-suspend-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_chamelium_hpd@vga-hpd-fast.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17483">i915#17483</a>) +13 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-2/igt@kms_chamelium_hpd@vga-hpd-fast.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/7828">i915#7828</a>) +8 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-2/igt@kms_chamelium_hpd@vga-hpd-fast.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@background-color:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-6/igt@kms_color@background-color.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/=
igt@kms_color@background-color.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17373">i915#17373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_color@ctm-0-50.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@km=
s_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17373">i915#17373</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-16/igt@kms_color@deep-color.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/126=
55">i915#12655</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-degamma-lut-sizes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_color@invalid-degamma-lut-size=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17656">i915#17656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-degamma-lut-sizes@pipe-a:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_color@invalid-degamma-lut-size=
s@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17657">i915#17657</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_color_pipeline@plane-ctm3x4-lu=
t1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17510">i915#17510</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_color_pipeline@plane-fixed-ma=
trix-yuv-rgb-bt709.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17510">i915#17510</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-5/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt7=
09-lim-lut1d.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matri=
x-yuv-rgb-bt709-lim-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15529">i915#15529</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk2/igt@kms_color_pipeline@plane-lut1d-ctm=
3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17510">i915#17510</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@kms_color_pipeline@plane-lut1d-c=
tm3x4@pipe-d-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_color_pipeline@plane-lut1d-lu=
t1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15529">i915#15529</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-3/igt@kms_color_pipeline@plane-lut1d-pr=
e-ctm3x4@pipe-a-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_content_protection@content-typ=
e-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17508">i915#17508</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-5/igt@kms_content_protection@content-t=
ype-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-4/igt@kms_content_protection@dp-mst-li=
c-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>) +1 othe=
r test skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_content_protection@dp-mst-lic=
-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17502">i915#17502</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_content_protection@dp-mst-lic-=
type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17502">i915#17502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@kms_content_protection@dp-mst-lic=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk1/igt@kms_content_protection@dp-mst-type=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17502">i915#17502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_content_protection@dp-mst-typ=
e-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17502">i915#17502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-10/igt@kms_content_protection@dp-mst-t=
ype-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_content_protection@legacy.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_content_protection@legacy-hdcp=
14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17508">i915#17508</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-8/igt@kms_content_protection@lic-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_content_protection@type1.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17356">i915#17356</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_content_protection@uevent.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17508">i915#17508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-3=
2x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdm=
i-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16097/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-=
a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-ma=
x-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@kms_cursor_crc@cursor-random-512=
x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13049">i915#13049</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-3/igt@kms_cursor_crc@cursor-random-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_cursor_crc@cursor-rapid-moveme=
nt-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17504">i915#17504</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-3/igt@kms_cursor_crc@cursor-rapid-move=
ment-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk9/igt@kms_cursor_crc@cursor-rapid-moveme=
nt-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17504">i915#17504</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_cursor_crc@cursor-sliding-32x=
32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17504">i915#17504</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_cursor_crc@cursor-sliding-512=
x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17533">i915#17533</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_cursor_crc@cursor-sliding-512x=
170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17533">i915#17533</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-64x21.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/sha=
rd-rkl-7/igt@kms_cursor_crc@cursor-sliding-64x21.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-6=
4x21@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-64x=
21@pipe-a-hdmi-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/13566">i915#13566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-5/igt@kms_cursor_legacy@2x-long-nonblo=
cking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-2/igt@kms_cursor_legacy@cursora-vs-fli=
pb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flip=
a-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#535=
4</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-a=
tomic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15768">i915#15768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_cursor_legacy@modeset-atomic=
-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_cursor_legacy@modeset-atomic-=
cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17549">i915#17549</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)=
</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-7/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk8/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17457">i915#17457</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17457">i915#17457</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17515">i915#17515</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17515">i915#17515</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17486">i915#17486</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_dither@fb-8bpc-vs-panel-6bpc@=
pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17487">i915#17487</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_dither@fb-8bpc-vs-panel-6bpc@=
pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17486">i915#17486</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-10/igt@kms_dp_link_training@non-uhbr-m=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17289">i915#17289</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-7/igt@kms_dp_link_training@non-uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17289">i915#17289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-7/igt@kms_dp_link_training@non-uhbr-ms=
t-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17291">i915#17291</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk5/igt@kms_dp_link_training@non-uhbr-mst-=
tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17616">i915#17616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@kms_dp_link_training@non-uhbr-ss=
t-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17286">i915#17286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_dp_link_training@uhbr-mst-tbt=
alt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17285">i915#17285</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-10/igt@kms_dp_link_training@uhbr-mst-t=
btalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17285">i915#17285</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_dp_link_training@uhbr-sst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_dp_link_training@uhbr-sst-tbta=
lt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17477">i915#17477</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_dp_link_training@uhbr-sst-tbta=
lt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17477">i915#17477</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-16/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-7/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-14/igt@kms_dsc@dsc-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361"=
>i915#16361</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-ultraj=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_dsc@dsc-fractional-bpp-with-b=
pc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17458">i915#17458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_dsc@dsc-with-bpc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1745=
8">i915#17458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_dsc@dsc-with-bpc-formats.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17458">i915#17458</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-5/igt@kms_dsc@dsc-with-output-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16361">i915#16361</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_dsc@dsc-with-output-formats-wi=
th-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17458">i915#17458</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-5/igt@kms_fbcon_fbt@fbc.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_f=
bcon_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_fbcon_fbt@fbc-suspend.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk4/igt@kms_fbcon_fbt@psr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17516">i=
915#17516</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16680">i915#16680</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_fbcon_fbt@psr-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17516">i915#17516</a>) +1 other test skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_fbcon_fbt@psr-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17516">i915#17516</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk4/igt@kms_feature_discovery@hdr.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17539">i915#17539</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_feature_discovery@hdr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-7/igt@kms_feature_discovery@psr2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk3/igt@kms_feature_discovery@psr2.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17585">i915#17585</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_feature_discovery@psr2.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_feature_discovery@vrr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17539">i915#17539</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-4/igt@kms_feature_discovery@vrr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16600">i915#16600</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_feature_discovery@vrr.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17539">i915#17539</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-5/igt@kms_flip@2x-flip-vs-absolute-wf_=
vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-16/igt@kms_flip@2x-flip-vs-fences.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8381">i915#8381</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-5/igt@kms_flip@2x-flip-vs-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk2/igt@kms_flip@2x-flip-vs-suspend.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113"=
>i915#6113</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk2/igt@kms_flip@2x-flip-vs-suspend@ac-hdm=
i-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#171=
83</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-8/igt@kms_flip@2x-flip-vs-wf_vblank-int=
erruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9934">i915#9934</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-16/igt@kms_flip@2x-flip-vs-wf_vblank-in=
terruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_flip@2x-modeset-vs-vblank-rac=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_flip@flip-vs-dpms-on-nop-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17358">i915#17358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_flip@flip-vs-suspend-interrup=
tible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i=
915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_flip@flip-vs-suspend-interrup=
tible@a-hdmi-a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#1=
7183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-4/igt@kms_flip@flip-vs-suspend-interrup=
tible@a-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16276">i915#16276</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>) +1 other=
 test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk3/igt@kms_flip@flip-vs-suspend@a-hdmi-a1=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6=
113</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb7/igt@kms_flip@flip-vs-suspend@a-hdmi-a1=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15840">i915#15840</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17752">i915#17752</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_flip@plain-flip-ts-check-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-6/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modese=
t-interruptible.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_flip@single-buffer-flip-vs-dp=
ms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +6 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) +2 oth=
er tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17593">i915#17593</a>) +9 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk4/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4ti=
ledg2rcccs-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_flip_scaled_crc@flip-6=
4bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i=
915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-li=
near-to-32bpp-linear-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i=
915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_flip_scaled_crc@flip-64bpp-xti=
le-to-32bpp-xtile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>=
) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_flip_tiling@flip-change-tilin=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_frontbuffer_tracking.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16545">i915#16545</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-1p-=
offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#159=
90</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shr=
fb-draw-render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-of=
fscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16097/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5354">i915#5354</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_frontbuffer_tracking@fbc-tili=
ng-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17559">i915#17559</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_frontbuffer_tracking@fbc-tilin=
g-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17559">i915#17559</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-2=
p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +50 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbchdr-=
farfromfence-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt=
:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#159=
90</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +24 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +11 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i=
915#1825</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +61 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708=
</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) =
+4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +27 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +133 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb7/igt@kms_frontbuffer_tracking@fbcpsr-rg=
b101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17588">i915#17588</a>) +132 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-r=
gb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_frontbuffer_tracking@fbcpsr-sh=
rfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17606">i915#17606</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_frontbuffer_tracking@fbcpsr-ti=
ling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17559">i915#17559</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsr-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-=
cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +28 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-g=
tt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +25 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +75 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-w=
c:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +5 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-7/igt@kms_frontbuffer_tracking@hdr-1p-=
primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +24 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-1p-p=
rimscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk4/igt@kms_frontbuffer_tracking@hdr-2p-pr=
imscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +58 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_frontbuffer_tracking@hdr-2p-pr=
imscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +30 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-rte:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-16/igt@kms_frontbuffer_tracking@hdr-2p-=
rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17428">i915#17428</a>) +72 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-16/igt@kms_frontbuffer_tracking@hdr-ind=
fb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15989">i915#15989</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-rgb1=
01010-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15989">i915#15989</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16097/shard-rkl-8/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15989">i915#15989</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk8/igt@kms_frontbuffer_tracking@hdr-suspe=
nd.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16056">i915#16056</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593">i915#16593</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_frontbuffer_tracking@pipe-fbc-=
rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17534">i915#17534</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17588">i915#17588</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk1/igt@kms_frontbuffer_tracking@pipe-fbc-=
rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17534">i915#17534</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +6 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +7 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-rgb1=
01010-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-shr=
fb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15102">i915#15102</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_frontbuffer_tracking@psrhdr-2=
p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2=
p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +10 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_frontbuffer_tracking@psrhdr-2p=
-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +62 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-7/igt@kms_frontbuffer_tracking@psrhdr-=
2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>)=
 +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-5/igt@kms_frontbuffer_tracking@psrhdr-=
rgb565-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15989">i915#15989</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-nv12:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_getfb@getfb2-accept-nv12.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17658">i915#17658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-8/igt@kms_hdmi_audio_bw@suspend-disk-au=
dio-recovery.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_hdmi_audio_bw@suspend-mem-aud=
io-recovery.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17110">i915#17110</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk3/igt@kms_hdr@invalid-hdr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498"=
>i915#17498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-9/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-4/igt@kms_hdr@static-toggle-dpms.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12713">i915#12713</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16490">i915#16490</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_hdr@static-toggle-dpms.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17498">i915#17498</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_hdr@static-toggle-dpms.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16518">i915#16518</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_hdr@static-toggle-dpms.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@kms_hdr@static-toggle-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16644">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip<=
/li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_hdr@static-toggle-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17498">i915#17498</a>) +2 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_hdr@static-toggle-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17498">i915#17498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-5/igt@kms_invalid_mode@bad-hsync-end.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg=
2-7/igt@kms_invalid_mode@bad-hsync-end.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#16746</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3=
555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_joiner@basic-force-ultra-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk8/igt@kms_joiner@basic-max-non-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17575">i915#17575</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_joiner@basic-max-non-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17575">i915#17575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@kms_joiner@invalid-modeset-force=
-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_joiner@invalid-modeset-force-u=
ltra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17567">i915#17567</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-2/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15458">i915#15458</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_joiner@invalid-modeset-force-=
ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17567">i915#17567</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_joiner@invalid-modeset-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17567">i915#17567</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk5/igt@kms_joiner@switch-modeset-ultra-jo=
iner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17617">i915#17617</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_joiner@switch-modeset-ultra-jo=
iner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17617">i915#17617</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-5/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-2/igt@kms_mst@mst-suspend-read-crc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16451">i915#16451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk5/igt@kms_multipipe_modeset@basic-max-pi=
pe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17701">i915#17701</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15815">i915#15815</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-9/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-8/igt@kms_panel_fitting@atomic-fastset=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb7/igt@kms_pipe_b_c_ivb@enable-pipe-c-whi=
le-b-has-3-lanes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17540">i915#17540</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-18/igt@kms_pipe_b_c_ivb@from-pipe-c-to-=
b-with-3-lanes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17455">i915#17455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_pipe_b_c_ivb@pipe-b-double-mo=
deset-then-modeset-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17540">i915#17540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk3/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-m=
odeset-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17540">i915#17540</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-=
modeset-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17455">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk5/igt@kms_pipe_crc_basic@suspend-read-cr=
c.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12756">i915#12756</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915=
#13476</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16789">i915#16789</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk5/igt@kms_pipe_crc_basic@suspend-read-cr=
c@pipe-c-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12756">i915#12756</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915=
#13409</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16789">i915#16789</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-xtiled:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_pipe_stress@stress-xrgb8888-x=
tiled.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-10/igt@kms_pipe_stress@stress-xrgb8888=
-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14712">i915#14712</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_pipe_stress@stress-xrgb8888-yf=
tiled.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/118">i915#118</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_pipe_stress@stress-xrgb8888-y=
ftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_plane@pixel-format-4-tiled-bmg=
-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_plane@pixel-format-4-tiled-dg=
2-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17479">i915#17479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-5/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifie=
r-source-clamping.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-=
dg2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-4/igt@kms_plane@pixel-format-4-tiled-d=
g2-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</l=
i>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-4/igt@kms_plane@pixel-format-4-tiled-d=
g2-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_plane@pixel-format-4-tiled-mo=
difier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_plane@pixel-format-4-tiled-mt=
l-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17479">i915#17479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-mt=
l-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk4/igt@kms_plane@pixel-format-x-tiled-mod=
ifier@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17494">i915#17494</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-18/igt@kms_plane@pixel-format-y-tiled-g=
en12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane=
-7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@kms_plane@pixel-format-y-tiled-g=
en12-rc-ccs-cc-modifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:=
</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-10/igt@kms_plane@pixel-format-y-tiled-=
gen12-rc-ccs-modifier@pipe-a-plane-7.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@kms_plane@pixel-format-yf-tiled-c=
cs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_plane@pixel-format-yf-tiled-cc=
s-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +9 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-4:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_plane@pixel-format-yf-tiled-c=
cs-modifier@pipe-a-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17494">i915#17494</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-4:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_plane@pixel-format-yf-tiled-m=
odifier@pipe-a-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17494">i915#17494</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_plane@planar-pixel-format-set=
tings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17700">i915#17700</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@kms_plane@planar-pixel-format-se=
ttings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_plane_alpha_blend@alpha-transp=
arent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/12177">i915#12177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb7/igt@kms_plane_alpha_blend@constant-alp=
ha-max.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17595">i915#17595</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk1/igt@kms_plane_alpha_blend@constant-alp=
ha-max.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk1/igt@kms_plane_alpha_blend@constant-alp=
ha-max@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +3 other tests fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_plane_lowres@tiling-4.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17509">i915#17509</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_plane_lowres@tiling-4.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17509">i915#17509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_plane_multiple@2x-tiling-4.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17586">i915#17586</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-7/igt@kms_plane_multiple@2x-tiling-4.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk8/igt@kms_plane_multiple@2x-tiling-4.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17586">i915#17586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-2/igt@kms_plane_multiple@2x-tiling-non=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_plane_multiple@2x-tiling-y.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-4/igt@kms_plane_multiple@tiling-4.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-18/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14259">i915#14259</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_plane_multiple@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17542">i915#17542</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_plane_scaling@intel-max-src-s=
ize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6953">i915#6953</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-6/igt@kms_plane_scaling@invalid-parameters.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/sh=
ard-dg2-7/igt@kms_plane_scaling@invalid-parameters.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#173=
56</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/9423">i915#9423</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_plane_scaling@invalid-paramete=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17626">i915#17626</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with=
-modifiers.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-fact=
or-0-5-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#94=
23</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-=
a:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-3/igt@kms_plane_scaling@plane-downscal=
e-factor-0-5-with-pixel-format@pipe-a.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +12 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk1/igt@kms_plane_scaling@plane-downscale-=
factor-0-5-with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17528">i915#17528</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:</=
p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_plane_scaling@plane-downscale-=
factor-0-5-with-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</=
a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-7/igt@kms_plane_scaling@plane-downscal=
e-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-un=
ity-scaling-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i9=
15#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-c:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-un=
ity-scaling-with-modifiers@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-un=
ity-scaling-with-modifiers@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab=
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
/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_plane_scaling@plane-scaler-uni=
ty-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-2=
0x20-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-4/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-up=
scale-factor-0-25.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_plane_scaling@planes-downsc=
ale-factor-0-75-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#173=
56</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6953">i915#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i91=
5#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b:=
</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_plane_scaling@planes-upscale-2=
0x20-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a>) +9 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-factor-0-25.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16097/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15329">i915#15329</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-c:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-down=
scale-factor-0-75@pipe-c.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_plane_scaling@planes=
-upscale-factor-0-25-downscale-factor-0-75@pipe-c.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#153=
29</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_plane_scaling@planes-upscale-f=
actor-0-25@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17529">i915#17529</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe=
-d.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16097/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25@p=
ipe-d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_pm_backlight@basic-brightness=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_pm_backlight@fade.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1746=
2">i915#17462</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_pm_backlight@fade.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1746=
2">i915#17462</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-16/igt@kms_pm_backlight@fade.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12=
343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-2/igt@kms_pm_backlight@fade-with-suspen=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_pm_dc@dc5-dpms-negative.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17602">i915#17602</a>) +1 other test skip</li>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-3/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7=
/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/13441">i915#13441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-5/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard=
-rkl-3/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16943">i915#169=
43</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk2/igt@kms_pm_dc@dc5-pageflip-negative.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17495">i915#17495</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">=
i915#15948</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@kms_pm_dc@dc6-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948"=
>i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk4/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17703">=
i915#17703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@km=
s_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@kms_pm_rpm@cursor.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">=
i915#4077</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg1-15/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-=
dg1-17/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-4/igt@kms_pm_rpm@dpms-mode-unset-non-l=
psp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-5/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg=
2-7/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17446">i915#17446</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3547">i915#3=
547</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-6/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_pm_r=
pm@i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17446">i915#17446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15073">i915#15073</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shar=
d-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stres=
s-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_pm_rpm@pc8-residency.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7710">i915#17710</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-6/igt@kms_pm_rpm@pc8-residency.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_pm_rpm@system-suspend-modeset=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14419">i915#14419</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_prime@basic-modeset-hybrid.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17569">i915#17569</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-4/igt@kms_prime@basic-modeset-hybrid.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/6524">i915#6524</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_prime@basic-modeset-hybrid.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17569">i915#17569</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk3/igt@kms_prime@d3hot.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569">i91=
5#17569</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@kms_properties@colorop-properties-atomic.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1609=
7/shard-dg2-7/igt@kms_properties@colorop-properties-atomic.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15347">i=
915#15347</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_properties@colorop-properties=
-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17481">i915#17481</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-2/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_psr2_sf@fbc-pr-primary-plane-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_psr2_sf@fbc-psr2-plane-move-s=
f-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk9/igt@kms_psr2_sf@fbc-psr2-primary-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11520">i915#11520</a>) +12 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-primary-plan=
e-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_psr2_sf@pr-overlay-plane-upd=
ate-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@kms_psr2_sf@psr2-overlay-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/11520">i915#11520</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-9/igt@kms_psr2_su@page_flip-nv12.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9683">i915#9683</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@kms_psr2_su@page_flip-xrgb8888.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17546">i915#17546</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_psr2_su@page_flip-xrgb8888.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17546">i915#17546</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-7/igt@kms_psr@fbc-psr2-cursor-plane-mo=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9688">i915#9688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_psr@fbc-psr2-cursor-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17480">i915#17480</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-9/igt@kms_psr@fbc-psr2-primary-mmap-gt=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9732">i915#9732</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_psr@pr-basic.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i9=
15#17480</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb7/igt@kms_psr@pr-sprite-plane-onoff.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17480">i915#17480</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_psr@psr-cursor-render.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-3/igt@kms_psr@psr2-cursor-mmap-gtt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-15/igt@kms_psr@psr2-sprite-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_psr@psr2-suspend.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1748=
0">i915#17480</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-=
invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-2/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk9/igt@kms_psr_stress_test@flip-primary-i=
nvalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17554">i915#17554</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb7/igt@kms_psr_stress_test@invalidate-pri=
mary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17554">i915#17554</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_rotation_crc@exhaust-fences.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17676">i915#17676</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@kms_rotation_crc@exhaust-fences.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4884">i915#4884</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_rotation_crc@multiplane-rotati=
on-cropping-bottom.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15500">i915#15500</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@kms_rotation_crc@primary-4-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-8/igt@kms_rotation_crc@primary-rotatio=
n-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15867">i915#15867</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_rotation_crc@primary-y-tiled-=
reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17488">i915#17488</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_rotation_crc@primary-y-tiled-=
reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk8/igt@kms_rotation_crc@primary-y-tiled-r=
eflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17488">i915#17488</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17488">i915#17488</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-7/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_rotation_crc@sprite-rotation-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17488">i915#17488</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk5/igt@kms_scaling_modes@scaling-mode-cen=
ter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17501">i915#17501</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_scaling_modes@scaling-mode-cen=
ter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17501">i915#17501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-18/igt@kms_selftest@drm_framebuffer.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13179">i915#13179</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16508">i915#16508</a>) +1 other test abort</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb7/igt@kms_selftest@drm_framebuffer.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13179">i915#13179</a>) +1 other test abort</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk1/igt@kms_selftest@drm_framebuffer.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_s=
etmode@basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk8/igt@kms_setmode@invalid-clone-exclusiv=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17463">i915#17463</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb7/igt@kms_setmode@invalid-clone-exclusiv=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17604">i915#17604</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-7/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/8809">i915#8809</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/8823">i915#8823</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@kms_setmode@invalid-clone-single=
-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_tv_load_detect@load-detect.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17445">i915#17445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-5/igt@kms_vblank@ts-continuation-dpms-suspend.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097=
/shard-dg2-7/igt@kms_vblank@ts-continuation-dpms-suspend.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i91=
5#17356</a>) +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk4/igt@kms_vblank@ts-continuation-suspend=
@pipe-c-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12276">i915#12276</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 ot=
her test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@kms_vrr@flip-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520"=
>i915#17520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@kms_vrr@flipline.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520">i=
915#17520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-17/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915=
#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk6/igt@kms_vrr@seamless-rr-switch-drrs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17520">i915#17520</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@kms_vrr@seamless-rr-switch-drrs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9906">i915#9906</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_vrr@seamless-rr-switch-drrs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17520">i915#17520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-4/igt@kms_vrr@seamless-rr-switch-virtua=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-group-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk1/igt@perf@gen12-group-exclusive-stream-=
sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17536">i915#17536</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-oa-tlb-invalidate:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@perf@gen12-oa-tlb-invalidate.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17536">i915#17536</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-19/igt@perf@mi-rpc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2=
434</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@perf@mi-rpc.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17592">i915#17=
592</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk1/igt@perf@per-context-mode-unprivileged=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17704">i915#17704</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-8/igt@perf_pmu@busy-double-start@vecs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard=
-mtlp-7/igt@perf_pmu@busy-double-start@vecs0.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>)</=
li>
</ul>
</li>
<li>
<p>igt@perf_pmu@enable-race@bcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb7/igt@perf_pmu@enable-race@bcs0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17638">i915#17638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@enable-race@vcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb7/igt@perf_pmu@enable-race@vcs0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17637">i915#17637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-2/igt@perf_pmu@event-wait@rcs0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17416">i915#17416</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@perf_pmu@module-unload.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
119">i915#17119</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk9/igt@perf_pmu@rc6-all-gts.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17583=
">i915#17583</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@perf_pmu@rc6-all-gts.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17583=
">i915#17583</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb1/igt@perf_pmu@rc6-suspend.html">ABORT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1584=
0">i915#15840</a>) +11 other tests abort</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk10/igt@perf_pmu@rc6@other-idle-gt0.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17583">i915#17583</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@perf_pmu@rc6@other-idle-gt0.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@bcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@perf_pmu@semaphore-busy@bcs0.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17683">i915#17683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb6/igt@prime_udl@share-import.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/164=
20">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import-addfb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk6/igt@prime_udl@share-import-addfb.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg1-14/igt@prime_vgem@basic-fence-mmap.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk6/igt@prime_vgem@fence-flip-hang.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17467">i915#17467</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb5/igt@prime_vgem@fence-read-hang.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17467">i915#17467</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-tglu-3/igt@prime_vgem@fence-read-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17448">i915#17448</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-8/igt@prime_vgem@fence-read-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-glk11/igt@prime_vgem@fence-write-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17467">i915#17467</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@timeout:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@sysfs_preempt_timeout@timeout.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17631">i915#17631</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@idempotent@vcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-snb4/igt@sysfs_timeslice_duration@idempoten=
t@vcs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17632">i915#17632</a>) +13 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_read@short-buffer-wakeup:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@drm_read@short-buffer-wakeup.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17359">i915#=
17359</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16097/shard-dg2-4/igt@drm_read@short-buffer-wakeup.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#=
13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16348">i915#16348</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16097/shard-dg2-8/igt@gem_ccs@suspend-resume.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-4/igt@gem_eio@hibernate.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17190">i915#171=
90</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/7975">i915#7975</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16097/shard-mtlp-5/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-7/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17190">i=
915#17190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16097/shard-mtlp-4/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-tglu-2/igt@gem_exec_big@single.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816">i915#15816</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/sh=
ard-tglu-3/igt@gem_exec_big@single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-re=
fcounted.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4270">i915#4270</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@gem_pxp@dmabuf-shared-prot=
ected-dst-is-context-refcounted.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-5/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964"=
>i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16097/shard-dg2-7/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-glk4/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
3356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15172">i915#15172</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16097/shard-glk4/igt@i915_pm_rpm@system-suspend-=
execbuf.html">PASS</a></li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
13356">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16097/shard-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-6/igt@i915_power@sanity.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-=
mtlp-6/igt@i915_power@sanity.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-3/igt@kms_async_flips@async-flip-suspend-resume.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17037">i915#17037</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-5/igt@kms_async_flips@async-flip-suspe=
nd-resume.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-b=
-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17150">i915#17150</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-5/igt@kms_async_flips@async-fli=
p-suspend-resume@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@atomic-setmode:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_atomic_interruptible@atomic-setmode.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16097/shard-dg2-3/igt@kms_atomic_interruptible@atomic-setmode.ht=
ml">PASS</a> +41 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@p=
ipe-c-edp-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-2/igt@kms_ccs@crc-pr=
imary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-c=
c.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17158">i915#17158</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16097/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-=
tiled-mtl-rc-ccs-cc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_color@degamma.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373">=
i915#17373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16097/shard-dg2-3/igt@kms_color@degamma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2=
020-lim-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15529">i915#15529</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_color_pipeline@=
plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html">PASS</a> +3 other tests p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-tglu-10/igt@kms_cursor_crc@cursor-random-64x21.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1356=
6">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16097/shard-tglu-9/igt@kms_cursor_crc@cursor-random-64x21.html">PAS=
S</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-tglu-8/igt@kms_fbcon_fbt@fbc-suspend.html">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840">i915#1=
5840</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
6097/shard-tglu-9/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> +1 other tes=
t pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_flip@flip-vs-absolute-wf_vblan=
k-interruptible.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4ti=
ledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@=
kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html"=
>PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_frontbuffer_track=
ing@fbc-1p-offscreen-pri-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pg=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_frontb=
uffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">PASS</a> +6 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-i=
ndfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-1/igt@kms_frontbuffer_=
tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html">PASS</a> +1 other t=
est pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-glk2/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-in=
dfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17517">i915#17517</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-glk8/igt@kms_frontbuffer_=
tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-cpu.html">PASS</a> +4 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17357">i915#17357</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_hdmi_audio_bw@suspend-mem-audio-r=
ecovery.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-4/igt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17319">=
i915#17319</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16097/shard-mtlp-8/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_invalid_mode@bad-vsync-end.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i91=
5#16746</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_invalid_mode@bad-vsync-end.html">=
PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_pipe_crc_basic=
@compare-crc-sanitycheck-xr24.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_plane@pixel-format-x-tiled-modifier-source-cl=
amping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/8825">i915#8825</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_plane@pixel-format-x-til=
ed-modifier-source-clamping.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-=
d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with=
-pixel-format@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/=
igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.h=
tml">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-=
rotation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-=
4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">PASS<=
/a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
329">i915#15329</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt=
@kms_plane_scaling@planes-upscale-20x20.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-b:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20@pipe-b.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15329">i915#15329</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-20x=
20@pipe-b.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/sh=
ard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg1-19/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_160=
97/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16097/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#1=
5073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
6097/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> +2 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915=
#9519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16097/shard-dg2-6/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_properties@plane-properties-legacy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
521">i915#11521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16097/shard-dg2-4/igt@kms_properties@plane-properties-legacy.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf@polling:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@perf@polling.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/10538">i915#10538</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-=
8/igt@perf@polling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf@polling@1-vcs1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-5/igt@perf@polling@1-vcs1.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538">i915#10538</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/sh=
ard-mtlp-6/igt@perf@polling@1-vcs1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-tglu-9/igt@perf_pmu@rc6.html">WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/17771">i915#17771</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-tgl=
u-2/igt@perf_pmu@rc6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@runtime-pm-long-gt0:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-tglu-9/igt@perf_pmu@rc6@runtime-pm-long-gt0.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17771">=
i915#17771</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16097/shard-tglu-2/igt@perf_pmu@rc6@runtime-pm-long-gt0.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-7/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#=
3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9323">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16097/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-2/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/s=
hard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#=
280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-submit-fence.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16097/shard-rkl-6/igt@gem_exec_balancer@parallel-keep-submit-=
fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-7/igt@gem_exec_reloc@basic-cpu-gtt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3=
281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
097/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-gtt.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
81">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-active.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16097/shard-rkl-4/igt@gem_exec_reloc@basic-write-re=
ad-active.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-1/igt@gem_exec_suspend@basic-s3.html">ABORT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15=
131</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15542">i915#15542</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16097/shard-rkl-3/igt@gem_exec_suspend@basic-s3.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/219=
0">i915#2190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16097/shard-rkl-8/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190=
</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-8/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613"=
>i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16097/shard-rkl-6/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-pwrite:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@gem_madvise@dontneed-before-pwrite.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-4/igt@gem_madvise@dontneed-before-pwrit=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-4/igt@gem_pread@exhaustion.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shar=
d-rkl-6/igt@gem_pread@exhaustion.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a=
>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17433">i915#17433</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@gem_userptr_blits@c=
oherency-sync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17433">i915#17433</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@gem_userptr_blits@coherency-unsyn=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-8/igt@gen7_exec_parse@chained-batch.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915=
#17455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16097/shard-rkl-6/igt@gen7_exec_parse@chained-batch.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17455">i915#17455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@gen9_exec_parse@basic-rejec=
ted-ctx-param.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-8/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399=
">i915#8399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16097/shard-rkl-6/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16080">i915#16080</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16166">i915#16166</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@i915_pm_r=
c6_residency@media-rc6-accuracy.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/16080">i915#16080</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166">i915#16166</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transitio=
n-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_atomic_tran=
sition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transitio=
n-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/sha=
rd-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-pa=
nels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/1769">i915#1769</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356=
">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16097/shard-dg2-6/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
431">i915#17431</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_big_fb@4-tiled=
-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_big_fb@4-tiled-m=
ax-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i=
915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-=
hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_big_fb@linear-max-hw-st=
ride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">=
i915#17431</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16097/shard-dg2-7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356"=
>i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356=
">i915#17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16097/shard-dg2-8/igt@kms_big_fb@y-tiled-32bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i=
915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5190">i915#5190</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_big_fb@y-tiled-add=
fb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_big_fb@yf-tiled-addfb-size-offset=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-18=
0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4538">i915#4538</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_ccs=
@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#60=
95</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen=
12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-5/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/103=
07">i915#10307</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_ccs@bad-pixel-format-yf-ti=
led-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17356">i915#17356</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
2313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16097/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12313">i915#12313</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/12313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16097/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12805">i915#12805</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-ln=
l-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17345">i915#17345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tile=
d-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17356">i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@p=
ipe-b-edp-1.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17345">i915#17345</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-mtlp-6/igt@kms_ccs@crc-primary=
-suspend-4-tiled-mtl-rc-ccs@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-=
cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-y-=
tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-=
tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-cc=
s@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-3/igt@k=
ms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6=
095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe=
-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_ccs@crc-sprite-plan=
es-basic-yf-tiled-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#60=
95</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe=
-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_ccs=
@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#1=
4098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781">i915#137=
81</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_160=
97/shard-dg2-7/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-3/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427=
">i915#17427</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16097/shard-rkl-6/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17427">i915#17427</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17427">i915#17427</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16097/shard-rkl-5/igt@kms_chamelium_color@gamma.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427"=
>i915#17427</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i=
915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_chamelium_frame=
s@dp-crc-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-8/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc=
-multiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3=
hot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-3/igt@kms_chamelium=
_hpd@dp-hpd-after-runtime-suspend-d3hot.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-5/igt@kms_content_protection@content-type-change.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_content_protection@content-type-cha=
nge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17356">i915#17356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@kms_content_protection@dp-mst-type-0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1533=
0">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3299">i915#3299</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_content_protection@dp-mst-t=
ype-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_content_protection@dp-mst-type-1.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1735=
6">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16097/shard-dg2-3/igt@kms_content_protection@dp-mst-type-1.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-8/igt@kms_content_protection@dp-mst-type-1-suspend-resu=
me.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15330">i915#15330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_content_protection@dp-mst-=
type-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_content_protection@lic-type-0-hdcp14.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16097/shard-dg2-4/igt@kms_content_protection@lic-type-0-hdcp14.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_content_protection@mei-interface.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@kms_content_protection@mei-in=
terface.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/173=
56">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16097/shard-dg2-4/igt@kms_cursor_crc@cursor-offscreen-32x10.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_cursor_crc@cursor-onscr=
een-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16097/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-max-size.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17356">i915#17356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17428">i915#17428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-leg=
acy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17428">i915#17428</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transit=
ions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097=
/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-vary=
ing-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17356">i915#17356</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16097/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-a=
tomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@km=
s_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-si=
ze.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-3/igt@kms_display_modes@extended-mode-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/136=
91">i915#13691</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16097/shard-dg2-7/igt@kms_display_modes@extended-mode-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16097/shard-rkl-3/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17291">i915#17291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-mst-t=
btalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">=
i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16097/shard-dg2-4/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17288"=
>i915#17288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst-direct-train.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16097/shard-dg2-8/igt@kms_dp_link_training@non-uhbr-sst-d=
irect-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17286">i915#17286</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst-direct-train.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17286">i915#17286</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@kms_dp_link_trainin=
g@non-uhbr-sst-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17286">i915#17286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-5/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16867">i915#16867</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_dp_linktrain_fallback@uhbr-to-h=
br-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i=
915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16097/shard-dg2-5/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i9=
15#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16097/shard-rkl-2/igt@kms_dsc@dsc-basic-ultrajoiner.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16=
361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
097/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc-=
bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16680">i915#16680</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16097/shard-rkl-8/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680"=
>i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_fence_pin_leak.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shar=
d-dg2-5/igt@kms_fence_pin_leak.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16097/shard-rkl-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard=
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
/IGT_9177/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-=
a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/=
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
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_flip@2x-modeset=
-vs-vblank-race-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@k=
ms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/167=
08">i915#16708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shr=
fb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-8/igt@kms_frontbuffer_=
tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#151=
04</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15990">i915#15990</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrf=
b-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@km=
s_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1599=
0">i915#15990</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8708">i915#8708</a>) +18 other tests skip</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrf=
b-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/sha=
rd-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-g=
tt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pl=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_frontb=
uffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/535=
4">i915#5354</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/167=
08">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-t=
iling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/10055">i915#10055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-i=
ndfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_frontbuffe=
r_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#1=
6708</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-=
shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-5/igt@kms_frontbuffer_tr=
acking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>=
) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-s=
hrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@=
kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5354">i915#5354</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@km=
s_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428"=
>i915#17428</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-=
cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_frontbuffer=
_tracking@fbcpsr-rgb565-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +9 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
10055">i915#10055</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16097/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16097/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rt=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15102">i915#15102</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-flipt=
rack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_frontbuffer_tra=
cking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) =
+15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16708">i915#16708</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-ind=
fb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_frontbuffer_tr=
acking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>=
) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-suspend.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1670=
8">i915#16708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16097/shard-dg2-4/igt@kms_frontbuffer_tracking@hdr-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15989">i915#15989</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indf=
b-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_frontbuffer_tracking@p=
sr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) =
+10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pl=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#151=
02</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indf=
b-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15991">i915#15991</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_frontbuf=
fer_tracking@psr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i=
915#5354</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-6/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-indfb=
-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15991">i915#15991</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_frontbuffer_track=
ing@psrhdr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +30 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-s=
hrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-4/igt@kms_frontbuffer_=
tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#159=
91</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-tglu-9/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15840">i915#15840</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16097/shard-tglu-10/igt@kms_hdmi_audio_bw@suspend-disk-a=
udio-recovery.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17101">i915#17101</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17108">i915#17108</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17188">i915#17188</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#1=
2713</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/16518">i915#16518</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_hdr@brightness-with-hdr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/sha=
rd-dg2-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228=
">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#=
17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16097/shard-dg2-6/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451">i915#164=
51</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i9=
15#6301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16097/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i91=
5#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-snb5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-=
1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13356">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16097/shard-snb1/igt@kms_pipe_crc_basic@suspend=
-read-crc@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17752">i915#17752</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17763">i915#17763</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-glk2/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/118">i915#118</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16097/shard-glk8/igt@kms_pipe_stress@stress-xrgb8888-untiled.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modi=
fier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-7/=
igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-6/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097=
/shard-dg2-7/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">=
i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16097/shard-dg2-3/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958"=
>i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#=
14259</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16097/shard-dg2-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#173=
56</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16097/shard-rkl-7/igt@kms_pm_backlight@fade.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-4/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#652=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1609=
7/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">=
i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuou=
s-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-p=
lane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-8/igt@kms_psr@psr-primary-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16097/shard-rkl-6/igt@kms_psr@psr-primary-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1=
072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_psr@psr2-sprite-render.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#107=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_psr@psr2-sprite-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#1=
2755</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15867">i915#15867</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16097/shard-dg2-7/igt@kms_rotation_crc@bad-tiling.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
356">i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i91=
5#4235</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16097/shard-dg2-7/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#=
17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-6/igt@kms_rotation_crc@prima=
ry-y-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#=
5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356=
">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16097/shard-dg2-8/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12=
755">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15867">i915#15867</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-center.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@kms_scaling_modes@scaling-mode=
-center.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16097/shard-rkl-6/igt@kms_setmode@invalid-clone-exclusive-crtc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_tiled_display@basic-test-pattern-with-chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16097/shard-dg2-3/igt@kms_tiled_display@basic-test-p=
attern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-snb1/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15840">i915#15840</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16097/shard-snb5/igt@kms_vblank@ts-continuation-=
suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15840">i915#15840</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17752">i915#17752</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-3/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#990=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1609=
7/shard-dg2-7/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-3/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shard-dg2-=
7/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-3/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906=
">i915#9906</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16097/shard-dg2-7/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#173=
56</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2436">i915#2436</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-5/igt@perf@gen8-unprivileged-si=
ngle-ctx-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-4/igt@perf@unprivileged-single-ctx-counters.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/243=
3">i915#2433</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16097/shard-rkl-6/igt@perf@unprivileged-single-ctx-counters.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-2/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16097/shar=
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
/IGT_9177/shard-rkl-7/igt@prime_vgem@basic-write.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17448<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
91">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16097/shard-rkl-6/igt@prime_vgem@basic-write.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17448">i915#17448</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17448">i915#17448</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16097/shard-rkl-8/igt@prime_vgem@fence-write-h=
ang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17448">i915#17448</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9177 -&gt; IGTPW_16097</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19443: d11bbfdac0f3d443b367857ffe683ae6bb80d560 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_16097: 16097<br />
  IGT_9177: 9177</p>

</body>
</html>

--===============7492991824864534757==--
