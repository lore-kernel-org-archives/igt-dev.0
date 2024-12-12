Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFACE7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 12:06:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6125F10E40D;
	Thu, 12 Dec 2024 12:06:33 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B4E10ED82;
 Thu, 12 Dec 2024 12:06:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Add_ultra_joiner_to_kms?=
 =?utf-8?q?=5Finvalid=5Fmode_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Dec 2024 12:06:32 -0000
Message-ID: <173400519259.1569000.8620470909460219776@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241212043903.2255318-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241212043903.2255318-1-santhosh.reddy.guddati@intel.com>
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

Series: Add ultra joiner to kms_invalid_mode (rev2)
URL   : https://patchwork.freedesktop.org/series/142027/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15828_full -> IGTPW_12303_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12303_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12303_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12303_full:

### IGT changes ###

#### Possible regressions ####

  * igt@debugfs_test@read_all_entries:
    - shard-mtlp:         [PASS][1] -> [ABORT][2] +2 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-mtlp-4/igt@debugfs_test@read_all_entries.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-2/igt@debugfs_test@read_all_entries.html

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk5/igt@gem_eio@in-flight-suspend.html

  * igt@kms_async_flips@crc@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [CRASH][4] +2 other tests crash
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-4/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-10/igt@kms_hdr@brightness-with-hdr.html

  
#### Warnings ####

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          [DMESG-FAIL][6] ([i915#12964]) -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-1/igt@gem_tiled_swapping@non-threaded.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-4/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [ABORT][8] ([i915#9820]) -> [DMESG-WARN][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg2-3/igt@i915_module_load@reload-with-fault-injection.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-8/igt@i915_module_load@reload-with-fault-injection.html

  
Known issues
------------

  Here are the changes found in IGTPW_12303_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#8411])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-18/igt@api_intel_bb@blit-reloc-keep-cache.html
    - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#8411])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-1/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#6230])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-7/igt@api_intel_bb@crc32.html
    - shard-tglu-1:       NOTRUN -> [SKIP][13] ([i915#6230])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@api_intel_bb@crc32.html
    - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#6230])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-18/igt@api_intel_bb@crc32.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#11078])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-4/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#11078])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-13/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#8414]) +6 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-14/igt@drm_fdinfo@busy-check-all@bcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#8414]) +9 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-8/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@gem_caching@reads:
    - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#4873])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-8/igt@gem_caching@reads.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#3555] / [i915#9323])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-4/igt@gem_ccs@ctrl-surf-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#3555] / [i915#9323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-6/igt@gem_ccs@ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#3555] / [i915#9323])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-17/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#13008])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-5/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#13008])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-14/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][25] ([i915#13008])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-6/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][26] ([i915#13008])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-3/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][27] ([i915#7297]) +1 other test incomplete
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-5/igt@gem_ccs@suspend-resume.html
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#9323])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-7/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][29] ([i915#7697]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-10/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#7697])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-13/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][31] ([i915#6335])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-6/igt@gem_create@create-ext-cpu-access-big.html
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#6335])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-5/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#8562])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-12/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][34] ([i915#12353])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk7/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][35] ([i915#1099]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-snb1/igt@gem_ctx_persistence@engines-queued.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#8555])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-mtlp:         NOTRUN -> [SKIP][37] ([i915#8555])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-7/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          NOTRUN -> [FAIL][38] ([i915#11980] / [i915#12580])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-1/igt@gem_ctx_persistence@hostile.html
    - shard-rkl:          NOTRUN -> [FAIL][39] ([i915#11980] / [i915#12580])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-1/igt@gem_ctx_persistence@hostile.html
    - shard-dg1:          NOTRUN -> [FAIL][40] ([i915#11980] / [i915#12580])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-18/igt@gem_ctx_persistence@hostile.html
    - shard-tglu:         NOTRUN -> [FAIL][41] ([i915#11980] / [i915#12580])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-8/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu-1:       NOTRUN -> [SKIP][42] ([i915#280])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@gem_ctx_sseu@engines.html
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#280])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-4/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#280])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-10/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu:         NOTRUN -> [SKIP][45] ([i915#280])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-4/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          [PASS][46] -> [ABORT][47] ([i915#7975] / [i915#8213])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg1-13/igt@gem_eio@hibernate.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-14/igt@gem_eio@hibernate.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#4771])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-6/igt@gem_exec_balancer@bonded-sync.html
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4771])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-13/igt@gem_exec_balancer@bonded-sync.html
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#4771])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-6/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4812]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-6/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#4036])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-13/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglu:         NOTRUN -> [SKIP][53] ([i915#4525])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-5/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#4525])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-1/igt@gem_exec_balancer@parallel-out-fence.html
    - shard-tglu-1:       NOTRUN -> [SKIP][55] ([i915#4525]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_big@single:
    - shard-tglu:         NOTRUN -> [ABORT][56] ([i915#11713])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-3/igt@gem_exec_big@single.html

  * igt@gem_exec_fence@submit:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#4812]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-18/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#3539])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-12/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#3539] / [i915#4852]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-6/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#3539] / [i915#4852]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-18/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#3281]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-2/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#3281]) +13 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-13/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#3281]) +13 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-7/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#3281]) +8 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#4537] / [i915#4812])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-6/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-glk:          NOTRUN -> [INCOMPLETE][66] ([i915#13196]) +1 other test incomplete
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          NOTRUN -> [ABORT][67] ([i915#7975] / [i915#8213]) +1 other test abort
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-2/igt@gem_exec_suspend@basic-s4-devices.html
    - shard-rkl:          NOTRUN -> [ABORT][68] ([i915#7975] / [i915#8213]) +1 other test abort
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-5/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4860]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-12/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#4860]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-7/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#4860]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-7/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][72] ([i915#2190])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][73] ([i915#2190])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk4/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#4613]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-1/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-tglu-1:       NOTRUN -> [SKIP][75] ([i915#4613])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [PASS][76] -> [TIMEOUT][77] ([i915#5493]) +1 other test timeout
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html
    - shard-dg1:          NOTRUN -> [TIMEOUT][78] ([i915#5493]) +1 other test timeout
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][79] ([i915#4613]) +5 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-2/igt@gem_lmem_swapping@verify-ccs.html
    - shard-glk:          NOTRUN -> [SKIP][80] ([i915#4613]) +5 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk8/igt@gem_lmem_swapping@verify-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#4613]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-5/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_mmap@pf-nonblock:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#4083]) +6 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-17/igt@gem_mmap@pf-nonblock.html

  * igt@gem_mmap_gtt@hang-user:
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#4077]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-2/igt@gem_mmap_gtt@hang-user.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#4077]) +12 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-1/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_wc@bad-object:
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#4083])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-6/igt@gem_mmap_wc@bad-object.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#4083]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-5/igt@gem_mmap_wc@copy.html

  * igt@gem_pread@bench:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#3282]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-12/igt@gem_pread@bench.html

  * igt@gem_pwrite@basic-self:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#3282]) +7 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-3/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@display-protected-crc:
    - shard-tglu:         [PASS][89] -> [SKIP][90] ([i915#4270])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-tglu-6/igt@gem_pxp@display-protected-crc.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-2/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-tglu-1:       [PASS][91] -> [SKIP][92] ([i915#4270])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-tglu-1/igt@gem_pxp@fail-invalid-protected-context.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][93] ([i915#12917] / [i915#12964]) +2 other tests timeout
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-1/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-tglu:         NOTRUN -> [SKIP][94] ([i915#4270]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-6/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#4270]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-18/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#4270]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-7/igt@gem_pxp@regular-baseline-src-copy-readible.html
    - shard-rkl:          NOTRUN -> [TIMEOUT][97] ([i915#12964])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-7/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#4270])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-3/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_readwrite@beyond-eob:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#3282]) +4 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-2/igt@gem_readwrite@beyond-eob.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][100] ([i915#8428])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-3/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#5190] / [i915#8428]) +6 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-8/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][102] ([i915#4079])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-2/igt@gem_render_tiled_blits@basic.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#8411]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#4885])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-18/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#4077]) +12 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-12/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-glk:          NOTRUN -> [ABORT][106] ([i915#13263])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk2/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#4879])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-18/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#3297] / [i915#3323])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][109] ([i915#3297])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#3282] / [i915#3297])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-17/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][111] ([i915#3297]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-10/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][112] ([i915#3297])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#3297] / [i915#4880])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#3297]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-18/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#3297] / [i915#4958])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-2/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#3297]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-dg2:          NOTRUN -> [SKIP][117] +8 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-1/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-rkl:          NOTRUN -> [SKIP][118] +23 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-4/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu-1:       NOTRUN -> [SKIP][119] ([i915#2527] / [i915#2856]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-large:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#2527]) +5 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-12/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#2527] / [i915#2856]) +3 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-5/igt@gen9_exec_parse@bb-secure.html
    - shard-mtlp:         NOTRUN -> [SKIP][122] ([i915#2856]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-8/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#2856]) +4 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-10/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#2527]) +3 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-7/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_fb_tiling:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#4881])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-10/igt@i915_fb_tiling.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][126] ([i915#13029])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [PASS][127] -> [ABORT][128] ([i915#9820])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         NOTRUN -> [ABORT][129] ([i915#12817] / [i915#13010] / [i915#9820])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-8/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#6412])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-4/igt@i915_module_load@resize-bar.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-mtlp:         NOTRUN -> [SKIP][131] ([i915#8436])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-6/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-tglu-1:       NOTRUN -> [SKIP][132] ([i915#8399])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#11681] / [i915#6621]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-12/igt@i915_pm_rps@basic-api.html
    - shard-mtlp:         NOTRUN -> [SKIP][134] ([i915#11681] / [i915#6621])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-8/igt@i915_pm_rps@basic-api.html
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#11681] / [i915#6621])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-4/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@waitboost:
    - shard-mtlp:         NOTRUN -> [FAIL][136] ([i915#8346])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-5/igt@i915_pm_rps@waitboost.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#7984])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-7/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#6245])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-12/igt@i915_query@hwconfig_table.html

  * igt@i915_selftest@mock:
    - shard-snb:          NOTRUN -> [DMESG-WARN][139] ([i915#9311]) +1 other test dmesg-warn
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-snb4/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][140] ([i915#9311]) +1 other test dmesg-warn
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-17/igt@i915_selftest@mock@memory_region.html

  * igt@i915_selftest@perf:
    - shard-tglu:         [PASS][141] -> [ABORT][142] ([i915#13010]) +1 other test abort
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-tglu-9/igt@i915_selftest@perf.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-8/igt@i915_selftest@perf.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu-1:       NOTRUN -> [SKIP][143] ([i915#7707])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@intel_hwmon@hwmon-read.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#7707])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-3/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#4212])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-6/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#4212]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-13/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][147] ([i915#12761] / [i915#1982]) +1 other test incomplete
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk9/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#8709]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#8709]) +7 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs-cc:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#8709]) +11 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-10/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs-cc.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [CRASH][151] ([i915#13287])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-4/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#3555])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-mtlp:         NOTRUN -> [SKIP][153] ([i915#1769] / [i915#3555])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#1769] / [i915#3555]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-snb:          NOTRUN -> [SKIP][155] ([i915#1769])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-snb4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#1769] / [i915#3555])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-glk:          NOTRUN -> [SKIP][157] ([i915#1769])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][158] ([i915#5286]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#5286]) +7 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#4538] / [i915#5286]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-12/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#5286])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#5286]) +3 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][163] +7 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-5/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#3638]) +6 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#3638]) +4 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-12/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#4538] / [i915#5190]) +10 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-7/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#5190])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#4538]) +7 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][169] ([i915#12313])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#6095]) +178 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-17/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#6095]) +74 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-10/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#10307] / [i915#6095]) +144 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-1/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#12313]) +2 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-8/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#12805])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#12805])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#6095]) +16 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-11/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][178] ([i915#12796]) +1 other test incomplete
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#12313]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-12/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#12313]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][181] ([i915#6095]) +24 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#12313])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#12313])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#6095]) +19 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-3/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#6095]) +108 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition:
    - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#7213] / [i915#9010]) +4 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-4/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#11616] / [i915#7213]) +4 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-a-dp-4.html

  * igt@kms_cdclk@plane-scaling:
    - shard-dg1:          NOTRUN -> [SKIP][188] ([i915#3742]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-17/igt@kms_cdclk@plane-scaling.html
    - shard-tglu:         NOTRUN -> [SKIP][189] ([i915#3742]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-4/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#4087]) +3 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-10/igt@kms_cdclk@plane-scaling@pipe-d-dp-4.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#7828]) +5 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-2/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#7828]) +9 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-5/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-tglu-1:       NOTRUN -> [SKIP][193] ([i915#7828]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#7828]) +9 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-12/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#7828]) +11 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-5/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
    - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#7828]) +5 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-8/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#7116] / [i915#9424]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-18/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#3299]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-3/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-tglu-1:       NOTRUN -> [SKIP][199] ([i915#3116] / [i915#3299])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#3116]) +2 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-4/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][201] ([i915#7173])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-10/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#9424])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-7/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#9433])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-13/igt@kms_content_protection@mei-interface.html
    - shard-mtlp:         NOTRUN -> [SKIP][204] ([i915#8063] / [i915#9433])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-7/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#7118])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-4/igt@kms_content_protection@srm.html
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#7116])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-13/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-rkl:          [PASS][207] -> [DMESG-WARN][208] ([i915#12964]) +29 other tests dmesg-warn
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#3555] / [i915#8814])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#3555]) +4 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-4/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][211] ([i915#13049]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#13049])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-13/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#8814])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#3555]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-1/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#3555]) +4 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][216] ([i915#12358] / [i915#7882])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk6/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][217] ([i915#12358])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          NOTRUN -> [FAIL][218] ([i915#13028])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#4103] / [i915#4213])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#4103] / [i915#4213]) +3 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#4103]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#13046] / [i915#5354]) +3 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-5/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#9809]) +2 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          NOTRUN -> [FAIL][224] ([i915#2346]) +1 other test fail
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [PASS][225] -> [FAIL][226] ([i915#2346])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#4213])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu-1:       NOTRUN -> [SKIP][228] ([i915#9723])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-snb:          NOTRUN -> [FAIL][229] ([i915#12170])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-snb1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][230] ([i915#11968])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-snb1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#9723])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#9723])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-18/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][233] ([i915#3555] / [i915#8827])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2:          [PASS][234] -> [SKIP][235] ([i915#3555])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg2-10/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#1257])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-4/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#3555] / [i915#3840])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#3555] / [i915#3840])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#3955])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-7/igt@kms_fbcon_fbt@psr.html
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#3469])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-7/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#3469])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#4854])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-4/igt@kms_feature_discovery@chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#4854])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-14/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#1839])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-13/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr2:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#658])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-5/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#3637]) +7 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-7/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#9934]) +7 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-17/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#8381])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-14/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#9934]) +5 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-7/igt@kms_flip@2x-flip-vs-panning.html
    - shard-tglu-1:       NOTRUN -> [SKIP][250] ([i915#3637]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@kms_flip@2x-flip-vs-panning.html
    - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#3637])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-4/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][252] ([i915#4839])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk4/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#9934]) +10 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-3/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][254] ([i915#12745] / [i915#4839]) +1 other test incomplete
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][255] ([i915#12745])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk8/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-dg2:          [PASS][256] -> [FAIL][257] ([i915#11989])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg2-10/igt@kms_flip@plain-flip-ts-check.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-5/igt@kms_flip@plain-flip-ts-check.html
    - shard-rkl:          [PASS][258] -> [FAIL][259] ([i915#11989])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-4/igt@kms_flip@plain-flip-ts-check.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-5/igt@kms_flip@plain-flip-ts-check.html
    - shard-snb:          [PASS][260] -> [FAIL][261] ([i915#11989]) +1 other test fail
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-snb2/igt@kms_flip@plain-flip-ts-check.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-snb2/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@plain-flip-ts-check@b-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][262] ([i915#11989]) +1 other test fail
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-5/igt@kms_flip@plain-flip-ts-check@b-hdmi-a2.html

  * igt@kms_flip@plain-flip-ts-check@c-hdmi-a3:
    - shard-dg2:          NOTRUN -> [FAIL][263] ([i915#11989]) +2 other tests fail
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-5/igt@kms_flip@plain-flip-ts-check@c-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1:
    - shard-tglu:         NOTRUN -> [FAIL][264] ([i915#11989]) +2 other tests fail
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-7/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1:
    - shard-snb:          NOTRUN -> [FAIL][265] ([i915#11989]) +4 other tests fail
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-snb1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#2587] / [i915#2672]) +5 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#2672] / [i915#3555]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#2672]) +7 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][269] ([i915#2672] / [i915#3555]) +5 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][270] ([i915#2672] / [i915#3555] / [i915#8813]) +2 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#2672]) +3 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#2672] / [i915#3555]) +7 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#2587] / [i915#2672]) +5 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#2672] / [i915#3555]) +5 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#3555] / [i915#8813])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#8810])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][278] ([i915#2672] / [i915#8813]) +2 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][279] ([i915#2672] / [i915#3555])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][280] ([i915#2587] / [i915#2672])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][281] +38 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#5354]) +24 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-glk:          [PASS][283] -> [DMESG-FAIL][284] ([i915#118])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][285] +50 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-snb:          [PASS][286] -> [SKIP][287] +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][288] ([i915#10056])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#5439]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#5439])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][291] ([i915#12964]) +13 other tests dmesg-warn
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#8708]) +17 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#1825]) +47 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#8708]) +8 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#3023]) +29 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][296] ([i915#5439])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][297] +88 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#10433] / [i915#3458]) +2 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#3458]) +19 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][300] ([i915#3458]) +12 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][301] ([i915#1825]) +12 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][302] ([i915#8708]) +22 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#3555] / [i915#8228]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-5/igt@kms_hdr@bpc-switch-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][304] ([i915#3555] / [i915#8228])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-14/igt@kms_hdr@bpc-switch-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#3555] / [i915#8228]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-6/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-toggle:
    - shard-tglu-1:       NOTRUN -> [SKIP][306] ([i915#3555] / [i915#8228])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#3555] / [i915#8228]) +2 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-8/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#10656])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-4/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#10656])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-8/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#12388])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-13/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][311] ([i915#12394])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#12339])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#6301])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-1/igt@kms_panel_fitting@atomic-fastset.html
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#6301])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-4/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][315] ([i915#13026]) +1 other test incomplete
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_cursor@viewport:
    - shard-rkl:          [PASS][316] -> [DMESG-WARN][317] ([i915#12917] / [i915#12964])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-7/igt@kms_plane_cursor@viewport.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-1/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-2-size-64:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][318] ([i915#12917] / [i915#12964]) +1 other test dmesg-warn
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-1/igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-2-size-64.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-mtlp:         NOTRUN -> [SKIP][319] ([i915#11614] / [i915#3582]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-6/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][320] ([i915#10226] / [i915#11614] / [i915#3582]) +2 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-6/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][321] ([i915#12247]) +7 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][322] ([i915#12247]) +23 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#12247] / [i915#9423])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#12247] / [i915#6953] / [i915#9423])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#12247] / [i915#6953]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-17/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][326] ([i915#12247] / [i915#6953])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-mtlp:         NOTRUN -> [SKIP][327] ([i915#12247] / [i915#6953]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:
    - shard-dg2:          NOTRUN -> [SKIP][328] ([i915#12247]) +7 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][329] ([i915#12247]) +7 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-dg1:          NOTRUN -> [SKIP][330] ([i915#12247]) +16 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-17/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][331] ([i915#12247] / [i915#3555])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#12343])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-5/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#5354]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-13/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][334] ([i915#9812])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-5/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#5978])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-rkl:          NOTRUN -> [SKIP][336] ([i915#9685])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [PASS][337] -> [SKIP][338] ([i915#4281])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-tglu-3/igt@kms_pm_dc@dc9-dpms.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-9/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][339] ([i915#9519]) +2 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][340] ([i915#9519]) +2 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg1:          NOTRUN -> [SKIP][341] ([i915#9519]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][342] ([i915#9519])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglu:         NOTRUN -> [SKIP][343] ([i915#9519])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg1:          NOTRUN -> [SKIP][344] ([i915#6524]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-18/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][345] ([i915#6524]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-3/igt@kms_prime@basic-modeset-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][346] ([i915#6524])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-5/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-dg2:          NOTRUN -> [SKIP][347] ([i915#6524] / [i915#6805])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-4/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][348] ([i915#11520]) +5 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][349] ([i915#11520]) +11 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk4/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][350] ([i915#11520]) +8 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-13/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][351] ([i915#9808]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][352] ([i915#12316]) +4 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][353] ([i915#11520]) +3 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][354] ([i915#11520]) +7 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#11520]) +10 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-4/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-snb:          NOTRUN -> [SKIP][356] ([i915#11520]) +9 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-snb2/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][357] ([i915#9683]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-mtlp:         NOTRUN -> [SKIP][358] ([i915#4348])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-4/igt@kms_psr2_su@page_flip-nv12.html
    - shard-dg1:          NOTRUN -> [SKIP][359] ([i915#9683])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-17/igt@kms_psr2_su@page_flip-nv12.html
    - shard-tglu:         NOTRUN -> [SKIP][360] ([i915#9683])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][361] ([i915#9683]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-3/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][362] ([i915#9732]) +8 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][363] ([i915#9688]) +10 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-4/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-dg1:          NOTRUN -> [SKIP][364] ([i915#1072] / [i915#9732]) +25 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-13/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][365] ([i915#9732]) +23 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-3/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][366] ([i915#1072] / [i915#9732]) +21 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-8/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr2-primary-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][367] ([i915#4077] / [i915#9688]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-3/igt@kms_psr@psr2-primary-mmap-gtt@edp-1.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][368] ([i915#1072] / [i915#9732]) +26 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-3/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][369] +405 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk8/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][370] ([i915#5289])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][371] ([i915#5289])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-mtlp:         NOTRUN -> [SKIP][372] ([i915#5289])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][373] ([i915#5289])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg1:          NOTRUN -> [SKIP][374] ([i915#5289]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-12/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu:         NOTRUN -> [ABORT][375] ([i915#13179]) +1 other test abort
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-2/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic:
    - shard-tglu-1:       NOTRUN -> [FAIL][376] ([i915#5465]) +2 other tests fail
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@kms_setmode@basic.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg1:          NOTRUN -> [SKIP][377] ([i915#3555]) +6 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-18/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][378] ([i915#8623])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-12/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-tglu:         NOTRUN -> [SKIP][379] ([i915#8623])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-rkl:          [PASS][380] -> [DMESG-FAIL][381] ([i915#12964])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-1/igt@kms_vblank@ts-continuation-suspend.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-7/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][382] ([i915#12964])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-7/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][383] ([i915#12276])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk4/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          NOTRUN -> [SKIP][384] ([i915#11920])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-7/igt@kms_vrr@lobf.html
    - shard-tglu:         NOTRUN -> [SKIP][385] ([i915#11920])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-7/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-tglu:         NOTRUN -> [SKIP][386] ([i915#9906])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-5/igt@kms_vrr@max-min.html
    - shard-mtlp:         NOTRUN -> [SKIP][387] ([i915#8808] / [i915#9906])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-8/igt@kms_vrr@max-min.html
    - shard-dg2:          NOTRUN -> [SKIP][388] ([i915#9906])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-7/igt@kms_vrr@max-min.html
    - shard-rkl:          NOTRUN -> [SKIP][389] ([i915#9906])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-3/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][390] ([i915#3555] / [i915#9906])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-1/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglu:         NOTRUN -> [SKIP][391] ([i915#2437])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-4/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][392] ([i915#2437] / [i915#9412])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-6/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-mtlp:         NOTRUN -> [SKIP][393] ([i915#2437] / [i915#9412])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2:          NOTRUN -> [SKIP][394] ([i915#2437])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-5/igt@kms_writeback@writeback-fb-id.html
    - shard-rkl:          NOTRUN -> [SKIP][395] ([i915#2437]) +1 other test skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-5/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][396] ([i915#2437]) +1 other test skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-18/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-glk:          NOTRUN -> [SKIP][397] ([i915#2437]) +2 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk2/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg1:          NOTRUN -> [SKIP][398] ([i915#2437] / [i915#9412])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-18/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-dg1:          NOTRUN -> [SKIP][399] ([i915#2433])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-18/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-accuracy-98:
    - shard-snb:          NOTRUN -> [SKIP][400] +409 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-snb4/igt@perf_pmu@busy-accuracy-98.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][401] ([i915#8516])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-12/igt@perf_pmu@rc6-all-gts.html
    - shard-rkl:          NOTRUN -> [SKIP][402] ([i915#8516])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-5/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][403] ([i915#3708]) +2 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-13/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][404] ([i915#3708] / [i915#4077])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-2/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          NOTRUN -> [SKIP][405] ([i915#3291] / [i915#3708])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-3/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][406] ([i915#3708] / [i915#4077])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-1/igt@prime_vgem@coherency-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][407] ([i915#3708])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-4/igt@prime_vgem@coherency-gtt.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-rkl:          NOTRUN -> [SKIP][408] ([i915#9917])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-4/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-dg1:          NOTRUN -> [SKIP][409] ([i915#9917])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-14/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][410] ([i915#4818])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg2-4/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          [INCOMPLETE][411] ([i915#12353]) -> [PASS][412]
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-glk3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk7/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_eio@kms:
    - shard-dg1:          [FAIL][413] ([i915#5784]) -> [PASS][414]
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg1-14/igt@gem_eio@kms.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-13/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [FAIL][415] ([i915#12543] / [i915#5784]) -> [PASS][416]
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg1-14/igt@gem_eio@reset-stress.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-dg1-12/igt@gem_eio@reset-stress.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-tglu:         [ABORT][417] ([i915#12817]) -> [PASS][418] +1 other test pass
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-tglu-10/igt@gem_exec_suspend@basic-s0@smem.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-tglu-8/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-rkl:          [DMESG-WARN][419] ([i915#12917] / [i915#12964]) -> [PASS][420]
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-6/igt@gem_exec_whisper@basic-queues-priority.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-5/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-rkl:          [SKIP][421] ([i915#13328]) -> [PASS][422]
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-3/igt@i915_pm_rpm@gem-execbuf.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-rkl-5/igt@i915_pm_rpm@gem-execbuf.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [ABORT][423] ([i915#12061]) -> [PASS][424] +1 other test pass
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-mtlp-7/igt@i915_selftest@live@workarounds.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-mtlp-7/igt@i915_selftest@live@workarounds.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2:
    - shard-glk:          [FAIL][425] -> [PASS][426] +1 other test pass
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/shard-glk4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-mtlp:         [FAIL][427] ([i915#11808] / [i915#5956]) -> [PASS][428] +1 other test pass
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-mtlp-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-ti

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12303/index.html
