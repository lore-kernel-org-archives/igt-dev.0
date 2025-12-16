Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0460D5C0C3
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 03:12:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D1510E639;
	Tue, 16 Dec 2025 03:12:49 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDE310E639;
 Tue, 16 Dec 2025 03:12:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1324508441743773681=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Switch_to_use_kernel_sta?=
 =?utf-8?q?ndard_fault_injection_in_i915_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 16 Dec 2025 03:12:48 -0000
Message-ID: <176585476853.91286.6852291244887156579@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251215134510.183735-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20251215134510.183735-1-juhapekka.heikkila@gmail.com>
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

--===============1324508441743773681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Switch to use kernel standard fault injection in i915 (rev7)
URL   : https://patchwork.freedesktop.org/series/155764/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_17687_full -> IGTPW_14210_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14210_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14210_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14210_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         NOTRUN -> [ABORT][1] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@i915_drm_fdinfo@context-close-stress:
    - shard-tglu:         [PASS][2] -> [SKIP][3] +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-4/igt@i915_drm_fdinfo@context-close-stress.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@i915_drm_fdinfo@context-close-stress.html

  * igt@i915_module_load@fault-injection@i915_driver_mmio_probe (NEW):
    - shard-tglu:         NOTRUN -> [FAIL][4] +5 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html
    - shard-glk:          NOTRUN -> [FAIL][5] +5 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk8/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html
    - shard-mtlp:         NOTRUN -> [FAIL][6] +10 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html

  * igt@i915_module_load@fault-injection@intel_connector_register (NEW):
    - shard-rkl:          NOTRUN -> [FAIL][7] +5 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@i915_module_load@fault-injection@intel_connector_register.html
    - shard-snb:          NOTRUN -> [FAIL][8] +5 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-snb7/igt@i915_module_load@fault-injection@intel_connector_register.html
    - shard-dg1:          NOTRUN -> [FAIL][9] +10 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@fault-injection@intel_gt_init-enodev (NEW):
    - shard-dg2:          NOTRUN -> [FAIL][10] +10 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@i915_module_load@fault-injection@intel_gt_init-enodev.html

  * igt@i915_module_load@fault-injection@uc_fw_rsa_data_create (NEW):
    - shard-tglu:         NOTRUN -> [SKIP][11] +4 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@i915_module_load@fault-injection@uc_fw_rsa_data_create.html

  * igt@i915_selftest@live:
    - shard-tglu:         [PASS][12] -> [INCOMPLETE][13] +1 other test incomplete
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-7/igt@i915_selftest@live.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-10/igt@i915_selftest@live.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-edp-1:
    - shard-mtlp:         [PASS][14] -> [FAIL][15] +5 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-edp-1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-edp-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][16] +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-dg2:          [PASS][17] -> [SKIP][18] +27 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-1/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg1:          [PASS][19] -> [SKIP][20] +35 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-15/igt@kms_flip@flip-vs-suspend-interruptible.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg1:          NOTRUN -> [SKIP][21] +6 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_invalid_mode@int-max-clock:
    - shard-mtlp:         [PASS][22] -> [SKIP][23] +32 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-5/igt@kms_invalid_mode@int-max-clock.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_invalid_mode@int-max-clock.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-rkl:          [PASS][24] -> [SKIP][25] +27 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@kms_rotation_crc@exhaust-fences.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_rotation_crc@exhaust-fences.html

  * igt@perf@gen12-oa-tlb-invalidate:
    - shard-rkl:          NOTRUN -> [SKIP][26] +7 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@perf@gen12-oa-tlb-invalidate.html

  * igt@syncobj_timeline@single-wait-for-submit-signaled:
    - shard-dg2:          NOTRUN -> [SKIP][27] +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@syncobj_timeline@single-wait-for-submit-signaled.html

  
#### Warnings ####

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          [SKIP][28] ([i915#4613]) -> [SKIP][29] +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-dg1:          [SKIP][30] ([i915#12193]) -> [SKIP][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-17/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-tglu:         [SKIP][32] ([i915#4613]) -> [SKIP][33] +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-mtlp:         [SKIP][34] ([i915#4613]) -> [SKIP][35] +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          [SKIP][36] ([i915#4212]) -> [SKIP][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@kms_addfb_basic@basic-x-tiled-legacy.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_addfb_basic@basic-x-tiled-legacy.html
    - shard-dg1:          [SKIP][38] ([i915#4212]) -> [SKIP][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-13/igt@kms_addfb_basic@basic-x-tiled-legacy.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_addfb_basic@basic-x-tiled-legacy.html
    - shard-mtlp:         [SKIP][40] ([i915#4212]) -> [SKIP][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-4/igt@kms_addfb_basic@basic-x-tiled-legacy.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg1:          [SKIP][42] ([i915#4538]) -> [SKIP][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-13/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-dg1:          [SKIP][44] ([i915#6095]) -> [SKIP][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-18/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-mtlp:         [SKIP][46] ([i915#6095]) -> [SKIP][47] +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          [SKIP][48] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
    - shard-mtlp:         [SKIP][50] ([i915#11151] / [i915#7828]) -> [SKIP][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
    - shard-dg2:          [SKIP][52] ([i915#11151] / [i915#7828]) -> [SKIP][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-3/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          [SKIP][54] ([i915#13049]) -> [SKIP][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-3/igt@kms_cursor_crc@cursor-random-512x512.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-rkl:          [SKIP][56] ([i915#13049]) -> [SKIP][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x512.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-dg1:          [SKIP][58] ([i915#13049]) -> [SKIP][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-15/igt@kms_cursor_crc@cursor-random-512x512.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-mtlp:         [SKIP][60] ([i915#13049]) -> [SKIP][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-5/igt@kms_cursor_crc@cursor-random-512x512.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-mtlp:         [SKIP][62] ([i915#9809]) -> [SKIP][63] +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
    - shard-dg2:          [SKIP][64] ([i915#13046] / [i915#5354]) -> [SKIP][65] +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-dg1:          [CRASH][66] ([i915#15351]) -> [SKIP][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-15/igt@kms_fb_coherency@memset-crc.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-rkl:          [INCOMPLETE][68] ([i915#6113]) -> [SKIP][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          [SKIP][70] ([i915#8708]) -> [SKIP][71] +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-mtlp:         [SKIP][72] ([i915#14712]) -> [SKIP][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-dg1:          [SKIP][74] ([i915#14712]) -> [SKIP][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-15/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg1:          [SKIP][76] ([i915#12343]) -> [SKIP][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-18/igt@kms_pm_backlight@brightness-with-dpms.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg1:          [SKIP][78] ([i915#9685]) -> [SKIP][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-12/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][80] ([i915#15073]) -> [SKIP][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
    - shard-dg1:          [SKIP][82] ([i915#15073]) -> [SKIP][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-13/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg1:          [SKIP][84] ([i915#11520]) -> [SKIP][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-13/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
    - shard-mtlp:         [SKIP][86] ([i915#12316]) -> [SKIP][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg1:          [SKIP][88] ([i915#9683]) -> [SKIP][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-13/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@pr-suspend:
    - shard-dg1:          [SKIP][90] ([i915#1072] / [i915#9732]) -> [SKIP][91] +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-12/igt@kms_psr@pr-suspend.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_psr@pr-suspend.html
    - shard-mtlp:         [SKIP][92] ([i915#9688]) -> [SKIP][93] +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-8/igt@kms_psr@pr-suspend.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_psr@pr-suspend.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg1:          [SKIP][94] ([i915#4884]) -> [SKIP][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-15/igt@kms_rotation_crc@exhaust-fences.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_rotation_crc@exhaust-fences.html
    - shard-mtlp:         [SKIP][96] ([i915#4235]) -> [SKIP][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-5/igt@kms_rotation_crc@exhaust-fences.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_rotation_crc@exhaust-fences.html
    - shard-dg2:          [SKIP][98] ([i915#4235]) -> [SKIP][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-3/igt@kms_rotation_crc@exhaust-fences.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-mtlp:         [SKIP][100] ([i915#12755]) -> [SKIP][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          [SKIP][102] ([i915#8516]) -> [SKIP][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-19/igt@perf_pmu@rc6-all-gts.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@perf_pmu@rc6-all-gts.html
    - shard-tglu:         [SKIP][104] ([i915#8516]) -> [SKIP][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-6/igt@perf_pmu@rc6-all-gts.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@perf_pmu@rc6-all-gts.html
    - shard-dg2:          [SKIP][106] ([i915#8516]) -> [SKIP][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-4/igt@perf_pmu@rc6-all-gts.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@perf_pmu@rc6-all-gts.html
    - shard-rkl:          [SKIP][108] ([i915#8516]) -> [SKIP][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@perf_pmu@rc6-all-gts.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@perf_pmu@rc6-all-gts.html

  
New tests
---------

  New tests have been introduced between CI_DRM_17687_full and IGTPW_14210_full:

### New IGT tests (11) ###

  * igt@i915_module_load@fault-injection:
    - Statuses : 7 fail(s)
    - Exec time: [60.28, 62.58] s

  * igt@i915_module_load@fault-injection@__fw_domain_init:
    - Statuses : 3 fail(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@i915_module_load@fault-injection@__uc_init:
    - Statuses : 3 fail(s) 4 skip(s)
    - Exec time: [0.0, 2.56] s

  * igt@i915_module_load@fault-injection@i915_driver_early_probe:
    - Statuses : 7 fail(s)
    - Exec time: [0.00, 0.02] s

  * igt@i915_module_load@fault-injection@i915_driver_hw_probe:
    - Statuses : 7 fail(s)
    - Exec time: [0.00, 0.02] s

  * igt@i915_module_load@fault-injection@i915_driver_mmio_probe:
    - Statuses : 7 fail(s)
    - Exec time: [0.00, 0.59] s

  * igt@i915_module_load@fault-injection@i915_pci_probe:
    - Statuses : 7 fail(s)
    - Exec time: [0.00, 0.02] s

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - Statuses : 7 fail(s)
    - Exec time: [0.00, 0.02] s

  * igt@i915_module_load@fault-injection@intel_gt_init-enodev:
    - Statuses : 3 fail(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@i915_module_load@fault-injection@intel_guc_ct_init:
    - Statuses : 3 fail(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@i915_module_load@fault-injection@uc_fw_rsa_data_create:
    - Statuses : 3 fail(s) 4 skip(s)
    - Exec time: [0.0, 0.52] s

  

Known issues
------------

  Here are the changes found in IGTPW_14210_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_allocator@reopen-fork:
    - shard-dg2:          [PASS][110] -> [SKIP][111] +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-1/igt@api_intel_allocator@reopen-fork.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@api_intel_allocator@reopen-fork.html

  * igt@api_intel_bb@reset-bb:
    - shard-mtlp:         [PASS][112] -> [SKIP][113] ([i915#2575]) +22 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-6/igt@api_intel_bb@reset-bb.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@api_intel_bb@reset-bb.html

  * igt@fbdev@info:
    - shard-dg2:          [PASS][114] -> [SKIP][115] ([i915#1849] / [i915#2582])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@fbdev@info.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@fbdev@info.html
    - shard-rkl:          [PASS][116] -> [SKIP][117] ([i915#1849] / [i915#2582])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@fbdev@info.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@fbdev@info.html
    - shard-snb:          [PASS][118] -> [SKIP][119] ([i915#1849])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-snb6/igt@fbdev@info.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-snb7/igt@fbdev@info.html
    - shard-dg1:          [PASS][120] -> [SKIP][121] ([i915#1849] / [i915#2582])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-15/igt@fbdev@info.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@fbdev@info.html
    - shard-tglu:         [PASS][122] -> [SKIP][123] ([i915#1849] / [i915#2582])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-5/igt@fbdev@info.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@fbdev@info.html
    - shard-glk:          NOTRUN -> [SKIP][124] ([i915#1849])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk8/igt@fbdev@info.html
    - shard-mtlp:         [PASS][125] -> [SKIP][126] ([i915#1849] / [i915#2582])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-6/igt@fbdev@info.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@fbdev@info.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#3936])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-3/igt@gem_busy@semaphore.html
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#3936])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-14/igt@gem_busy@semaphore.html
    - shard-mtlp:         NOTRUN -> [SKIP][129] ([i915#3936])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-8/igt@gem_busy@semaphore.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][130] ([i915#3555] / [i915#9323])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-mtlp:         NOTRUN -> [SKIP][131] ([i915#9323])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#14544] / [i915#9323])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#9323])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#9323])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][135] ([i915#13008])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [PASS][136] -> [INCOMPLETE][137] ([i915#12392] / [i915#13356])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-tglu-1:       NOTRUN -> [SKIP][138] ([i915#7697])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#6335])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-3/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu-1:       NOTRUN -> [SKIP][140] ([i915#8562])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][141] ([i915#1099]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-snb4/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#280])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          [PASS][143] -> [SKIP][144] +29 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-7/igt@gem_eio@in-flight-suspend.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#4812]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-19/igt@gem_exec_balancer@bonded-semaphore.html
    - shard-mtlp:         NOTRUN -> [SKIP][146] ([i915#4812])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@gem_exec_balancer@bonded-semaphore.html
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#4812])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#4525]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
    - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#4525])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#4525])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-3/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_big@single:
    - shard-tglu:         NOTRUN -> [ABORT][151] ([i915#11713])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-5/igt@gem_exec_big@single.html

  * igt@gem_exec_endless@dispatch@bcs0:
    - shard-dg1:          [PASS][152] -> [TIMEOUT][153] ([i915#3778]) +1 other test timeout
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-19/igt@gem_exec_endless@dispatch@bcs0.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-16/igt@gem_exec_endless@dispatch@bcs0.html

  * igt@gem_exec_fence@syncobj-timeline-unused-fence:
    - shard-dg2:          [PASS][154] -> [SKIP][155] ([i915#2575]) +17 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-5/igt@gem_exec_fence@syncobj-timeline-unused-fence.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@gem_exec_fence@syncobj-timeline-unused-fence.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#3539])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-15/igt@gem_exec_flush@basic-uc-prw-default.html
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#3539])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-3/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#3539] / [i915#4852])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-11/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#3539] / [i915#4852]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-14/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_reloc@basic-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#3281]) +2 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-11/igt@gem_exec_reloc@basic-cpu.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#3281])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#2575])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@gem_exec_reloc@basic-softpin.html
    - shard-mtlp:         NOTRUN -> [SKIP][163] ([i915#2575])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#2575]) +4 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-write-cpu-active:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#3281]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-17/igt@gem_exec_reloc@basic-write-cpu-active.html
    - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#3281]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@gem_exec_reloc@basic-write-cpu-active.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [PASS][167] -> [INCOMPLETE][168] ([i915#13356]) +1 other test incomplete
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-3/igt@gem_exec_suspend@basic-s0@smem.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-3/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#4860])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@too-many-fences:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#4860])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-16/igt@gem_fenced_exec_thrash@too-many-fences.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][171] ([i915#2190])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#4613] / [i915#7582])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-5/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#4613]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-3/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-glk:          NOTRUN -> [SKIP][174] ([i915#4613]) +7 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk8/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-tglu-1:       NOTRUN -> [SKIP][175] ([i915#4613])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#4613]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-3/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@verify:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#4613]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-3/igt@gem_lmem_swapping@verify.html

  * igt@gem_mmap_gtt@basic-small-bo:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#4077]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-8/igt@gem_mmap_gtt@basic-small-bo.html
    - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#4077]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-3/igt@gem_mmap_gtt@basic-small-bo.html

  * igt@gem_mmap_gtt@close-race:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#4077]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@gem_mmap_gtt@close-race.html

  * igt@gem_mmap_offset@oob-read:
    - shard-tglu:         [PASS][181] -> [SKIP][182] ([i915#2575]) +58 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-9/igt@gem_mmap_offset@oob-read.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@gem_mmap_offset@oob-read.html

  * igt@gem_mmap_wc@pf-nonblock:
    - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#4083])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@gem_mmap_wc@pf-nonblock.html
    - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#4083])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@gem_mmap_wc@pf-nonblock.html

  * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#4083]) +5 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-13/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#3282]) +2 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-15/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#3282]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@display:
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#3282]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-8/igt@gem_pread@display.html
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#3282])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-11/igt@gem_pread@display.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> [WARN][190] ([i915#14702] / [i915#2658])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk5/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#4270]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-14/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#13717])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-buffer.html
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#13398])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-3/igt@gem_pxp@hw-rejects-pxp-buffer.html
    - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#13398])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-8/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#4270]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_render_copy@y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#5190] / [i915#8428])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-7/igt@gem_render_copy@y-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-x-tiled:
    - shard-dg1:          [PASS][197] -> [SKIP][198] ([i915#2575]) +17 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-18/igt@gem_render_copy@y-tiled-ccs-to-x-tiled.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@gem_render_copy@y-tiled-ccs-to-x-tiled.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#8428])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-3/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#4079])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-18/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#3297])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-3/igt@gem_userptr_blits@readonly-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#3297]) +2 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-14/igt@gem_userptr_blits@readonly-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#3297])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-8/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglu-1:       NOTRUN -> [SKIP][204] ([i915#3297]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-rkl:          NOTRUN -> [ABORT][205] ([i915#15131])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-1/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#2856])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-3/igt@gen9_exec_parse@basic-rejected-ctx-param.html
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#2856])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-1/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#2527]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-tglu-1:       NOTRUN -> [SKIP][209] ([i915#2527] / [i915#2856]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#2527] / [i915#2856])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-4/igt@gen9_exec_parse@secure-batches.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#14544] / [i915#2527])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_drm_fdinfo@all-busy-check-all:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#14123])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-8/igt@i915_drm_fdinfo@all-busy-check-all.html

  * igt@i915_drm_fdinfo@busy-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#11527]) +5 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-17/igt@i915_drm_fdinfo@busy-check-all.html

  * igt@i915_drm_fdinfo@busy-check-all@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#11527]) +6 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@i915_drm_fdinfo@busy-check-all@ccs0.html

  * igt@i915_drm_fdinfo@busy-check-all@vecs0:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#11527]) +7 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-1/igt@i915_drm_fdinfo@busy-check-all@vecs0.html

  * igt@i915_drm_fdinfo@busy@rcs0:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#14073]) +5 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-13/igt@i915_drm_fdinfo@busy@rcs0.html

  * igt@i915_drm_fdinfo@context-close-stress:
    - shard-glk:          [PASS][217] -> [SKIP][218] +16 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-glk6/igt@i915_drm_fdinfo@context-close-stress.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk8/igt@i915_drm_fdinfo@context-close-stress.html

  * igt@i915_drm_fdinfo@virtual-busy-idle-all:
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#14118])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-18/igt@i915_drm_fdinfo@virtual-busy-idle-all.html

  * igt@i915_module_load@fault-injection@intel_guc_ct_init (NEW):
    - shard-snb:          NOTRUN -> [SKIP][220] +124 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-snb7/igt@i915_module_load@fault-injection@intel_guc_ct_init.html

  * igt@i915_module_load@reload-no-display:
    - shard-dg2:          [PASS][221] -> [DMESG-WARN][222] ([i915#13029] / [i915#14545])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@i915_module_load@reload-no-display.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-7/igt@i915_module_load@reload-no-display.html
    - shard-dg1:          [PASS][223] -> [DMESG-WARN][224] ([i915#13029] / [i915#14545])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-15/igt@i915_module_load@reload-no-display.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-13/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu-1:       NOTRUN -> [SKIP][225] ([i915#8399])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#14544] / [i915#8399])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#6590]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-17/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_freq_mult@media-freq@gt1:
    - shard-mtlp:         NOTRUN -> [SKIP][228] ([i915#6590]) +2 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@i915_pm_freq_mult@media-freq@gt1.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#14498] / [i915#14544])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#11681] / [i915#6621])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-18/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#11681])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-4/igt@i915_pm_rps@thresholds-idle.html
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#11681])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-15/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_selftest@live@workarounds:
    - shard-dg2:          [PASS][233] -> [DMESG-FAIL][234] ([i915#12061]) +1 other test dmesg-fail
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-1/igt@i915_selftest@live@workarounds.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-11/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-glk:          [PASS][235] -> [INCOMPLETE][236] ([i915#4817])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-glk1/igt@i915_suspend@basic-s3-without-i915.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk6/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@sysfs-reader:
    - shard-rkl:          [PASS][237] -> [ABORT][238] ([i915#15140])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-7/igt@i915_suspend@sysfs-reader.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_addfb_basic@bad-pitch-999:
    - shard-snb:          [PASS][239] -> [SKIP][240] +49 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-snb1/igt@kms_addfb_basic@bad-pitch-999.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-snb7/igt@kms_addfb_basic@bad-pitch-999.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu:         NOTRUN -> [SKIP][241] ([i915#12454] / [i915#12712])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#12454] / [i915#12712])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#12454] / [i915#12712] / [i915#14544])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-mtlp:         NOTRUN -> [FAIL][244] ([i915#15313]) +2 other tests fail
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-3/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#9531])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-13/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#9531])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][247] ([i915#1769])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#1769] / [i915#3555])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-tglu-1:       NOTRUN -> [SKIP][249] ([i915#5286]) +3 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][250] ([i915#5286])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#5286]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#5286])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-19/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#4538] / [i915#5286]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [PASS][254] -> [FAIL][255] ([i915#5138]) +1 other test fail
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#3638]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#14544] / [i915#3638])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#3638]) +3 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][259] +7 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][260] +14 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][261] +13 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#4538] / [i915#5190]) +4 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#5190]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-mtlp:         NOTRUN -> [SKIP][264] ([i915#6187])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][265] ([i915#4538]) +3 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#10307] / [i915#6095]) +110 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-11/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-3.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#14544] / [i915#6095]) +3 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#14098] / [i915#14544] / [i915#6095]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#6095]) +131 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-17/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#6095]) +37 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][271] ([i915#6095]) +49 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][272] ([i915#6095]) +39 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#6095]) +69 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#12805] / [i915#14544])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#12805])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#12805])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-rkl:          [PASS][277] -> [INCOMPLETE][278] ([i915#12796])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][279] ([i915#12796])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][280] ([i915#12796]) +1 other test incomplete
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][281] ([i915#14098] / [i915#6095]) +40 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#12313]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#6095]) +14 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-5/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#12313])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#2575]) +10 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#13781]) +3 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#3742])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-6/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#13783]) +3 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#11151] / [i915#7828]) +4 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#11151] / [i915#14544] / [i915#7828])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#11151] / [i915#7828]) +4 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-1/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#11151] / [i915#7828]) +4 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-tglu-1:       NOTRUN -> [SKIP][293] ([i915#11151] / [i915#7828]) +3 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#11151] / [i915#7828]) +3 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#11151] / [i915#7828]) +6 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-19/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_color@deep-color:
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#12655] / [i915#3555])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@kms_color@deep-color.html
    - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#12655] / [i915#3555])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_color@deep-color.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][298] ([i915#3116] / [i915#3299])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#15330])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-14/igt@kms_content_protection@dp-mst-suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#15330])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-9/igt@kms_content_protection@dp-mst-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#3116])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-dg1:          NOTRUN -> [SKIP][302] ([i915#6944] / [i915#7116] / [i915#9424])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-16/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-tglu:         NOTRUN -> [SKIP][303] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu:         [PASS][304] -> [FAIL][305] ([i915#13566]) +3 other tests fail
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][306] ([i915#3555]) +3 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][307] ([i915#13049]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][308] ([i915#3555]) +4 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-rkl:          NOTRUN -> [FAIL][309] ([i915#13566]) +2 other tests fail
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@kms_cursor_crc@cursor-random-64x21.html
    - shard-mtlp:         NOTRUN -> [SKIP][310] ([i915#8814])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-8/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][311] ([i915#13049]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#13049])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][313] ([i915#13049]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-13/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-mtlp:         NOTRUN -> [SKIP][314] ([i915#13049])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-6/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg2:          NOTRUN -> [SKIP][315] ([i915#13049])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-rkl:          [PASS][316] -> [FAIL][317] ([i915#13566]) +6 other tests fail
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][318] ([i915#12358] / [i915#14152] / [i915#7882])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk2/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][319] ([i915#12358] / [i915#14152])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#4103])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][321] ([i915#4103]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-dg1:          NOTRUN -> [SKIP][322] ([i915#4103] / [i915#4213])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#9723])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#3555]) +2 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-16/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#14544] / [i915#3804])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          [PASS][326] -> [SKIP][327] ([i915#3555])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg1:          NOTRUN -> [SKIP][328] ([i915#13749])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-15/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          NOTRUN -> [SKIP][329] ([i915#13748])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][330] ([i915#8812])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-17/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-tglu-1:       NOTRUN -> [SKIP][331] ([i915#3840]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][332] ([i915#3555] / [i915#3840])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_dsc@dsc-with-formats.html
    - shard-dg2:          NOTRUN -> [SKIP][333] ([i915#3555] / [i915#3840])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@kms_dsc@dsc-with-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][334] ([i915#3555] / [i915#3840])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][335] ([i915#14544] / [i915#3955])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2:          NOTRUN -> [SKIP][336] ([i915#1839])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#9337])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@kms_feature_discovery@dp-mst.html
    - shard-dg1:          NOTRUN -> [SKIP][338] ([i915#9337])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_feature_discovery@dp-mst.html
    - shard-mtlp:         NOTRUN -> [SKIP][339] ([i915#9337])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg1:          NOTRUN -> [SKIP][340] ([i915#658])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-16/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu-1:       NOTRUN -> [SKIP][341] ([i915#658])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-rkl:          NOTRUN -> [SKIP][342] ([i915#9934]) +3 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][343] ([i915#3637] / [i915#9934]) +2 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
    - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#9934]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-3/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][345] ([i915#12314] / [i915#12745] / [i915#4839])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][346] ([i915#12314] / [i915#4839])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#14544] / [i915#9934])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_flip@2x-plain-flip.html
    - shard-dg1:          NOTRUN -> [SKIP][348] ([i915#9934]) +4 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][349] ([i915#3637] / [i915#9934]) +6 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][350] ([i915#3637] / [i915#9934]) +3 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][351] ([i915#12745] / [i915#4839] / [i915#6113])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][352] ([i915#12745] / [i915#6113])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][353] ([i915#2587] / [i915#2672]) +2 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][354] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#2672] / [i915#3555]) +1 other test skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][356] ([i915#2672] / [i915#8813]) +1 other test skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][357] ([i915#2587] / [i915#2672]) +2 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
    - shard-dg2:          NOTRUN -> [SKIP][358] ([i915#2672]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][359] ([i915#2587] / [i915#2672]) +2 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][360] ([i915#2587] / [i915#2672] / [i915#3555])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][361] ([i915#2672] / [i915#3555]) +2 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][362] ([i915#2672] / [i915#3555]) +2 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][363] ([i915#2672] / [i915#3555]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][364] ([i915#2672] / [i915#3555])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][365] ([i915#2672])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][366] +29 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][367] ([i915#1825]) +15 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][368] ([i915#1825]) +16 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][369] +32 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][370] +38 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][371] ([i915#8708]) +9 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-dg2:          [PASS][372] -> [FAIL][373] ([i915#6880])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][374] ([i915#10056])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk10/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-rkl:          NOTRUN -> [INCOMPLETE][375] ([i915#10056])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][376] ([i915#15102]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][377] ([i915#5354]) +17 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][378] ([i915#14544] / [i915#1825]) +5 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][379] ([i915#15102] / [i915#3458]) +10 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][380] ([i915#15102] / [i915#3023]) +9 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html
    - shard-tglu-1:       NOTRUN -> [SKIP][381] ([i915#15102]) +17 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][382] ([i915#15102]) +12 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][383] ([i915#15102]) +2 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][384] ([i915#15102]) +2 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][385] ([i915#8708]) +2 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][386] ([i915#15102] / [i915#3458]) +4 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][387] ([i915#8708]) +5 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][388] ([i915#3555] / [i915#8228])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_hdr@bpc-switch-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][389] ([i915#3555] / [i915#8228])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][390] ([i915#12713])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu-1:       NOTRUN -> [SKIP][391] ([i915#12713])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          [PASS][392] -> [SKIP][393] ([i915#3555] / [i915#8228])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-11/igt@kms_hdr@static-toggle.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-7/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][394] ([i915#12388])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-4/igt@kms_joiner@basic-force-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][395] ([i915#12388])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_joiner@basic-force-big-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][396] ([i915#12388])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-4/igt@kms_joiner@basic-force-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][397] ([i915#12388])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-18/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][398] ([i915#10656])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][399] ([i915#10656])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][400] ([i915#12394])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-16/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][401] ([i915#12394])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-10/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][402] ([i915#10656])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][403] ([i915#12339])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][404] ([i915#6301])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-7/igt@kms_panel_fitting@legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][405] ([i915#6301])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-14/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][406] ([i915#3555] / [i915#8821])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-3/igt@kms_plane_lowres@tiling-yf.html
    - shard-tglu:         NOTRUN -> [SKIP][407] ([i915#3555]) +1 other test skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_plane_lowres@tiling-yf.html
    - shard-mtlp:         NOTRUN -> [SKIP][408] ([i915#3555] / [i915#8821])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-8/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][409] ([i915#13958])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2:          NOTRUN -> [SKIP][410] ([i915#13958])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-none.html
    - shard-dg1:          NOTRUN -> [SKIP][411] ([i915#13958])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:
    - shard-dg1:          NOTRUN -> [SKIP][412] ([i915#15329]) +9 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-19/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][413] ([i915#15329]) +4 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d:
    - shard-mtlp:         NOTRUN -> [SKIP][414] ([i915#15329]) +8 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-mtlp:         NOTRUN -> [SKIP][415] ([i915#15329] / [i915#6953])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade:
    - shard-dg1:          NOTRUN -> [SKIP][416] ([i915#5354])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-17/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2:          NOTRUN -> [SKIP][417] ([i915#9685]) +1 other test skip
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [PASS][418] -> [SKIP][419] ([i915#15073])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][420] ([i915#15073])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [PASS][421] -> [SKIP][422] ([i915#15073]) +1 other test skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-dg2:          [PASS][423] -> [INCOMPLETE][424] ([i915#14419])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-3/igt@kms_pm_rpm@system-suspend-idle.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-4/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu-1:       NOTRUN -> [SKIP][425] ([i915#6524])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][426] ([i915#11520]) +4 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-snb7/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][427] ([i915#11520]) +5 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
    - shard-glk10:        NOTRUN -> [SKIP][428] ([i915#11520]) +1 other test skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk10/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][429] ([i915#9808])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][430] ([i915#12316]) +2 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg1:          NOTRUN -> [SKIP][431] ([i915#11520]) +4 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-13/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][432] ([i915#11520]) +4 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][433] ([i915#11520] / [i915#14544])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][434] ([i915#11520]) +10 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk8/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][435] ([i915#11520]) +4 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][436] ([i915#11520]) +2 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-dg2:          NOTRUN -> [SKIP][437] ([i915#1072] / [i915#9732]) +10 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-1/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][438] ([i915#9732]) +14 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html

  * igt@kms_psr@pr-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][439] ([i915#9688]) +7 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_psr@pr-basic.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][440] ([i915#1072] / [i915#9732]) +12 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][441] ([i915#9732]) +9 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-5/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][442] ([i915#1072] / [i915#9732]) +15 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-19/igt@kms_psr@psr2-sprite-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][443] ([i915#4077] / [i915#9688]) +1 other test skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-8/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][444] +532 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk5/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][445] ([i915#9685]) +1 other test skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-14/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][446] ([i915#9685])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][447] ([i915#12755] / [i915#5190])
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][448] ([i915#5289])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-dg1:          NOTRUN -> [SKIP][449] ([i915#5289])
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-tglu:         NOTRUN -> [SKIP][450] ([i915#5289]) +1 other test skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-mtlp:         NOTRUN -> [SKIP][451] ([i915#5289])
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-mtlp:         NOTRUN -> [SKIP][452] ([i915#12755])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@kms_rotation_crc@sprite-rotation-270.html
    - shard-dg2:          NOTRUN -> [SKIP][453] ([i915#12755])
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_setmode@basic:
    - shard-tglu-1:       NOTRUN -> [FAIL][454] ([i915#15106]) +2 other tests fail
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_setmode@basic.html
    - shard-dg1:          NOTRUN -> [FAIL][455] ([i915#15106]) +2 other tests fail
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-19/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-rkl:          [PASS][456] -> [FAIL][457] ([i915#15106]) +2 other tests fail
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [FAIL][458] ([i915#15106]) +2 other tests fail
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@basic@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [FAIL][459] ([i915#15106]) +2 other tests fail
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][460] ([i915#3555]) +1 other test skip
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-glk:          NOTRUN -> [FAIL][461] ([i915#10959])
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk6/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][462] ([i915#8623])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][463] ([i915#8623])
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-19/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@query-idle-hang:
    - shard-dg1:          [PASS][464] -> [DMESG-WARN][465] ([i915#4423]) +1 other test dmesg-warn
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-12/igt@kms_vblank@query-idle-hang.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-17/igt@kms_vblank@query-idle-hang.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][466] ([i915#12276]) +1 other test incomplete
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk5/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][467] ([i915#15243] / [i915#3555])
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@negative-basic:
    - shard-mtlp:         [PASS][468] -> [FAIL][469] ([i915#15420]) +1 other test fail
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-6/igt@kms_vrr@negative-basic.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-tglu:         NOTRUN -> [SKIP][470] ([i915#9906])
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-6/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-dg2:          NOTRUN -> [SKIP][471] ([i915#2436])
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-dg1:          NOTRUN -> [SKIP][472] ([i915#2433])
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-14/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@semaphore-busy@bcs0:
    - shard-mtlp:         [PASS][473] -> [FAIL][474] ([i915#4349]) +5 other tests fail
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-5/igt@perf_pmu@semaphore-busy@bcs0.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-6/igt@perf_pmu@semaphore-busy@bcs0.html

  * igt@perf_pmu@semaphore-busy@vcs1:
    - shard-dg1:          [PASS][475] -> [FAIL][476] ([i915#4349]) +3 other tests fail
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-15/igt@perf_pmu@semaphore-busy@vcs1.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-18/igt@perf_pmu@semaphore-busy@vcs1.html

  * igt@prime_vgem@basic-read:
    - shard-mtlp:         NOTRUN -> [SKIP][477] ([i915#3708])
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-8/igt@prime_vgem@basic-read.html
    - shard-dg2:          NOTRUN -> [SKIP][478] ([i915#3291] / [i915#3708])
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-3/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - shard-dg1:          NOTRUN -> [SKIP][479] ([i915#3708]) +1 other test skip
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-13/igt@prime_vgem@basic-write.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-glk10:        NOTRUN -> [SKIP][480] +88 other tests skip
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk10/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg1:          NOTRUN -> [SKIP][481] ([i915#9917]) +1 other test skip
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-17/igt@sriov_basic@enable-vfs-bind-unbind-each.html
    - shard-dg2:          NOTRUN -> [SKIP][482] ([i915#9917])
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-1/igt@sriov_basic@enable-vfs-bind-unbind-each.html
    - shard-rkl:          NOTRUN -> [SKIP][483] ([i915#9917])
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-1/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-tglu:         NOTRUN -> [FAIL][484] ([i915#12910]) +9 other tests fail
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4:
    - shard-mtlp:         NOTRUN -> [FAIL][485] ([i915#12910]) +8 other tests fail
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][486] ([i915#14544]) +1 other test skip
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@i915_pm_rps@waitboost:
    - shard-mtlp:         [FAIL][487] ([i915#15365]) -> [PASS][488]
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-2/igt@i915_pm_rps@waitboost.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-8/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-dg1:          [DMESG-WARN][489] ([i915#4391] / [i915#4423]) -> [PASS][490]
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-13/igt@i915_suspend@basic-s3-without-i915.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@debugfs-reader:
    - shard-rkl:          [ABORT][491] ([i915#15131]) -> [PASS][492]
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-1/igt@i915_suspend@debugfs-reader.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@i915_suspend@debugfs-reader.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [FAIL][493] ([i915#5138]) -> [PASS][494]
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-tglu:         [FAIL][495] ([i915#13566]) -> [PASS][496] +1 other test pass
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-5/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-128x42.html
    - shard-rkl:          [FAIL][497] ([i915#13566]) -> [PASS][498]
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-dg2:          [FAIL][499] ([i915#6880]) -> [PASS][500]
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          [SKIP][501] ([i915#3555] / [i915#8228]) -> [PASS][502]
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_hdr@bpc-switch-dpms.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [SKIP][503] ([i915#15073]) -> [PASS][504] +1 other test pass
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [SKIP][505] ([i915#15073]) -> [PASS][506]
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@perf_pmu@rc6-suspend:
    - shard-rkl:          [INCOMPLETE][507] ([i915#13520]) -> [PASS][508]
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@perf_pmu@rc6-suspend.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@perf_pmu@rc6-suspend.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-rkl:          [SKIP][509] ([i915#14544] / [i915#8411]) -> [SKIP][510] ([i915#8411])
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@api_intel_bb@blit-reloc-keep-cache.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@gem_bad_reloc@negative-reloc-bltcopy:
    - shard-mtlp:         [SKIP][511] ([i915#3281]) -> [SKIP][512] ([i915#2575]) +1 other test skip
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-4/igt@gem_bad_reloc@negative-reloc-bltcopy.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@gem_bad_reloc@negative-reloc-bltcopy.html
    - shard-dg2:          [SKIP][513] ([i915#3281]) -> [SKIP][514] ([i915#2575]) +1 other test skip
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-7/igt@gem_bad_reloc@negative-reloc-bltcopy.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@gem_bad_reloc@negative-reloc-bltcopy.html
    - shard-dg1:          [SKIP][515] ([i915#3281]) -> [SKIP][516] ([i915#2575])
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-19/igt@gem_bad_reloc@negative-reloc-bltcopy.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@gem_bad_reloc@negative-reloc-bltcopy.html

  * igt@gem_caching@reads:
    - shard-mtlp:         [SKIP][517] ([i915#4873]) -> [SKIP][518] ([i915#2575])
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-3/igt@gem_caching@reads.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@gem_caching@reads.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          [SKIP][519] ([i915#3555] / [i915#9323]) -> [SKIP][520] ([i915#14544] / [i915#3555] / [i915#9323])
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@gem_ccs@block-multicopy-inplace.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-rkl:          [SKIP][521] ([i915#6335]) -> [SKIP][522] ([i915#14544] / [i915#6335])
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@gem_create@create-ext-cpu-access-big.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_persistence@hang:
    - shard-mtlp:         [SKIP][523] ([i915#8555]) -> [SKIP][524] ([i915#2575])
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-6/igt@gem_ctx_persistence@hang.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@gem_ctx_persistence@hang.html
    - shard-dg2:          [SKIP][525] ([i915#8555]) -> [SKIP][526] ([i915#2575])
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-3/igt@gem_ctx_persistence@hang.html
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@gem_ctx_persistence@hang.html
    - shard-dg1:          [SKIP][527] ([i915#8555]) -> [SKIP][528] ([i915#2575])
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-16/igt@gem_ctx_persistence@hang.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@gem_ctx_persistence@hang.html
    - shard-snb:          [SKIP][529] ([i915#1099]) -> [SKIP][530]
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-snb6/igt@gem_ctx_persistence@hang.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-snb7/igt@gem_ctx_persistence@hang.html

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          [INCOMPLETE][531] ([i915#13390]) -> [SKIP][532]
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-glk5/igt@gem_eio@in-flight-suspend.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk8/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-rkl:          [SKIP][533] ([i915#4525]) -> [SKIP][534] ([i915#14544] / [i915#4525]) +1 other test skip
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          [SKIP][535] ([i915#6344]) -> [SKIP][536] ([i915#14544] / [i915#6344])
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@gem_exec_capture@capture-recoverable.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-rkl:          [SKIP][537] ([i915#3281]) -> [SKIP][538] +2 other tests skip
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@gem_exec_reloc@basic-softpin.html
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          [SKIP][539] ([i915#14544] / [i915#3281]) -> [SKIP][540] ([i915#3281])
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_reloc@basic-write-wc-noreloc:
    - shard-rkl:          [SKIP][541] ([i915#3281]) -> [SKIP][542] ([i915#14544] / [i915#3281])
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@gem_exec_reloc@basic-write-wc-noreloc.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@gem_exec_reloc@basic-write-wc-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg1:          [SKIP][543] ([i915#4812]) -> [SKIP][544] ([i915#2575])
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-14/igt@gem_exec_schedule@preempt-queue-contexts.html
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@gem_exec_schedule@preempt-queue-contexts.html
    - shard-mtlp:         [SKIP][545] ([i915#4537] / [i915#4812]) -> [SKIP][546] ([i915#2575])
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-2/igt@gem_exec_schedule@preempt-queue-contexts.html
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@gem_exec_schedule@preempt-queue-contexts.html
    - shard-dg2:          [SKIP][547] ([i915#4537] / [i915#4812]) -> [SKIP][548] ([i915#2575])
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-7/igt@gem_exec_schedule@preempt-queue-contexts.html
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-rkl:          [SKIP][549] ([i915#4613]) -> [SKIP][550] ([i915#14544] / [i915#4613]) +1 other test skip
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@gem_lmem_swapping@heavy-verify-multi.html
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@massive:
    - shard-rkl:          [SKIP][551] ([i915#14544] / [i915#4613]) -> [SKIP][552] ([i915#4613]) +1 other test skip
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@gem_lmem_swapping@massive.html
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@gem_lmem_swapping@massive.html

  * igt@gem_mmap_gtt@big-bo:
    - shard-dg1:          [SKIP][553] ([i915#4077]) -> [SKIP][554] ([i915#2575])
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-17/igt@gem_mmap_gtt@big-bo.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@gem_mmap_gtt@big-bo.html
    - shard-mtlp:         [SKIP][555] ([i915#4077]) -> [SKIP][556] ([i915#2575])
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-4/igt@gem_mmap_gtt@big-bo.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@gem_mmap_gtt@big-bo.html
    - shard-dg2:          [SKIP][557] ([i915#4077]) -> [SKIP][558] ([i915#2575])
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-8/igt@gem_mmap_gtt@big-bo.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@gem_mmap_gtt@big-bo.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-rkl:          [SKIP][559] ([i915#3282]) -> [SKIP][560] ([i915#14544] / [i915#3282]) +4 other tests skip
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@gem_partial_pwrite_pread@reads-uncached.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-rkl:          [SKIP][561] ([i915#14544] / [i915#3282]) -> [SKIP][562] ([i915#3282])
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@gem_partial_pwrite_pread@write-display.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-dg2:          [SKIP][563] ([i915#4270]) -> [SKIP][564] ([i915#2575])
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-4/igt@gem_pxp@create-regular-context-2.html
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@gem_pxp@create-regular-context-2.html
    - shard-dg1:          [SKIP][565] ([i915#4270]) -> [SKIP][566] ([i915#2575])
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-13/igt@gem_pxp@create-regular-context-2.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          [SKIP][567] ([i915#13717]) -> [SKIP][568] ([i915#13717] / [i915#14544])
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-context.html
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_render_copy@y-tiled-ccs-to-x-tiled:
    - shard-mtlp:         [SKIP][569] ([i915#8428]) -> [SKIP][570] ([i915#2575]) +1 other test skip
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-3/igt@gem_render_copy@y-tiled-ccs-to-x-tiled.html
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@gem_render_copy@y-tiled-ccs-to-x-tiled.html
    - shard-dg2:          [SKIP][571] ([i915#5190] / [i915#8428]) -> [SKIP][572] ([i915#2575] / [i915#5190]) +1 other test skip
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-4/igt@gem_render_copy@y-tiled-ccs-to-x-tiled.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@gem_render_copy@y-tiled-ccs-to-x-tiled.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          [SKIP][573] ([i915#3297] / [i915#3323]) -> [SKIP][574] ([i915#14544] / [i915#3297] / [i915#3323])
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-1/igt@gem_userptr_blits@dmabuf-sync.html
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          [SKIP][575] ([i915#14544] / [i915#3297]) -> [SKIP][576] ([i915#3297]) +3 other tests skip
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-cycles.html
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-3/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen3_mixed_blits:
    - shard-dg2:          [SKIP][577] -> [SKIP][578] ([i915#2575])
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@gen3_mixed_blits.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@gen3_mixed_blits.html
    - shard-dg1:          [SKIP][579] -> [SKIP][580] ([i915#2575])
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-13/igt@gen3_mixed_blits.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@gen3_mixed_blits.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-rkl:          [SKIP][581] ([i915#14544] / [i915#2527]) -> [SKIP][582] ([i915#2527]) +1 other test skip
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@gen9_exec_parse@batch-invalid-length.html
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          [SKIP][583] ([i915#2527]) -> [SKIP][584] ([i915#14544] / [i915#2527]) +2 other tests skip
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@gen9_exec_parse@bb-oversize.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@gen9_exec_parse@bb-oversize.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          [SKIP][585] ([i915#11681] / [i915#6621]) -> [SKIP][586] ([i915#2575])
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-15/igt@i915_pm_rps@basic-api.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@i915_pm_rps@basic-api.html
    - shard-mtlp:         [SKIP][587] ([i915#11681] / [i915#6621]) -> [SKIP][588] ([i915#2575])
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-6/igt@i915_pm_rps@basic-api.html
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@i915_pm_rps@basic-api.html
    - shard-dg2:          [SKIP][589] ([i915#11681] / [i915#6621]) -> [SKIP][590] ([i915#2575])
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@i915_pm_rps@basic-api.html
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@thresholds:
    - shard-mtlp:         [SKIP][591] ([i915#11681]) -> [SKIP][592] ([i915#2575])
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-4/igt@i915_pm_rps@thresholds.html
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@i915_pm_rps@thresholds.html
    - shard-dg2:          [SKIP][593] ([i915#11681]) -> [SKIP][594] ([i915#2575])
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-11/igt@i915_pm_rps@thresholds.html
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@i915_pm_rps@thresholds.html

  * igt@i915_power@sanity:
    - shard-rkl:          [SKIP][595] ([i915#7984]) -> [SKIP][596] ([i915#14544] / [i915#7984])
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-2/igt@i915_power@sanity.html
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@i915_power@sanity.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg1:          [SKIP][597] ([i915#4212]) -> [SKIP][598] ([i915#4212] / [i915#4423])
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-19/igt@kms_addfb_basic@clobberred-modifier.html
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-17/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-rkl:          [SKIP][599] ([i915#1769] / [i915#3555]) -> [SKIP][600] ([i915#14544] / [i915#1769] / [i915#3555])
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-rkl:          [SKIP][601] ([i915#5286]) -> [SKIP][602] ([i915#14544] / [i915#5286]) +3 other tests skip
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg1:          [SKIP][603] ([i915#4538] / [i915#5286]) -> [SKIP][604] ([i915#4423] / [i915#4538] / [i915#5286])
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-14/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-13/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          [SKIP][605] ([i915#14544] / [i915#5286]) -> [SKIP][606] ([i915#5286])
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-rkl:          [SKIP][607] ([i915#14544] / [i915#3638]) -> [SKIP][608] ([i915#3638])
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-mtlp:         [SKIP][609] -> [SKIP][610] ([i915#2575]) +3 other tests skip
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-2/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          [SKIP][611] ([i915#3638]) -> [SKIP][612] ([i915#14544] / [i915#3638]) +2 other tests skip
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2:          [SKIP][613] ([i915#4538] / [i915#5190]) -> [SKIP][614] ([i915#5190]) +2 other tests skip
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          [SKIP][615] -> [SKIP][616] ([i915#14544]) +7 other tests skip
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs:
    - shard-rkl:          [SKIP][617] ([i915#14098] / [i915#6095]) -> [SKIP][618] ([i915#14098] / [i915#14544] / [i915#6095]) +13 other tests skip
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
    - shard-dg2:          [SKIP][619] ([i915#10307] / [i915#6095]) -> [SKIP][620] +1 other test skip
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][621] ([i915#14544] / [i915#6095]) -> [SKIP][622] ([i915#6095]) +5 other tests skip
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][623] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][624] ([i915#14098] / [i915#6095]) +6 other tests skip
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-rkl:          [SKIP][625] ([i915#14098] / [i915#6095]) -> [SKIP][626]
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][627] ([i915#12313]) -> [SKIP][628] ([i915#12313] / [i915#14544]) +1 other test skip
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu:         [SKIP][629] ([i915#6095]) -> [SKIP][630] ([i915#2575]) +1 other test skip
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
    - shard-dg2:          [SKIP][631] ([i915#6095]) -> [SKIP][632]
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
    - shard-rkl:          [SKIP][633] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][634]
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][635] ([i915#6095]) -> [SKIP][636] ([i915#14544] / [i915#6095]) +11 other tests skip
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-dg1:          [SKIP][637] ([i915#11151] / [i915#4423] / [i915#7828]) -> [SKIP][638] ([i915#11151] / [i915#7828])
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-15/igt@kms_chamelium_audio@hdmi-audio.html
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-17/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - shard-rkl:          [SKIP][639] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][640] ([i915#11151] / [i915#7828]) +1 other test skip
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_chamelium_edid@dp-edid-read.html
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-3/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-dg1:          [SKIP][641] ([i915#11151] / [i915#7828]) -> [SKIP][642] ([i915#11151] / [i915#4423] / [i915#7828])
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-18/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-13/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          [SKIP][643] ([i915#11151] / [i915#7828]) -> [SKIP][644] ([i915#11151] / [i915#14544] / [i915#7828]) +4 other tests skip
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-tglu:         [SKIP][645] ([i915#11151] / [i915#7828]) -> [SKIP][646] ([i915#2575])
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-2/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@legacy:
    - shard-rkl:          [SKIP][647] ([i915#14544] / [i915#6944] / [i915#7118] / [i915#9424]) -> [SKIP][648] ([i915#6944] / [i915#7118] / [i915#9424])
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_content_protection@legacy.html
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          [SKIP][649] ([i915#9433]) -> [SKIP][650] ([i915#6944] / [i915#9424])
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-13/igt@kms_content_protection@mei-interface.html
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-15/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@suspend-resume:
    - shard-rkl:          [SKIP][651] ([i915#6944]) -> [SKIP][652] ([i915#14544] / [i915#6944])
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_content_protection@suspend-resume.html
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@uevent:
    - shard-rkl:          [SKIP][653] ([i915#6944] / [i915#7118] / [i915#9424]) -> [SKIP][654] ([i915#14544] / [i915#6944] / [i915#7118] / [i915#9424]) +1 other test skip
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_content_protection@uevent.html
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-rkl:          [SKIP][655] ([i915#13049] / [i915#14544]) -> [SKIP][656] ([i915#13049]) +1 other test skip
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-tglu:         [SKIP][657] ([i915#13049]) -> [SKIP][658] ([i915#2575])
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-9/igt@kms_cursor_crc@cursor-random-512x512.html
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          [SKIP][659] ([i915#3555]) -> [SKIP][660] ([i915#14544] / [i915#3555]) +2 other tests skip
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-rkl:          [SKIP][661] ([i915#14544] / [i915#3555]) -> [SKIP][662] ([i915#3555]) +1 other test skip
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          [SKIP][663] ([i915#14544] / [i915#4103]) -> [SKIP][664] ([i915#4103])
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          [SKIP][665] ([i915#14544]) -> [SKIP][666] +6 other tests skip
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-rkl:          [SKIP][667] ([i915#4103]) -> [SKIP][668] ([i915#14544] / [i915#4103])
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          [SKIP][669] ([i915#9723]) -> [SKIP][670] ([i915#14544] / [i915#9723])
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          [SKIP][671] ([i915#3555] / [i915#3804]) -> [SKIP][672] ([i915#14544] / [i915#3555] / [i915#3804])
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-rkl:          [SKIP][673] ([i915#13749] / [i915#14544]) -> [SKIP][674] ([i915#13749])
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-rkl:          [SKIP][675] ([i915#3555] / [i915#3840]) -> [SKIP][676] ([i915#14544] / [i915#3555] / [i915#3840]) +1 other test skip
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-2/igt@kms_dsc@dsc-with-bpc-formats.html
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-dg2:          [CRASH][677] ([i915#15351]) -> [SKIP][678]
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-1/igt@kms_fb_coherency@memset-crc.html
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_fb_coherency@memset-crc.html
    - shard-rkl:          [CRASH][679] ([i915#15351]) -> [SKIP][680]
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_fb_coherency@memset-crc.html
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_fb_coherency@memset-crc.html
    - shard-snb:          [CRASH][681] ([i915#15351]) -> [SKIP][682]
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-snb5/igt@kms_fb_coherency@memset-crc.html
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-snb7/igt@kms_fb_coherency@memset-crc.html
    - shard-tglu:         [CRASH][683] ([i915#15351]) -> [SKIP][684] ([i915#2575])
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-3/igt@kms_fb_coherency@memset-crc.html
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_fb_coherency@memset-crc.html
    - shard-glk:          [CRASH][685] ([i915#15351]) -> [SKIP][686]
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-glk8/igt@kms_fb_coherency@memset-crc.html
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk8/igt@kms_fb_coherency@memset-crc.html
    - shard-mtlp:         [CRASH][687] ([i915#15351]) -> [SKIP][688] ([i915#2575])
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-5/igt@kms_fb_coherency@memset-crc.html
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          [SKIP][689] ([i915#9337]) -> [SKIP][690] ([i915#14544] / [i915#9337])
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_feature_discovery@dp-mst.html
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-rkl:          [SKIP][691] ([i915#14544] / [i915#658]) -> [SKIP][692] ([i915#658])
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_feature_discovery@psr1.html
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          [SKIP][693] ([i915#9934]) -> [SKIP][694] ([i915#14544] / [i915#9934]) +3 other tests skip
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          [SKIP][695] ([i915#14544] / [i915#9934]) -> [SKIP][696] ([i915#9934]) +2 other tests skip
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_flip@2x-plain-flip-interruptible.html
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-rkl:          [SKIP][697] ([i915#2672] / [i915#3555]) -> [SKIP][698] ([i915#14544] / [i915#2672] / [i915#3555])
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-rkl:          [SKIP][699] ([i915#2672]) -> [SKIP][700] ([i915#14544] / [i915#2672])
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-mtlp:         [SKIP][701] ([i915#3555] / [i915#8810] / [i915#8813]) -> [SKIP][702] ([i915#2575])
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][703] ([i915#8708]) -> [SKIP][704] +2 other tests skip
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          [SKIP][705] ([i915#8708]) -> [SKIP][706] ([i915#4423] / [i915#8708])
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-mtlp:         [SKIP][707] ([i915#1825]) -> [SKIP][708] ([i915#2575]) +9 other tests skip
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-rkl:          [SKIP][709] ([i915#1825]) -> [SKIP][710] +8 other tests skip
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-rkl:          [SKIP][711] ([i915#14544] / [i915#1825]) -> [SKIP][712] ([i915#1825]) +11 other tests skip
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][713] ([i915#15102]) -> [SKIP][714] ([i915#14544] / [i915#15102]) +2 other tests skip
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-dg2:          [SKIP][715] ([i915#15102]) -> [SKIP][716]
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
    - shard-rkl:          [SKIP][717] ([i915#15102]) -> [SKIP][718]
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg1:          [SKIP][719] ([i915#4423] / [i915#8708]) -> [SKIP][720] ([i915#8708])
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-rkl:          [SKIP][721] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][722] ([i915#15102] / [i915#3023]) +3 other tests skip
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][723] ([i915#5354]) -> [SKIP][724] +9 other tests skip
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:
    - shard-rkl:          [SKIP][725] ([i915#14544] / [i915#15102]) -> [SKIP][726] ([i915#15102]) +2 other tests skip
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][727] ([i915#10433] / [i915#15102] / [i915#3458]) -> [SKIP][728] ([i915#15102] / [i915#3458]) +5 other tests skip
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][729] ([i915#15102] / [i915#3458]) -> [SKIP][730]
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
    - shard-rkl:          [SKIP][731] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][732]
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
    - shard-tglu:         [SKIP][733] ([i915#15102]) -> [SKIP][734] ([i915#2575]) +1 other test skip
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
    - shard-rkl:          [SKIP][735] ([i915#15102] / [i915#3023]) -> [SKIP][736] ([i915#14544] / [i915#15102] / [i915#3023]) +6 other tests skip
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-tglu:         [SKIP][737] -> [SKIP][738] ([i915#2575]) +14 other tests skip
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-rkl:          [SKIP][739] ([i915#1825]) -> [SKIP][740] ([i915#14544] / [i915#1825]) +20 other tests skip
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite.html
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg1:          [SKIP][741] ([i915#4423]) -> [SKIP][742]
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:
    - shard-rkl:          [SKIP][743] ([i915#15102] / [i915#3023]) -> [SKIP][744]
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html
    - shard-mtlp:         [SKIP][745] ([i915#8708]) -> [SKIP][746] ([i915#2575]) +1 other test skip
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          [SKIP][747] ([i915#12713]) -> [SKIP][748] ([i915#13331])
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-3/igt@kms_hdr@brightness-with-hdr.html
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-11/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-rkl:          [SKIP][749] ([i915#12394]) -> [SKIP][750] ([i915#12394] / [i915#14544])
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_joiner@basic-force-ultra-joiner.html
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-rkl:          [SKIP][751] ([i915#15283]) -> [SKIP][752] ([i915#14544] / [i915#15283])
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-7/igt@kms_joiner@basic-max-non-joiner.html
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          [SKIP][753] ([i915#6301]) -> [SKIP][754] ([i915#14544] / [i915#6301])
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@kms_panel_fitting@atomic-fastset.html
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-tglu:         [SKIP][755] ([i915#14712]) -> [SKIP][756] ([i915#2575])
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-dg2:          [SKIP][757] ([i915#14712]) -> [SKIP][758]
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-1/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-rkl:          [SKIP][759] ([i915#13958]) -> [SKIP][760] ([i915#13958] / [i915#14544]) +1 other test skip
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-none.html
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-rkl:          [SKIP][761] ([i915#15329]) -> [SKIP][762] ([i915#14544] / [i915#15329]) +3 other tests skip
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          [SKIP][763] ([i915#5354]) -> [SKIP][764] ([i915#14544] / [i915#5354])
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_pm_backlight@bad-brightness.html
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          [SKIP][765] ([i915#12343]) -> [SKIP][766]
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_pm_backlight@brightness-with-dpms.html
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2:          [SKIP][767] ([i915#12343]) -> [SKIP][768]
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@kms_pm_backlight@brightness-with-dpms.html
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2:          [SKIP][769] ([i915#9685]) -> [SKIP][770]
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-8/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-rkl:          [SKIP][771] ([i915#9685]) -> [SKIP][772]
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-tglu:         [SKIP][773] ([i915#9685]) -> [SKIP][774] ([i915#2575])
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-mtlp:         [SKIP][775] ([i915#9292]) -> [SKIP][776] ([i915#2575])
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-7/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          [SKIP][777] ([i915#9685]) -> [SKIP][778] ([i915#14544] / [i915#9685])
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-1/igt@kms_pm_dc@dc5-psr.html
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][779] ([i915#3828]) -> [SKIP][780] ([i915#9340])
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          [SKIP][781] ([i915#11520] / [i915#14544]) -> [SKIP][782] ([i915#11520]) +1 other test skip
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-rkl:          [SKIP][783] ([i915#11520]) -> [SKIP][784] ([i915#11520] / [i915#14544]) +5 other tests skip
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][785] ([i915#11520]) -> [SKIP][786]
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
    - shard-snb:          [SKIP][787] ([i915#11520]) -> [SKIP][788]
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-snb1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-snb7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
    - shard-tglu:         [SKIP][789] ([i915#11520]) -> [SKIP][790] ([i915#2575])
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-10/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
    - shard-dg2:          [SKIP][791] ([i915#11520]) -> [SKIP][792]
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-mtlp:         [SKIP][793] ([i915#4348]) -> [SKIP][794] ([i915#2575])
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-dg2:          [SKIP][795] ([i915#9683]) -> [SKIP][796]
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-rkl:          [SKIP][797] ([i915#9683]) -> [SKIP][798]
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-tglu:         [SKIP][799] ([i915#9683]) -> [SKIP][800] ([i915#2575])
   [799]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-9/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [800]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-rkl:          [SKIP][801] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][802] ([i915#1072] / [i915#9732]) +5 other tests skip
   [801]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-blt.html
   [802]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          [SKIP][803] ([i915#1072] / [i915#9732]) -> [SKIP][804] +2 other tests skip
   [803]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_psr@fbc-psr2-sprite-render.html
   [804]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr-cursor-mmap-gtt:
    - shard-tglu:         [SKIP][805] ([i915#9732]) -> [SKIP][806] ([i915#2575]) +2 other tests skip
   [805]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-5/igt@kms_psr@psr-cursor-mmap-gtt.html
   [806]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_psr@psr-cursor-mmap-gtt.html
    - shard-dg2:          [SKIP][807] ([i915#1072] / [i915#9732]) -> [SKIP][808] +2 other tests skip
   [807]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@kms_psr@psr-cursor-mmap-gtt.html
   [808]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_psr@psr-cursor-mmap-gtt.html

  * igt@kms_psr@psr2-suspend:
    - shard-rkl:          [SKIP][809] ([i915#1072] / [i915#9732]) -> [SKIP][810] ([i915#1072] / [i915#14544] / [i915#9732]) +13 other tests skip
   [809]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@kms_psr@psr2-suspend.html
   [810]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          [SKIP][811] ([i915#12755] / [i915#5190]) -> [SKIP][812] ([i915#5190])
   [811]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [812]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg1:          [SKIP][813] ([i915#3555] / [i915#4423]) -> [SKIP][814] ([i915#3555])
   [813]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-19/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [814]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-18/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          [SKIP][815] ([i915#14544] / [i915#8623]) -> [SKIP][816] ([i915#8623])
   [815]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [816]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic:
    - shard-rkl:          [SKIP][817] ([i915#14544] / [i915#15243] / [i915#3555]) -> [SKIP][818] ([i915#15243] / [i915#3555])
   [817]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_vrr@flip-basic.html
   [818]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-3/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-dpms:
    - shard-rkl:          [SKIP][819] ([i915#15243] / [i915#3555]) -> [SKIP][820] ([i915#14544] / [i915#15243] / [i915#3555])
   [819]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-2/igt@kms_vrr@flip-dpms.html
   [820]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_vrr@flip-dpms.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          [SKIP][821] ([i915#2433]) -> [SKIP][822] ([i915#14544] / [i915#2433])
   [821]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@perf@unprivileged-single-ctx-counters.html
   [822]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@perf@unprivileged-single-ctx-counters.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          [SKIP][823] ([i915#14544] / [i915#3291] / [i915#3708]) -> [SKIP][824] ([i915#3291] / [i915#3708])
   [823]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@prime_vgem@basic-write.html
   [824]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-3/igt@prime_vgem@basic-write.html

  
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10959]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12392]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392
  [i915#12394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13331]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13331
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13783]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15106]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15140]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15283]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15283
  [i915#15313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15313
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15351]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15351
  [i915#15365]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15365
  [i915#15420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15420
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
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
  [i915#3778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3778
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3936]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
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
  [i915#4873]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4873
  [i915#4884]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
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
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#9292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9292
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8666 -> IGTPW_14210
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_17687: 89b7f1ac50d51d9c2334e119fe40de41b366333f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14210: 14210
  IGT_8666: 8666
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/index.html

--===============1324508441743773681==
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
<tr><td><b>Series:</b></td><td>Switch to use kernel standard fault injection in i915 (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155764/">https://patchwork.freedesktop.org/series/155764/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_17687_full -&gt; IGTPW_14210_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14210_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_14210_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_14210_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_mmap_offset@clear-via-pagefault:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@gem_mmap_offset@clear-via-pagefault.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@context-close-stress:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-4/igt@i915_drm_fdinfo@context-close-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@i915_drm_fdinfo@context-close-stress.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@i915_driver_mmio_probe (NEW):</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html">FAIL</a> +5 other tests fail</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk8/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html">FAIL</a> +5 other tests fail</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register (NEW):</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@i915_module_load@fault-injection@intel_connector_register.html">FAIL</a> +5 other tests fail</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-snb7/igt@i915_module_load@fault-injection@intel_connector_register.html">FAIL</a> +5 other tests fail</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@i915_module_load@fault-injection@intel_connector_register.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_gt_init-enodev (NEW):</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@i915_module_load@fault-injection@intel_gt_init-enodev.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@uc_fw_rsa_data_create (NEW):</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@i915_module_load@fault-injection@uc_fw_rsa_data_create.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-7/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-10/igt@i915_selftest@live.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-edp-1.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-1/igt@kms_flip@absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_flip@absolute-wf_vblank-interruptible.html">SKIP</a> +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-15/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</a> +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-5/igt@kms_invalid_mode@int-max-clock.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_invalid_mode@int-max-clock.html">SKIP</a> +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@kms_rotation_crc@exhaust-fences.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-oa-tlb-invalidate:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@single-wait-for-submit-signaled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@syncobj_timeline@single-wait-for-submit-signaled.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> +1 other test skip</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-17/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193">i915#12193</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a></li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> +1 other test skip</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a></li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-13/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-4/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-13/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-18/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a></li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-3/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-3/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a></li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a></li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-15/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-5/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> +2 other tests skip</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-15/igt@kms_fb_coherency@memset-crc.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15351">i915#15351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_fb_coherency@memset-crc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a></li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-15/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-18/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-12/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a></li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-13/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-13/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-13/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-12/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_psr@pr-suspend.html">SKIP</a> +2 other tests skip</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-8/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_psr@pr-suspend.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-15/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884">i915#4884</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-5/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i915#4235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a></li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-3/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i915#4235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-19/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@perf_pmu@rc6-all-gts.html">SKIP</a></li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-6/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@perf_pmu@rc6-all-gts.html">SKIP</a></li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-4/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@perf_pmu@rc6-all-gts.html">SKIP</a></li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@perf_pmu@rc6-all-gts.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_17687_full and IGTPW_14210_full:</p>
<h3>New IGT tests (11)</h3>
<ul>
<li>
<p>igt@i915_module_load@fault-injection:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [60.28, 62.58] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__fw_domain_init:</p>
<ul>
<li>Statuses : 3 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>Statuses : 3 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.56] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@i915_driver_early_probe:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@i915_driver_hw_probe:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@i915_driver_mmio_probe:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.00, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@i915_pci_probe:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_gt_init-enodev:</p>
<ul>
<li>Statuses : 3 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_guc_ct_init:</p>
<ul>
<li>Statuses : 3 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@uc_fw_rsa_data_create:</p>
<ul>
<li>Statuses : 3 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.52] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14210_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_allocator@reopen-fork:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-1/igt@api_intel_allocator@reopen-fork.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@api_intel_allocator@reopen-fork.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@reset-bb:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-6/igt@api_intel_bb@reset-bb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@api_intel_bb@reset-bb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-snb6/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-snb7/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-15/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-5/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk8/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-6/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-3/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936">i915#3936</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-14/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936">i915#3936</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-8/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936">i915#3936</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#13008</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392">i915#12392</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-3/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-snb4/igt@gem_ctx_persistence@smoketest.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-7/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@gem_eio@in-flight-suspend.html">SKIP</a> +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-semaphore:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-19/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-3/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-5/igt@gem_exec_big@single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713">i915#11713</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-19/igt@gem_exec_endless@dispatch@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-16/igt@gem_exec_endless@dispatch@bcs0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3778">i915#3778</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-timeline-unused-fence:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-5/igt@gem_exec_fence@syncobj-timeline-unused-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@gem_exec_fence@syncobj-timeline-unused-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-15/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-3/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-11/igt@gem_exec_flush@basic-wb-prw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-before-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-14/igt@gem_exec_flush@basic-wb-rw-before-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-11/igt@gem_exec_reloc@basic-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-softpin:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-17/igt@gem_exec_reloc@basic-write-cpu-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@gem_exec_reloc@basic-write-cpu-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-3/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-3/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@gem_fence_thrash@bo-write-verify-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@too-many-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-16/igt@gem_fenced_exec_thrash@too-many-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-5/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-3/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk8/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-3/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-3/igt@gem_lmem_swapping@verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-8/igt@gem_mmap_gtt@basic-small-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-3/igt@gem_mmap_gtt@basic-small-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@close-race:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@gem_mmap_gtt@close-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@oob-read:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-9/igt@gem_mmap_offset@oob-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@gem_mmap_offset@oob-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +58 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@pf-nonblock:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@gem_mmap_wc@pf-nonblock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@gem_mmap_wc@pf-nonblock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-cpu-read-wc-unflushed:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-13/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-15/igt@gem_partial_pwrite_pread@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@display:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-8/igt@gem_pread@display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-11/igt@gem_pread@display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk5/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702">i915#14702</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-14/igt@gem_pxp@create-protected-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-3/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398">i915#13398</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-8/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-7/igt@gem_render_copy@y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-x-tiled:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-18/igt@gem_render_copy@y-tiled-ccs-to-x-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@gem_render_copy@y-tiled-ccs-to-x-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-3/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-18/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-3/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-14/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-8/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-1/igt@gem_workarounds@suspend-resume-context.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-3/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-1/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-4/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-8/igt@i915_drm_fdinfo@all-busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-17/igt@i915_drm_fdinfo@busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527">i915#11527</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all@ccs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@i915_drm_fdinfo@busy-check-all@ccs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527">i915#11527</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all@vecs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-1/igt@i915_drm_fdinfo@busy-check-all@vecs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527">i915#11527</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@rcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-13/igt@i915_drm_fdinfo@busy@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@context-close-stress:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-glk6/igt@i915_drm_fdinfo@context-close-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk8/igt@i915_drm_fdinfo@context-close-stress.html">SKIP</a> +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-18/igt@i915_drm_fdinfo@virtual-busy-idle-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_guc_ct_init (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-snb7/igt@i915_module_load@fault-injection@intel_guc_ct_init.html">SKIP</a> +124 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@i915_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-7/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-15/igt@i915_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-13/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-17/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@i915_pm_freq_mult@media-freq@gt1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-18/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-4/igt@i915_pm_rps@thresholds-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-15/igt@i915_pm_rps@thresholds-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-1/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-glk1/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk6/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-7/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-1/igt@i915_suspend@sysfs-reader.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140">i915#15140</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-999:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-snb1/igt@kms_addfb_basic@bad-pitch-999.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-snb7/igt@kms_addfb_basic@bad-pitch-999.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-3/igt@kms_async_flips@invalid-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15313">i915#15313</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-13/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-19/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187">i915#6187</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-11/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +110 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-17/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +131 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796">i915#12796</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796">i915#12796</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796">i915#12796</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-5/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781">i915#13781</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-6/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783">i915#13783</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-1/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-19/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-14/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-9/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-16/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-4/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-256x85.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@kms_cursor_crc@cursor-random-64x21.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +2 other tests fail</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-8/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-13/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-6/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-64x21.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-64x21.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk2/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882">i915#7882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-16/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-15/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-17/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9337</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9337</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9337</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-16/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-3/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk1/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> +38 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk10/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +9 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-11/igt@kms_hdr@static-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-7/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-4/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-4/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-18/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-16/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-10/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-7/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-14/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-3/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-8/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-19/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-17/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-7/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-3/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-4/igt@kms_pm_rpm@system-suspend-idle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#14419</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-snb7/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk10/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-13/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk8/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-1/igt@kms_psr@fbc-psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@kms_psr@psr2-cursor-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-5/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-19/igt@kms_psr@psr2-sprite-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +15 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-8/igt@kms_psr@psr2-sprite-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk5/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> +532 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-14/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i915#15106</a>) +2 other tests fail</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-19/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i915#15106</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i915#15106</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i915#15106</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i915#15106</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk6/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959">i915#10959</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-19/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-12/igt@kms_vblank@query-idle-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-17/igt@kms_vblank@query-idle-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk5/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-6/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_vrr@negative-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15420">i915#15420</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-5/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-14/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-5/igt@perf_pmu@semaphore-busy@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-6/igt@perf_pmu@semaphore-busy@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vcs1:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-15/igt@perf_pmu@semaphore-busy@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-18/igt@perf_pmu@semaphore-busy@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-8/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-3/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-13/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk10/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> +88 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-17/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-1/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-1/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910">i915#12910</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-2/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910">i915#12910</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-2/igt@i915_pm_rps@waitboost.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15365">i915#15365</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-8/igt@i915_pm_rps@waitboost.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-13/igt@i915_suspend@basic-s3-without-i915.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391">i915#4391</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-1/igt@i915_suspend@debugfs-reader.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@i915_suspend@debugfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-5/igt@kms_cursor_crc@cursor-sliding-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-128x42.html">PASS</a> +1 other test pass</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_hdr@bpc-switch-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520">i915#13520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@perf_pmu@rc6-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-bltcopy:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-4/igt@gem_bad_reloc@negative-reloc-bltcopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@gem_bad_reloc@negative-reloc-bltcopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-7/igt@gem_bad_reloc@negative-reloc-bltcopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@gem_bad_reloc@negative-reloc-bltcopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-19/igt@gem_bad_reloc@negative-reloc-bltcopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@gem_bad_reloc@negative-reloc-bltcopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_caching@reads:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-3/igt@gem_caching@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4873">i915#4873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@gem_caching@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-6/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-3/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-16/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-snb6/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-snb7/igt@gem_ctx_persistence@hang.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-glk5/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390">i915#13390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk8/igt@gem_eio@in-flight-suspend.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344">i915#6344</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-softpin:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-noreloc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@gem_exec_reloc@basic-write-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@gem_exec_reloc@basic-write-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-14/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-2/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-7/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@gem_lmem_swapping@massive.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@gem_lmem_swapping@massive.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-bo:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-17/igt@gem_mmap_gtt@big-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@gem_mmap_gtt@big-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-4/igt@gem_mmap_gtt@big-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@gem_mmap_gtt@big-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-8/igt@gem_mmap_gtt@big-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@gem_mmap_gtt@big-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-display:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@gem_partial_pwrite_pread@write-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@gem_partial_pwrite_pread@write-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-4/igt@gem_pxp@create-regular-context-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@gem_pxp@create-regular-context-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-13/igt@gem_pxp@create-regular-context-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@gem_pxp@create-regular-context-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-x-tiled:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-3/igt@gem_render_copy@y-tiled-ccs-to-x-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@gem_render_copy@y-tiled-ccs-to-x-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-4/igt@gem_render_copy@y-tiled-ccs-to-x-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@gem_render_copy@y-tiled-ccs-to-x-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-1/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-3/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@gen3_mixed_blits.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@gen3_mixed_blits.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-13/igt@gen3_mixed_blits.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@gen3_mixed_blits.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-15/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-12/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-4/igt@i915_pm_rps@thresholds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@i915_pm_rps@thresholds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-11/igt@i915_pm_rps@thresholds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@i915_pm_rps@thresholds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-2/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-19/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-17/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-14/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-13/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-2/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a></li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-15/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-17/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-3/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-18/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-13/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-2/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-13/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433">i915#9433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-15/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-9/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-2/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-1/igt@kms_fb_coherency@memset-crc.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15351">i915#15351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_fb_coherency@memset-crc.html">SKIP</a></li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_fb_coherency@memset-crc.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15351">i915#15351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_fb_coherency@memset-crc.html">SKIP</a></li>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-snb5/igt@kms_fb_coherency@memset-crc.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15351">i915#15351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-snb7/igt@kms_fb_coherency@memset-crc.html">SKIP</a></li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-3/igt@kms_fb_coherency@memset-crc.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15351">i915#15351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_fb_coherency@memset-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-glk8/igt@kms_fb_coherency@memset-crc.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15351">i915#15351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-glk8/igt@kms_fb_coherency@memset-crc.html">SKIP</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-5/igt@kms_fb_coherency@memset-crc.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15351">i915#15351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_fb_coherency@memset-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9337</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a></li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a></li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a></li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html">SKIP</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-11/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13331">i915#13331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-7/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15283">i915#15283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15283">i915#15283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-1/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a></li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-8/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a></li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a></li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9292">i915#9292</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-1/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a></li>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-snb1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-snb7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a></li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-10/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348">i915#4348</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-mtlp-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a></li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a></li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-9/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-5/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-8/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-mmap-gtt:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-5/igt@kms_psr@psr-cursor-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-tglu-8/igt@kms_psr@psr-cursor-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@kms_psr@psr-cursor-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_psr@psr-cursor-mmap-gtt.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg2-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-19/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-dg1-18/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-3/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-2/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-8/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433">i915#2433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-6/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14210/shard-rkl-3/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8666 -&gt; IGTPW_14210</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17687: 89b7f1ac50d51d9c2334e119fe40de41b366333f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14210: 14210<br />
  IGT_8666: 8666<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============1324508441743773681==--
