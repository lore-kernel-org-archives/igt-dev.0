Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A90E668A1
	for <igt-dev@archiver.kernel.org>; Sun, 24 Nov 2024 08:17:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7623310E49E;
	Sun, 24 Nov 2024 08:17:21 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5893310E49E;
 Sun, 24 Nov 2024 08:17:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/xe=5Feudebug=5Fonl?=
 =?utf-8?q?ine=3A_update_thread_count_handling_in_query=5Fattention=5Fbitmas?=
 =?utf-8?q?k=5Fsize=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jan Maslak" <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 24 Nov 2024 08:17:20 -0000
Message-ID: <173243624036.2385959.615031198807395955@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241120222850.1497784-1-jan.maslak@intel.com>
In-Reply-To: <20241120222850.1497784-1-jan.maslak@intel.com>
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

== Series Details ==

Series: tests/xe_eudebug_online: update thread count handling in query_attention_bitmask_size() (rev2)
URL   : https://patchwork.freedesktop.org/series/141366/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15724_full -> IGTPW_12152_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12152_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12152_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/index.html

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): pig-kbl-iris 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12152_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-2/igt@core_setmaster@master-drop-set-user.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@core_setmaster@master-drop-set-user.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-12/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_exec_gttfill@all-engines:
    - shard-rkl:          [PASS][4] -> [DMESG-WARN][5] +35 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-3/igt@gem_exec_gttfill@all-engines.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-7/igt@gem_exec_gttfill@all-engines.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][6] +11 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-10/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg1:          [PASS][7] -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg1-14/igt@kms_hdmi_inject@inject-audio.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-12/igt@kms_hdmi_inject@inject-audio.html
    - shard-tglu:         [PASS][9] -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-3/igt@kms_hdmi_inject@inject-audio.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@pixel-format:
    - shard-tglu:         [PASS][11] -> [ABORT][12] +1 other test abort
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-4/igt@kms_plane@pixel-format.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-8/igt@kms_plane@pixel-format.html

  * igt@kms_plane_multiple@tiling-none@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][13] +6 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-7/igt@kms_plane_multiple@tiling-none@pipe-b-hdmi-a-1.html

  * igt@perf@create-destroy-userspace-config:
    - shard-dg2:          [PASS][14] -> [SKIP][15] +4 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-5/igt@perf@create-destroy-userspace-config.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@perf@create-destroy-userspace-config.html

  
#### Warnings ####

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-rkl:          [SKIP][16] ([i915#4270]) -> [TIMEOUT][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-5/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-2/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_softpin@noreloc-s3:
    - shard-rkl:          [DMESG-WARN][18] ([i915#12964]) -> [INCOMPLETE][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-1/igt@gem_softpin@noreloc-s3.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-5/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          [DMESG-FAIL][20] ([i915#12964]) -> [FAIL][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-1/igt@gem_tiled_swapping@non-threaded.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-2/igt@gem_tiled_swapping@non-threaded.html
    - shard-snb:          [FAIL][22] ([i915#12941]) -> [FAIL][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-snb1/igt@gem_tiled_swapping@non-threaded.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-snb4/igt@gem_tiled_swapping@non-threaded.html
    - shard-tglu:         [FAIL][24] ([i915#12941]) -> [FAIL][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-7/igt@gem_tiled_swapping@non-threaded.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-4/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         [ABORT][26] -> [DMESG-WARN][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-5/igt@i915_module_load@reload-no-display.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-10/igt@i915_module_load@reload-no-display.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2:          [SKIP][28] ([i915#2575]) -> [SKIP][29] +4 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-1/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2:          [SKIP][30] ([i915#5354]) -> [SKIP][31] +8 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-5/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - {shard-dg2-9}:      NOTRUN -> [SKIP][32] +6 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-9/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15724_full and IGTPW_12152_full:

### New IGT tests (1) ###

  * igt@kms_dirtyfb@default-dirtyfb-ioctl@a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  

Known issues
------------

  Here are the changes found in IGTPW_12152_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#6230])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-2/igt@api_intel_bb@crc32.html
    - shard-tglu:         NOTRUN -> [SKIP][34] ([i915#6230])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-4/igt@api_intel_bb@crc32.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2:          [PASS][35] -> [FAIL][36] ([i915#12909])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-3/igt@core_setmaster@master-drop-set-root.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@core_setmaster@master-drop-set-root.html

  * igt@debugfs_test@basic-hwmon:
    - shard-rkl:          NOTRUN -> [SKIP][37] ([i915#9318])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-7/igt@debugfs_test@basic-hwmon.html

  * igt@drm_fdinfo@busy-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#8414]) +9 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-1/igt@drm_fdinfo@busy-check-all@vecs1.html

  * igt@drm_fdinfo@isolation@vecs0:
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#8414]) +14 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-14/igt@drm_fdinfo@isolation@vecs0.html

  * igt@fbdev@write:
    - shard-dg2:          [PASS][40] -> [SKIP][41] ([i915#2582])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-7/igt@fbdev@write.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@fbdev@write.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#9323])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-3/igt@gem_ccs@block-multicopy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#9323])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-18/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][44] ([i915#9323])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-9/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][45] ([i915#3555] / [i915#9323])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-7/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-tglu-1:       NOTRUN -> [SKIP][46] ([i915#9323])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][47] -> [INCOMPLETE][48] ([i915#7297])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-2/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][49] ([i915#6335])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-3/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_engines@invalid-engines:
    - shard-glk:          NOTRUN -> [FAIL][50] ([i915#12031])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-glk6/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_ctx_freq@sysfs:
    - shard-dg2:          NOTRUN -> [FAIL][51] ([i915#9561]) +1 other test fail
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-7/igt@gem_ctx_freq@sysfs.html

  * igt@gem_ctx_persistence@engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][52] ([i915#1099]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-snb2/igt@gem_ctx_persistence@engines-mixed.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg1:          NOTRUN -> [FAIL][53] ([i915#11980] / [i915#12580])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-17/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#2575]) +92 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu:         NOTRUN -> [SKIP][55] ([i915#280])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-8/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          NOTRUN -> [ABORT][56] ([i915#7975] / [i915#8213])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-14/igt@gem_eio@hibernate.html
    - shard-dg2:          NOTRUN -> [ABORT][57] ([i915#10030] / [i915#7975] / [i915#8213])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-5/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-dg2:          [PASS][58] -> [FAIL][59] ([i915#5784])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-8/igt@gem_eio@kms.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-6/igt@gem_eio@kms.html
    - shard-dg1:          NOTRUN -> [FAIL][60] ([i915#5784])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-18/igt@gem_eio@kms.html

  * igt@gem_exec_fence@concurrent:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4812]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-8/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_fence@submit:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4812]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-14/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#3539] / [i915#4852]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-14/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#3539] / [i915#4852])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-6/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#3539])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-14/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_nop@basic-sequential:
    - shard-rkl:          [PASS][66] -> [DMESG-WARN][67] ([i915#12964]) +1 other test dmesg-warn
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-1/igt@gem_exec_nop@basic-sequential.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-5/igt@gem_exec_nop@basic-sequential.html

  * igt@gem_exec_reloc@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#3281]) +8 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-3/igt@gem_exec_reloc@basic-gtt.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#3281]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#3281]) +15 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-17/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_schedule@preempt-self:
    - shard-dg2:          [PASS][71] -> [SKIP][72] ([i915#2575]) +134 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-5/igt@gem_exec_schedule@preempt-self.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@gem_exec_schedule@preempt-self.html

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][73] ([i915#11441]) +1 other test incomplete
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-5/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-tglu:         NOTRUN -> [ABORT][74] ([i915#7975] / [i915#8213]) +1 other test abort
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4860]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4860]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-4/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#12936]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-8/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4565]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#4613]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#12193]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-17/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][81] ([i915#4613]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-5/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random:
    - shard-glk:          NOTRUN -> [SKIP][82] ([i915#4613]) +6 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-glk6/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@verify:
    - shard-dg2:          [PASS][83] -> [SKIP][84] ([i915#12936]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-6/igt@gem_lmem_swapping@verify.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@gem_lmem_swapping@verify.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][85] ([i915#4613]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> [SKIP][86] ([i915#284])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-6/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4077]) +17 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-13/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#4077]) +7 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-2/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#4083]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-7/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_mmap_wc@invalid-flags:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#4083]) +6 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-14/igt@gem_mmap_wc@invalid-flags.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#3282]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-12/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][92] ([i915#2658])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-2/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][93] ([i915#12917])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-2/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#4270]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-4/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#4270]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-13/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#5190] / [i915#8428]) +5 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-4/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#4885])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-13/igt@gem_softpin@evict-snoop.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#4879])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-10/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][99] ([i915#3297] / [i915#3323])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-2/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#3297] / [i915#3323])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#3297]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-7/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#3297] / [i915#4880])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-13/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#3297] / [i915#4880])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][104] ([i915#3297]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-4/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#3297])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-5/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#3297])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-18/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_watchdog@default-physical:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#12961])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-10/igt@gem_watchdog@default-physical.html
    - shard-tglu-1:       NOTRUN -> [SKIP][108] ([i915#12961])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@gem_watchdog@default-physical.html

  * igt@gem_watchdog@default-virtual:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#12961])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-13/igt@gem_watchdog@default-virtual.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-tglu-1:       NOTRUN -> [SKIP][110] ([i915#2527] / [i915#2856])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#2527]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-12/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#2527]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-4/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#2856]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-7/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][114] ([i915#2527] / [i915#2856]) +4 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-6/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#6412])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-2/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-tglu:         NOTRUN -> [SKIP][116] ([i915#8399])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-8/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          NOTRUN -> [SKIP][117] +8 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [PASS][118] -> [FAIL][119] ([i915#12942]) +1 other test fail
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#11681] / [i915#6621])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-13/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#11681])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-12/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu-1:       NOTRUN -> [SKIP][122] ([i915#6245])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@i915_query@hwconfig_table.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu-1:       NOTRUN -> [SKIP][123] ([i915#5723])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@perf:
    - shard-dg2:          [PASS][124] -> [FAIL][125] ([i915#12867]) +4 other tests fail
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-6/igt@i915_selftest@perf.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@i915_selftest@perf.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-rkl:          [PASS][126] -> [INCOMPLETE][127] ([i915#4817])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-2/igt@i915_suspend@basic-s3-without-i915.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#4212]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-18/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#4215])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#4212]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-2/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][131] ([i915#1769] / [i915#3555])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#1769] / [i915#3555])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#1769] / [i915#3555])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-12/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#4538] / [i915#5286]) +4 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-18/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][135] ([i915#5286]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#5286])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#5286]) +7 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-5/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#5286]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#3638])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-5/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#3638]) +4 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-13/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#5190]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#4538] / [i915#5190]) +11 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-10/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][143] +91 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#4538]) +7 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#6095]) +149 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-18/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][146] ([i915#6095]) +34 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#12313]) +4 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-18/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#6095]) +72 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#12313])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#12805])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-13/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#12805])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#6095]) +69 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-9/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#6095]) +23 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#10307] / [i915#6095]) +133 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-10/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#12313])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#10307] / [i915#10434] / [i915#6095])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-tglu-1:       NOTRUN -> [SKIP][157] ([i915#3742])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#3742])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-14/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#3742]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-9/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#3742])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#11616] / [i915#7213]) +4 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-a-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#4087]) +4 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-6/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#4423] / [i915#7828])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-13/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#7828]) +8 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-6/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#7828]) +15 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-13/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][166] ([i915#7828]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#7828]) +3 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-2/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-tglu:         NOTRUN -> [SKIP][168] ([i915#7828]) +12 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-6/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#3116] / [i915#3299]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-4/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#3299])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#3299]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-18/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#9424])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-3/igt@kms_content_protection@lic-type-1.html
    - shard-snb:          NOTRUN -> [INCOMPLETE][173] ([i915#8816])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-snb4/igt@kms_content_protection@lic-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#9424])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-17/igt@kms_content_protection@lic-type-1.html
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#6944] / [i915#9424])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-7/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#7116])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-12/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#3555]) +8 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-18/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][178] ([i915#12976])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#12976]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#3555]) +3 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-10/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#12976]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-12/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#4103] / [i915#4213]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#4103]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-snb:          [PASS][184] -> [FAIL][185] ([i915#2346])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-snb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#9067])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-14/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#9067])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu-1:       NOTRUN -> [SKIP][188] ([i915#9723])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_aux_dev:
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#1257])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-14/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#3555] / [i915#3840]) +3 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-18/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#3840])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-12/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#3840])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#3555] / [i915#3840])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-7/igt@kms_dsc@dsc-with-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#3555] / [i915#3840])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-3/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-rkl:          [PASS][195] -> [INCOMPLETE][196] ([i915#9878])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-3/igt@kms_fbcon_fbt@fbc-suspend.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#3469])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#3469])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-18/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-tglu-1:       NOTRUN -> [SKIP][199] ([i915#1839])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@kms_feature_discovery@display-4x.html

  * igt@kms_fence_pin_leak:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#4881])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-18/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#8381])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-18/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][202] ([i915#3637]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][203] ([i915#3637]) +5 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-10/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#9934]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-7/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#9934]) +12 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-12/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][206] -> [FAIL][207] ([i915#2122]) +7 other tests fail
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-snb5/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-snb7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2:          [PASS][208] -> [FAIL][209] ([i915#2122])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-10/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-dp4:
    - shard-dg2:          NOTRUN -> [FAIL][210] ([i915#2122])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-10/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-dp4.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#8381])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-7/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][212] ([i915#12964]) +1 other test dmesg-warn
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-2/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#2672]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#2672] / [i915#3555]) +5 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#2587] / [i915#2672]) +7 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][216] ([i915#2587] / [i915#2672]) +7 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#2672] / [i915#3555]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#2672]) +3 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#2672] / [i915#3555]) +2 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#2672] / [i915#3555]) +7 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#2672] / [i915#3555] / [i915#5190])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [PASS][223] -> [SKIP][224] +17 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-dg2:          [PASS][225] -> [FAIL][226] ([i915#6880]) +1 other test fail
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#8708]) +18 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][228] +66 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#1825]) +13 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#3458]) +9 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][231] +33 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#4423])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#5354]) +28 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][234] +54 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#5439])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#8708]) +26 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#3023]) +10 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#3458]) +26 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-snb:          [PASS][239] -> [SKIP][240]
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-snb2/igt@kms_hdmi_inject@inject-audio.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-snb1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][241] ([i915#3555] / [i915#8228])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#3555] / [i915#8228])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-2/igt@kms_hdr@invalid-hdr.html
    - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#3555] / [i915#8228])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#3555] / [i915#8228])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle:
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#3555] / [i915#8228]) +4 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-18/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][246] ([i915#10656])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#12339])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-10/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#10656])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-18/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#12388])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-13/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#6301])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-13/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][251] ([i915#6301])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-2/igt@kms_panel_fitting@legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#6301])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-1/igt@kms_panel_fitting@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#6301])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#3555] / [i915#8821])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-tglu-1:       NOTRUN -> [SKIP][255] ([i915#3555]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#12247] / [i915#9423])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#12247]) +4 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-tglu-1:       NOTRUN -> [SKIP][258] ([i915#12247]) +4 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
    - shard-glk:          NOTRUN -> [SKIP][259] +321 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-glk5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][260] ([i915#12247] / [i915#6953])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][261] ([i915#12247]) +8 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#2575] / [i915#9423]) +2 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling:
    - shard-dg2:          [PASS][263] -> [SKIP][264] ([i915#2575] / [i915#9423]) +2 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-2/igt@kms_plane_scaling@planes-scaler-unity-scaling.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@kms_plane_scaling@planes-scaler-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#12247]) +7 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu-1:       NOTRUN -> [SKIP][266] ([i915#9812])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#12343])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-17/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][268] ([i915#12343])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-5/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-snb:          NOTRUN -> [SKIP][269] +66 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-snb5/igt@kms_pm_backlight@fade.html
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#9812])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-9/igt@kms_pm_backlight@fade.html
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#5354])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-3/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][272] ([i915#5354]) +2 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-18/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#9685])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-10/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#9685])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][275] ([i915#3828])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#9340])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-13/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#9519])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#9519])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#12937]) +2 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#9519]) +2 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-9/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][281] -> [SKIP][282] ([i915#9519]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2:          [PASS][283] -> [SKIP][284] ([i915#12937])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-7/igt@kms_pm_rpm@system-suspend-modeset.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu-1:       NOTRUN -> [SKIP][285] ([i915#6524])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#6524])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-14/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#11520]) +7 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-glk:          NOTRUN -> [SKIP][288] ([i915#11520]) +8 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-glk9/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#11520]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-3/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#11520]) +5 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-10/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html
    - shard-tglu-1:       NOTRUN -> [SKIP][291] ([i915#11520]) +3 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - shard-snb:          NOTRUN -> [SKIP][292] ([i915#11520])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-snb2/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#11520]) +10 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-14/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#9683])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-8/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-tglu-1:       NOTRUN -> [SKIP][295] ([i915#9683])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#1072] / [i915#9732]) +20 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-7/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#1072] / [i915#4423] / [i915#9732])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-13/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_psr@pr-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#1072] / [i915#9732]) +10 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-1/igt@kms_psr@pr-sprite-render.html
    - shard-tglu-1:       NOTRUN -> [SKIP][299] ([i915#9732]) +8 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#9732]) +24 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-10/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#1072] / [i915#9732]) +33 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-17/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][302] ([i915#9685]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-12/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2:          NOTRUN -> [SKIP][303] ([i915#12755])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-4/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#2575] / [i915#5190]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][305] ([i915#12755] / [i915#5190]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#5289])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-12/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-tglu:         NOTRUN -> [SKIP][307] ([i915#3555]) +4 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-6/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][308] ([i915#12231]) +1 other test abort
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-8/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#8623])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-18/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-rpm:
    - shard-rkl:          [PASS][310] -> [DMESG-WARN][311] ([i915#12917]) +1 other test dmesg-warn
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-1/igt@kms_vblank@ts-continuation-dpms-rpm.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-2/igt@kms_vblank@ts-continuation-dpms-rpm.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#12964])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-2/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][313] ([i915#12917]) +1 other test dmesg-warn
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-2/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-b-hdmi-a-1.html

  * igt@kms_vrr@max-min:
    - shard-tglu:         NOTRUN -> [SKIP][314] ([i915#9906])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-4/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#9906]) +2 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-13/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#9906]) +1 other test skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-5/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#9906]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-1/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-tglu-1:       NOTRUN -> [SKIP][318] ([i915#9906]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-glk:          NOTRUN -> [SKIP][319] ([i915#2437])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-glk6/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg1:          NOTRUN -> [SKIP][320] ([i915#2437] / [i915#9412]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-14/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#7387])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-6/igt@perf@global-sseu-config-invalid.html

  * igt@perf@low-oa-exponent-permissions:
    - shard-dg2:          [PASS][322] -> [SKIP][323] ([i915#12506]) +9 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-6/igt@perf@low-oa-exponent-permissions.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@perf@low-oa-exponent-permissions.html

  * igt@perf@mi-rpc:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#2434])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-3/igt@perf@mi-rpc.html
    - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#2434])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-12/igt@perf@mi-rpc.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][326] ([i915#2435])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-3/igt@perf@per-context-mode-unprivileged.html
    - shard-dg1:          NOTRUN -> [SKIP][327] ([i915#2433])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-17/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-tglu-1:       NOTRUN -> [SKIP][328] ([i915#8850])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-1/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@invalid-init:
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#12506]) +3 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@perf_pmu@invalid-init.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][330] ([i915#4349]) +1 other test fail
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-1/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][331] ([i915#8516])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-17/igt@perf_pmu@rc6-all-gts.html
    - shard-tglu:         NOTRUN -> [SKIP][332] ([i915#8516])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-7/igt@perf_pmu@rc6-all-gts.html
    - shard-rkl:          NOTRUN -> [SKIP][333] ([i915#8516])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-3/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@render-node-busy-idle@vcs0:
    - shard-dg2:          [PASS][334] -> [FAIL][335] ([i915#4349]) +5 other tests fail
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-3/igt@perf_pmu@render-node-busy-idle@vcs0.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-1/igt@perf_pmu@render-node-busy-idle@vcs0.html

  * igt@prime_vgem@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][336] ([i915#3291] / [i915#3708])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-6/igt@prime_vgem@basic-read.html
    - shard-rkl:          NOTRUN -> [SKIP][337] ([i915#3291] / [i915#3708])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-3/igt@prime_vgem@basic-read.html
    - shard-dg1:          NOTRUN -> [SKIP][338] ([i915#3708])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-18/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][339] ([i915#3708] / [i915#4077])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-5/igt@prime_vgem@coherency-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][340] ([i915#3708] / [i915#4077]) +1 other test skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-17/igt@prime_vgem@coherency-gtt.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2:          NOTRUN -> [SKIP][341] ([i915#9917]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-3/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#9917]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-12/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - shard-tglu:         NOTRUN -> [FAIL][343] ([i915#12910]) +19 other tests fail
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-9/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  
#### Possible fixes ####

  * igt@core_getversion@basic:
    - shard-dg2:          [FAIL][344] ([i915#12866]) -> [PASS][345]
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@core_getversion@basic.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-8/igt@core_getversion@basic.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-tglu:         [ABORT][346] ([i915#12817] / [i915#5507]) -> [PASS][347]
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-10/igt@device_reset@unbind-reset-rebind.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-5/igt@device_reset@unbind-reset-rebind.html

  * igt@fbdev@nullptr:
    - shard-dg2:          [SKIP][348] ([i915#2582]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@fbdev@nullptr.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-10/igt@fbdev@nullptr.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-dg2:          [INCOMPLETE][350] ([i915#12353]) -> [PASS][351] +1 other test pass
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-1/igt@gem_ctx_isolation@preservation-s3.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-6/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-dg2:          [SKIP][352] ([i915#12936]) -> [PASS][353] +4 other tests pass
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_lmem_swapping@parallel-multi.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-10/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-tglu:         [SKIP][354] ([i915#4270]) -> [PASS][355]
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-9/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         [ABORT][356] ([i915#12817] / [i915#9820]) -> [PASS][357]
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-8/igt@i915_module_load@reload-with-fault-injection.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@perf:
    - shard-tglu:         [ABORT][358] -> [PASS][359] +1 other test pass
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-6/igt@i915_selftest@perf.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-3/igt@i915_selftest@perf.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-dg2:          [WARN][360] -> [PASS][361]
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@i915_suspend@basic-s3-without-i915.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-2/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg2:          [FAIL][362] ([i915#10991] / [i915#12766]) -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-5/igt@kms_async_flips@alternate-sync-async-flip.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-8/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-dg2:          [FAIL][364] ([i915#5956]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-4/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          [SKIP][366] ([i915#1257]) -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-7/igt@kms_dp_aux_dev.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-10/igt@kms_dp_aux_dev.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2:
    - shard-rkl:          [FAIL][368] ([i915#11989]) -> [PASS][369]
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-1/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-1/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-rkl:          [DMESG-FAIL][370] ([i915#12964]) -> [PASS][371] +1 other test pass
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-rkl:          [FAIL][372] ([i915#2122]) -> [PASS][373] +1 other test pass
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-2/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1:
    - shard-tglu:         [FAIL][374] ([i915#2122]) -> [PASS][375] +5 other tests pass
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-6/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-tglu-5/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-snb:          [FAIL][376] ([i915#2122]) -> [PASS][377] +5 other tests pass
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-snb5/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-snb5/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-dg2:          [FAIL][378] ([i915#2122]) -> [PASS][379] +2 other tests pass
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-4/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-2/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][380] -> [PASS][381] +17 other tests pass
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-snb:          [SKIP][382] -> [PASS][383] +4 other tests pass
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - shard-rkl:          [DMESG-WARN][384] ([i915#12964]) -> [PASS][385] +45 other tests pass
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-1/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-1/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
    - shard-dg2:          [SKIP][386] ([i915#2575] / [i915#9423]) -> [PASS][387] +2 other tests pass
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [SKIP][388] ([i915#12937]) -> [PASS][389]
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-6/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg1:          [INCOMPLETE][390] -> [PASS][391]
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg1-17/igt@kms_rotation_crc@bad-tiling.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg1-18/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_vblank@query-forked-hang:
    - shard-rkl:          [DMESG-WARN][392] ([i915#12917]) -> [PASS][393] +2 other tests pass
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-3/igt@kms_vblank@query-forked-hang.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-3/igt@kms_vblank@query-forked-hang.html

  * igt@kms_vblank@ts-continuation-modeset:
    - shard-dg2:          [SKIP][394] ([i915#2575]) -> [PASS][395] +116 other tests pass
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@kms_vblank@ts-continuation-modeset.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-3/igt@kms_vblank@ts-continuation-modeset.html

  * igt@perf_pmu@rc6@runtime-pm-gt0:
    - shard-rkl:          [SKIP][396] -> [PASS][397]
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-1/igt@perf_pmu@rc6@runtime-pm-gt0.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-7/igt@perf_pmu@rc6@runtime-pm-gt0.html

  * igt@perf_pmu@render-node-busy:
    - shard-dg2:          [SKIP][398] ([i915#12506]) -> [PASS][399] +5 other tests pass
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@perf_pmu@render-node-busy.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-4/igt@perf_pmu@render-node-busy.html

  
#### Warnings ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg2:          [SKIP][400] ([i915#8411]) -> [SKIP][401] ([i915#2575])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-5/igt@api_intel_bb@object-reloc-keep-cache.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@drm_fdinfo@busy-check-all:
    - shard-dg2:          [SKIP][402] ([i915#12506]) -> [SKIP][403] ([i915#8414])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@drm_fdinfo@busy-check-all.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-1/igt@drm_fdinfo@busy-check-all.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          [SKIP][404] ([i915#2575]) -> [ABORT][405] ([i915#9846])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-4/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          [SKIP][406] ([i915#280]) -> [SKIP][407] ([i915#2575])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-10/igt@gem_ctx_sseu@invalid-args.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          [SKIP][408] ([i915#2575]) -> [SKIP][409] ([i915#280])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_ctx_sseu@invalid-sseu.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-3/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          [SKIP][410] ([i915#2575]) -> [SKIP][411] ([i915#4812]) +1 other test skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_exec_balancer@bonded-false-hang.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-1/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          [SKIP][412] ([i915#2575]) -> [SKIP][413] ([i915#4771])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_exec_balancer@bonded-pair.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-4/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          [SKIP][414] ([i915#4812]) -> [SKIP][415] ([i915#2575]) +1 other test skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-6/igt@gem_exec_balancer@bonded-true-hang.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          [SKIP][416] ([i915#3539] / [i915#4852]) -> [SKIP][417] ([i915#2575]) +2 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-4/igt@gem_exec_flush@basic-uc-pro-default.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          [SKIP][418] ([i915#3539]) -> [SKIP][419] ([i915#2575])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-8/igt@gem_exec_flush@basic-uc-set-default.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg2:          [SKIP][420] ([i915#5107]) -> [SKIP][421] ([i915#2575])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-10/igt@gem_exec_params@rsvd2-dirt.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-master:
    - shard-dg2:          [SKIP][422] -> [SKIP][423] ([i915#2575]) +5 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-6/igt@gem_exec_params@secure-non-master.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          [SKIP][424] ([i915#3281]) -> [SKIP][425] ([i915#2575]) +6 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-10/igt@gem_exec_reloc@basic-active.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          [SKIP][426] ([i915#2575]) -> [SKIP][427] ([i915#3281]) +5 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-3/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          [INCOMPLETE][428] -> [SKIP][429] ([i915#2575])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-8/igt@gem_exec_suspend@basic-s4-devices.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          [SKIP][430] ([i915#4860]) -> [SKIP][431] ([i915#2575]) +1 other test skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-10/igt@gem_fence_thrash@bo-copy.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          [SKIP][432] ([i915#2575]) -> [SKIP][433] ([i915#4860]) +1 other test skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-x.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-1/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_mmap_gtt@basic-small-bo:
    - shard-dg2:          [SKIP][434] ([i915#4077]) -> [SKIP][435] ([i915#2575]) +8 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-2/igt@gem_mmap_gtt@basic-small-bo.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@gem_mmap_gtt@basic-small-bo.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-dg2:          [SKIP][436] ([i915#2575]) -> [SKIP][437] ([i915#4077]) +6 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-7/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@gem_mmap_wc@invalid-flags:
    - shard-dg2:          [SKIP][438] ([i915#2575]) -> [SKIP][439] ([i915#4083]) +3 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_mmap_wc@invalid-flags.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-10/igt@gem_mmap_wc@invalid-flags.html

  * igt@gem_mmap_wc@pf-nonblock:
    - shard-dg2:          [SKIP][440] ([i915#4083]) -> [SKIP][441] ([i915#2575]) +2 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-6/igt@gem_mmap_wc@pf-nonblock.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@gem_mmap_wc@pf-nonblock.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-dg2:          [SKIP][442] ([i915#3282]) -> [SKIP][443] ([i915#2575]) +4 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-8/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_pwrite@basic-random:
    - shard-dg2:          [SKIP][444] ([i915#2575]) -> [SKIP][445] ([i915#3282]) +3 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_pwrite@basic-random.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-6/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          [SKIP][446] ([i915#4270]) -> [SKIP][447] ([i915#2575]) +1 other test skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-6/igt@gem_pxp@display-protected-crc.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-11/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-rkl:          [TIMEOUT][448] ([i915#12917]) -> [SKIP][449] ([i915#4270]) +1 other test skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-7/igt@gem_pxp@protected-raw-src-copy-not-readible.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-rkl-3/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-dg2:          [SKIP][450] ([i915#2575]) -> [SKIP][451] ([i915#4270]) +1 other test skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_pxp@verify-pxp-stale-buf-execution.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-7/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-dg2:          [SKIP][452] ([i915#2575] / [i915#5190]) -> [SKIP][453] ([i915#5190] / [i915#8428]) +2 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/shard-dg2-1/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-linear:
    - shard-dg2:          [SKIP][454] ([i915#5190] / [i915#8428]) -> [SKIP][455] ([i915#2575] / [i915#5190]) +4 other tests skip
   [454]: https://intel

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12152/index.html
