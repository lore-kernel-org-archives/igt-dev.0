Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA64E77188
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jan 2025 06:21:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAA110E3E0;
	Wed,  8 Jan 2025 06:21:15 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADDD10E3E0;
 Wed,  8 Jan 2025 06:21:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0312014802677136025=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Add_dsc+bigjoiner_subtes?=
 =?utf-8?q?t_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 08 Jan 2025 06:21:14 -0000
Message-ID: <173631727462.1201715.568813258798768097@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250107185709.116756-1-swati2.sharma@intel.com>
In-Reply-To: <20250107185709.116756-1-swati2.sharma@intel.com>
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

--===============0312014802677136025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add dsc+bigjoiner subtest (rev4)
URL   : https://patchwork.freedesktop.org/series/128266/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15919_full -> IGTPW_12396_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12396_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12396_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/index.html

Participating hosts (10 -> 11)
------------------------------

  Additional (1): shard-glk-0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12396_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-glk4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

  * {igt@kms_dsc@dsc-basic-ultra-joiner} (NEW):
    - shard-tglu-1:       NOTRUN -> [SKIP][2] +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_dsc@dsc-basic-ultra-joiner.html

  * {igt@kms_dsc@dsc-fractional-bpp-big-joiner} (NEW):
    - shard-tglu:         NOTRUN -> [SKIP][3] +10 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-3/igt@kms_dsc@dsc-fractional-bpp-big-joiner.html

  * {igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultra-joiner} (NEW):
    - {shard-dg2-9}:      NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-9/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultra-joiner.html

  * {igt@kms_dsc@dsc-with-bpc-ultra-joiner} (NEW):
    - shard-dg1:          NOTRUN -> [SKIP][5] +12 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@kms_dsc@dsc-with-bpc-ultra-joiner.html

  * {igt@kms_dsc@dsc-with-formats-ultra-joiner} (NEW):
    - shard-mtlp:         NOTRUN -> [SKIP][6] +15 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-4/igt@kms_dsc@dsc-with-formats-ultra-joiner.html

  * {igt@kms_dsc@dsc-with-output-formats-big-joiner} (NEW):
    - shard-dg2:          NOTRUN -> [SKIP][7] +12 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-8/igt@kms_dsc@dsc-with-output-formats-big-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][8] +13 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats-big-joiner.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-tglu:         [PASS][9] -> [ABORT][10] +2 other tests abort
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-tglu-4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15919_full and IGTPW_12396_full:

### New IGT tests (16) ###

  * igt@kms_dsc@dsc-basic-big-joiner:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic-ultra-joiner:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-big-joiner:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_dsc@dsc-fractional-bpp-ultra-joiner:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-big-joiner:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultra-joiner:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_dsc@dsc-with-bpc-big-joiner:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_dsc@dsc-with-bpc-formats-big-joiner:
    - Statuses : 5 skip(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_dsc@dsc-with-bpc-formats-ultra-joiner:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_dsc@dsc-with-bpc-ultra-joiner:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_dsc@dsc-with-formats-big-joiner:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_dsc@dsc-with-formats-ultra-joiner:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_dsc@dsc-with-output-formats-big-joiner:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_dsc@dsc-with-output-formats-ultra-joiner:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-big-joiner:
    - Statuses : 4 skip(s)
    - Exec time: [0.00] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultra-joiner:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_12396_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#8411])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-4/igt@api_intel_bb@object-reloc-keep-cache.html
    - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#8411])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@api_intel_bb@object-reloc-keep-cache.html
    - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#8411])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-tglu-1:       NOTRUN -> [SKIP][14] ([i915#9318])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@cold-reset-bound:
    - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#11078])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-6/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#11078])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#8414]) +16 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#3555] / [i915#9323])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#9323])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#13008])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-tglu-1:       NOTRUN -> [SKIP][21] ([i915#13008])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [PASS][22] -> [INCOMPLETE][23] ([i915#12392] / [i915#7297])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#7697])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@gem_close_race@multigpu-basic-process.html
    - shard-tglu-1:       NOTRUN -> [SKIP][25] ([i915#7697])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#7697])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#7697]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-10/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu-1:       NOTRUN -> [SKIP][28] ([i915#8562])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][29] ([i915#1099]) +4 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-snb7/igt@gem_ctx_persistence@engines-queued.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#8555]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-4/igt@gem_ctx_persistence@heartbeat-hostile.html
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#8555])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-hostile.html
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#8555])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-2/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglu:         NOTRUN -> [SKIP][33] ([i915#280])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-10/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@kms:
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][34] ([i915#13363])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@gem_eio@kms.html
    - shard-dg1:          NOTRUN -> [FAIL][35] ([i915#5784])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#4771]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.html
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#4771])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#4036])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-8/igt@gem_exec_balancer@invalid-bonds.html
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#4036])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglu-1:       NOTRUN -> [SKIP][40] ([i915#4525])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-tglu:         NOTRUN -> [SKIP][41] ([i915#4525])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-4/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#6334]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#4812]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-5/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#3539])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#3539]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-2/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#3539] / [i915#4852]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-6/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#3539] / [i915#4852]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#3281]) +13 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#3281]) +10 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#3281]) +14 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_reloc@basic-write-wc-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#3281]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-5/igt@gem_exec_reloc@basic-write-wc-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#4812]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#7276])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-2/igt@gem_exec_schedule@semaphore-power.html
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4537] / [i915#4812])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-5/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-rkl:          NOTRUN -> [ABORT][55] ([i915#7975] / [i915#8213]) +1 other test abort
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-7/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4860])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#4613] / [i915#7582])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-2/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-glk:          NOTRUN -> [SKIP][58] ([i915#4613]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-glk2/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#4613]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-tglu-1:       NOTRUN -> [SKIP][60] ([i915#4613]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#12193])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4565])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html

  * igt@gem_lmem_swapping@random:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#4613])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-1/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][64] ([i915#4613]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-8/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#8289])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-5/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap_gtt@big-bo-tiledy:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4077])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-1/igt@gem_mmap_gtt@big-bo-tiledy.html

  * igt@gem_mmap_gtt@close-race:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4077]) +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-14/igt@gem_mmap_gtt@close-race.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4077]) +6 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-10/igt@gem_mmap_gtt@fault-concurrent-y.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4083]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_mmap_wc@invalid-flags:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4083]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@gem_mmap_wc@invalid-flags.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#4083])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-3/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#3282]) +5 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-3/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#3282]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-4/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pwrite@basic-self:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#3282]) +6 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-rkl:          NOTRUN -> [TIMEOUT][75] ([i915#12917] / [i915#12964]) +1 other test timeout
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-7/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4270]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-10/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu-1:       NOTRUN -> [SKIP][77] ([i915#13398])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu:         NOTRUN -> [SKIP][78] ([i915#13398])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-10/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4270]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_render_copy@yf-tiled-ccs-to-linear:
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#8428]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-4/igt@gem_render_copy@yf-tiled-ccs-to-linear.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#5190] / [i915#8428]) +10 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-1/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#4079]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          NOTRUN -> [ABORT][83] ([i915#13263] / [i915#13449])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-snb7/igt@gem_tiled_swapping@non-threaded.html
    - shard-glk:          NOTRUN -> [ABORT][84] ([i915#13263] / [i915#13449])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-glk2/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4879])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@gem_unfence_active_buffers.html
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#4879])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-6/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#3297]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-3/igt@gem_userptr_blits@coherency-unsync.html
    - shard-tglu-1:       NOTRUN -> [SKIP][88] ([i915#3297])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#3297] / [i915#3323])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-8/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#3297])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-6/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#3297] / [i915#3323])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-3/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#3282] / [i915#3297])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][93] ([i915#3297]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-2/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#3297] / [i915#4958])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#3297]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#3297]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          NOTRUN -> [INCOMPLETE][97] ([i915#13356])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-glk2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#2527] / [i915#2856]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-3/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#2856]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-4/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-large:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#2527]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#2527]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-6/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu-1:       NOTRUN -> [SKIP][102] ([i915#2527] / [i915#2856]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#2856]) +6 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-3/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_module_load@load:
    - shard-dg1:          ([PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124]) -> ([PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [DMESG-WARN][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145]) ([i915#4423])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-14/igt@i915_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-13/igt@i915_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-18/igt@i915_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-14/igt@i915_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-17/igt@i915_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-17/igt@i915_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-18/igt@i915_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-12/igt@i915_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-14/igt@i915_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-13/igt@i915_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-12/igt@i915_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-13/igt@i915_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-17/igt@i915_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-18/igt@i915_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-18/igt@i915_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-12/igt@i915_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-12/igt@i915_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-14/igt@i915_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-13/igt@i915_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-17/igt@i915_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-12/igt@i915_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@i915_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@i915_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@i915_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@i915_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-14/igt@i915_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-14/igt@i915_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@i915_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@i915_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@i915_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@i915_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@i915_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@i915_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@i915_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-14/igt@i915_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@i915_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-14/igt@i915_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@i915_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@i915_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@i915_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@i915_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         NOTRUN -> [ABORT][146] ([i915#12817] / [i915#9820])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu-1:       NOTRUN -> [SKIP][147] ([i915#6412])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#8399])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-2/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#8399])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#11681] / [i915#6621])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@i915_pm_rps@basic-api.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#7984])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@i915_power@sanity.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][152] ([i915#9311]) +1 other test dmesg-warn
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          [PASS][153] -> [INCOMPLETE][154] ([i915#4817])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-glk1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-glk7/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          NOTRUN -> [INCOMPLETE][155] ([i915#4817])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-glk5/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#5190]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#4212])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-4/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#12454] / [i915#12712])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-mtlp:         NOTRUN -> [SKIP][159] ([i915#12454] / [i915#12712])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y-rc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#8709]) +3 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#8709]) +15 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#8709]) +11 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#12967] / [i915#6228])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#1769] / [i915#3555])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#1769] / [i915#3555])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-dg1:          [PASS][166] -> [FAIL][167] ([i915#5956]) +2 other tests fail
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-18/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [FAIL][168] ([i915#5956])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#5286]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#4538] / [i915#5286]) +5 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#5286]) +6 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][172] ([i915#5286]) +3 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#3638]) +4 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-3/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#4538] / [i915#5190]) +12 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#3638]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#6187])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-mtlp:         NOTRUN -> [SKIP][177] +9 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#4538]) +4 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#6095]) +54 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][180] ([i915#6095]) +24 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#10307] / [i915#6095]) +169 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-10/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-8/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#12805])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][184] ([i915#12796])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-glk4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#6095]) +20 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][186] ([i915#12964]) +3 other tests dmesg-fail
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][187] -> [INCOMPLETE][188] ([i915#12796])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-glk9/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-glk6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][189] ([i915#6095]) +39 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#12313])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#12313])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#6095]) +74 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#12313]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#6095]) +175 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#12313]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#3742])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#7828]) +6 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-6/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#7828]) +3 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-4/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#7828]) +7 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#7828]) +10 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-1/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#7828]) +9 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][202] ([i915#7828]) +2 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_color@deep-color:
    - shard-tglu-1:       NOTRUN -> [SKIP][203] ([i915#3555] / [i915#9979])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic:
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-10/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#3299])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#3116])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-4/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#7118] / [i915#9424])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-7/igt@kms_content_protection@legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#7116] / [i915#9424])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#9424])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#6944] / [i915#9424])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-9/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#6944])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#7118] / [i915#9424]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#3555]) +5 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-5/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-rkl:          [PASS][214] -> [DMESG-WARN][215] ([i915#12964]) +40 other tests dmesg-warn
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-256x256.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#13049])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#13049])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-rkl:          [PASS][218] -> [DMESG-WARN][219] ([i915#12917] / [i915#12964]) +1 other test dmesg-warn
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-64x21.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#3555]) +6 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-4/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#3555]) +2 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#13049]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#3555] / [i915#8814])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-128x128@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][224] ([i915#12964]) +25 other tests dmesg-warn
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-128x128@pipe-b-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#13049]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-tglu-1:       NOTRUN -> [SKIP][226] ([i915#13049])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#13049])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][228] ([i915#9809]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][229] +21 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#13046] / [i915#5354]) +7 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][231] ([i915#4103]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#4103] / [i915#4213])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#4103])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#8588])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-6/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#8812])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-3/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#3555] / [i915#3840]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#3840] / [i915#9688])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-3/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#3840])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#3840])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#3555] / [i915#3840])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-14/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#3555] / [i915#3840])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-2/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#3840] / [i915#9053])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#3840] / [i915#9053])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-10/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#1839])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-2/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#9337])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#658]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#658])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-14/igt@kms_feature_discovery@psr2.html
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#658])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][249] ([i915#3637]) +3 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#9934]) +8 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#9934]) +4 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#3637]) +5 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-6/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#9934]) +5 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][254] ([i915#3637]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#8381]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-5/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-rkl:          [PASS][256] -> [FAIL][257] ([i915#11989]) +2 other tests fail
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-rkl-3/igt@kms_flip@wf_vblank-ts-check.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check.html
    - shard-snb:          [PASS][258] -> [FAIL][259] ([i915#11989]) +1 other test fail
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-snb4/igt@kms_flip@wf_vblank-ts-check.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-snb7/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
    - shard-tglu:         [PASS][260] -> [FAIL][261] ([i915#11989]) +2 other tests fail
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-tglu-8/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-9/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][262] ([i915#2672] / [i915#3555]) +3 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#2587] / [i915#2672]) +5 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][264] ([i915#2672] / [i915#3555])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][265] ([i915#2587] / [i915#2672])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][266] ([i915#2672] / [i915#3555] / [i915#8813])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#2672] / [i915#3555]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#2672] / [i915#8813])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#2672]) +3 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][271] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][272] ([i915#2672] / [i915#3555]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#2587] / [i915#2672]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#2672] / [i915#3555])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#2672])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:
    - shard-dg1:          [PASS][276] -> [DMESG-WARN][277] ([i915#4423])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [FAIL][278] ([i915#6880])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][279] +39 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][280] ([i915#8708])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-snb:          [PASS][281] -> [SKIP][282] +2 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][283] ([i915#8708]) +12 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#5439])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#5439])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#3458]) +17 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#3458]) +19 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#8708]) +21 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][289] ([i915#1825]) +8 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][290] +56 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#3023]) +22 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#1825]) +32 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][293] +437 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#5354]) +31 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_getfb@getfb-handle-not-fb:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][295] ([i915#4423])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@kms_getfb@getfb-handle-not-fb.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#3555] / [i915#8228])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@kms_hdr@bpc-switch-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#3555] / [i915#8228])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-14/igt@kms_hdr@bpc-switch-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#3555] / [i915#8228])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-9/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-swap:
    - shard-tglu-1:       NOTRUN -> [SKIP][299] ([i915#3555] / [i915#8228])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_hdr@static-swap.html
    - shard-dg2:          NOTRUN -> [SKIP][300] ([i915#3555] / [i915#8228]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@kms_hdr@static-swap.html

  * igt@kms_histogram@algo-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][301] ([i915#13389])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-4/igt@kms_histogram@algo-basic.html
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#13389])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-3/igt@kms_histogram@algo-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#13389])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@kms_histogram@algo-basic.html
    - shard-tglu-1:       NOTRUN -> [SKIP][304] ([i915#13389])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_histogram@algo-basic.html

  * igt@kms_histogram@algo-color:
    - shard-dg1:          NOTRUN -> [SKIP][305] ([i915#13389]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@kms_histogram@algo-color.html

  * igt@kms_histogram@global-basic:
    - shard-rkl:          NOTRUN -> [SKIP][306] ([i915#13388])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-6/igt@kms_histogram@global-basic.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#12388])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#12394])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-4/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][309] ([i915#12394])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-4/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#12339])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@kms_joiner@basic-ultra-joiner.html
    - shard-tglu-1:       NOTRUN -> [SKIP][311] ([i915#12339])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#1839])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#6301])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@kms_panel_fitting@atomic-fastset.html
    - shard-tglu-1:       NOTRUN -> [SKIP][314] ([i915#6301])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][315] +6 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-3/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][316] ([i915#13026]) +1 other test incomplete
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-glk8/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#3555]) +4 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@kms_plane_multiple@tiling-yf.html
    - shard-tglu-1:       NOTRUN -> [SKIP][318] ([i915#3555]) +2 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#3555] / [i915#8806])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-3/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-tglu-1:       NOTRUN -> [SKIP][320] ([i915#12247]) +8 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][321] ([i915#12247]) +13 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][322] ([i915#12247]) +4 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][323] ([i915#12247]) +4 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#12247]) +8 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-14/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#12247] / [i915#6953])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][326] ([i915#12247] / [i915#6953] / [i915#9423])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][327] ([i915#12247] / [i915#6953])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][328] ([i915#12247]) +7 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][329] ([i915#12247] / [i915#3555])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#12247] / [i915#3555] / [i915#9423])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][331] ([i915#5354])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#12343])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#5354])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-14/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-rkl:          NOTRUN -> [SKIP][334] ([i915#9685])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][335] ([i915#3361])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][336] ([i915#3828])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][337] ([i915#9519])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-10/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2:          [PASS][338] -> [SKIP][339] ([i915#9519]) +1 other test skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg2-1/igt@kms_pm_rpm@dpms-non-lpsp.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [PASS][340] -> [SKIP][341] ([i915#9519])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          NOTRUN -> [SKIP][342] ([i915#9519])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2:          NOTRUN -> [SKIP][343] ([i915#6524] / [i915#6805])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-1/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][344] ([i915#6524]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][345] ([i915#9808]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][346] ([i915#11520]) +7 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][347] ([i915#12316]) +3 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][348] ([i915#11520]) +6 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-glk6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][349] ([i915#11520])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-snb:          NOTRUN -> [SKIP][350] ([i915#11520]) +11 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-snb4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][351] ([i915#11520]) +5 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][352] ([i915#11520]) +7 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][353] ([i915#11520]) +10 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-2/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg1:          NOTRUN -> [SKIP][354] ([i915#9683])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-14/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#9683])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-8/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][356] ([i915#1072] / [i915#9732]) +23 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-7/igt@kms_psr@fbc-pr-cursor-plane-onoff.html
    - shard-dg1:          NOTRUN -> [SKIP][357] ([i915#1072] / [i915#9732]) +15 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][358] ([i915#9732]) +19 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-8/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-dg2:          NOTRUN -> [SKIP][359] ([i915#1072] / [i915#9732]) +23 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@pr-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][360] ([i915#9688]) +4 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-4/igt@kms_psr@pr-basic.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-tglu-1:       NOTRUN -> [SKIP][361] ([i915#9732]) +9 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr@psr2-primary-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][362] ([i915#4077] / [i915#9688]) +1 other test skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-3/igt@kms_psr@psr2-primary-mmap-gtt@edp-1.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][363] +229 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-glk9/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][364] ([i915#9685]) +2 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2:          NOTRUN -> [SKIP][365] ([i915#9685])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][366] ([i915#5289])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][367] ([i915#12755] / [i915#5190])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][368] ([i915#5289]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-dg1:          NOTRUN -> [SKIP][369] ([i915#5289])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-mtlp:         NOTRUN -> [SKIP][370] ([i915#12755])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][371] ([i915#12755])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][372] ([i915#5465]) +2 other tests fail
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-snb4/igt@kms_setmode@basic.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg1:          NOTRUN -> [FAIL][373] ([IGT#160] / [i915#6493])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-glk:          NOTRUN -> [FAIL][374] ([i915#10959])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-glk5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][375] ([i915#8623])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@query-forked-hang:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][376] ([i915#12917] / [i915#12964]) +3 other tests dmesg-warn
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@kms_vblank@query-forked-hang.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][377] ([i915#12276]) +1 other test incomplete
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-glk7/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@max-min:
    - shard-rkl:          NOTRUN -> [SKIP][378] ([i915#9906])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-2/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          NOTRUN -> [SKIP][379] ([i915#9906]) +1 other test skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-4/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2:          NOTRUN -> [SKIP][380] ([i915#2437])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][381] ([i915#2437] / [i915#9412])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-mtlp:         NOTRUN -> [SKIP][382] ([i915#2437]) +1 other test skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-2/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][383] ([i915#2437])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-tglu:         NOTRUN -> [SKIP][384] ([i915#2437]) +1 other test skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-7/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-tglu:         NOTRUN -> [SKIP][385] ([i915#2437] / [i915#9412]) +1 other test skip
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-8/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@global-sseu-config:
    - shard-mtlp:         NOTRUN -> [SKIP][386] ([i915#7387])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-2/igt@perf@global-sseu-config.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][387] ([i915#7387]) +1 other test skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@perf@global-sseu-config-invalid.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][388] ([i915#4349]) +4 other tests fail
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-10/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@most-busy-idle-check-all@vcs0:
    - shard-mtlp:         [PASS][389] -> [FAIL][390] ([i915#11943]) +5 other tests fail
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-mtlp-1/igt@perf_pmu@most-busy-idle-check-all@vcs0.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-1/igt@perf_pmu@most-busy-idle-check-all@vcs0.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-rkl:          NOTRUN -> [SKIP][391] ([i915#8516])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-tglu:         NOTRUN -> [SKIP][392] ([i915#8516])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-9/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@perf_pmu@render-node-busy-idle@vcs1:
    - shard-mtlp:         [PASS][393] -> [FAIL][394] ([i915#4349]) +1 other test fail
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-mtlp-4/igt@perf_pmu@render-node-busy-idle@vcs1.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-1/igt@perf_pmu@render-node-busy-idle@vcs1.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg2:          NOTRUN -> [SKIP][395] ([i915#3708] / [i915#4077])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-2/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg1:          NOTRUN -> [SKIP][396] ([i915#3708])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@fence-read-hang:
    - shard-rkl:          NOTRUN -> [SKIP][397] ([i915#3708])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-3/igt@prime_vgem@fence-read-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-tglu:         NOTRUN -> [SKIP][398] +66 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-6/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:
    - shard-tglu-1:       NOTRUN -> [FAIL][399] ([i915#12910]) +9 other tests fail
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg1:          NOTRUN -> [SKIP][400] ([i915#9917])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@sriov_basic@enable-vfs-autoprobe-on.html

  
#### Possible fixes ####

  * igt@gem_create@create-clear@smem0:
    - shard-dg2:          [INCOMPLETE][401] -> [PASS][402] +1 other test pass
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg2-3/igt@gem_create@create-clear@smem0.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-8/igt@gem_create@create-clear@smem0.html

  * igt@gem_exec_balancer@full-late-pulse:
    - shard-mtlp:         [FAIL][403] ([i915#13364]) -> [PASS][404]
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-mtlp-4/igt@gem_exec_balancer@full-late-pulse.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-4/igt@gem_exec_balancer@full-late-pulse.html

  * igt@gem_exec_schedule@preemptive-hang:
    - shard-rkl:          [DMESG-WARN][405] ([i915#12964]) -> [PASS][406] +35 other tests pass
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-rkl-5/igt@gem_exec_schedule@preemptive-hang.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-7/igt@gem_exec_schedule@preemptive-hang.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglu:         [FAIL][407] -> [PASS][408]
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-tglu-9/igt@gem_tiled_swapping@non-threaded.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-9/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [DMESG-FAIL][409] ([i915#13393]) -> [PASS][410] +1 other test pass
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-mtlp-7/igt@i915_selftest@live@workarounds.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-3/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@debugfs-reader:
    - shard-rkl:          [DMESG-FAIL][411] ([i915#12964]) -> [PASS][412]
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-rkl-1/igt@i915_suspend@debugfs-reader.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-4/igt@i915_suspend@debugfs-reader.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-glk:          [FAIL][413] ([i915#10991] / [i915#13335]) -> [PASS][414] +1 other test pass
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-glk4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [FAIL][415] ([i915#5138]) -> [PASS][416]
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-snb:          [FAIL][417] ([i915#11989]) -> [PASS][418] +1 other test pass
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-snb5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-snb4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
    - shard-tglu:         [FAIL][419] ([i915#11989]) -> [PASS][420] +3 other tests pass
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-tglu-10/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-10/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-mtlp:         [FAIL][421] ([i915#11989]) -> [PASS][422] +2 other tests pass
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-mtlp-6/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-2/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
    - shard-rkl:          [DMESG-WARN][423] ([i915#12964] / [i915#1982]) -> [PASS][424] +1 other test pass
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [SKIP][425] ([i915#4281]) -> [PASS][426]
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-tglu-8/igt@kms_pm_dc@dc9-dpms.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-tglu-6/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [SKIP][427] ([i915#9519]) -> [PASS][428]
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@perf_pmu@busy-idle@ccs0:
    - shard-dg2:          [FAIL][429] ([i915#4349]) -> [PASS][430] +1 other test pass
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg2-4/igt@perf_pmu@busy-idle@ccs0.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-4/igt@perf_pmu@busy-idle@ccs0.html

  * igt@perf_pmu@busy-idle@vecs0:
    - shard-dg1:          [FAIL][431] ([i915#4349]) -> [PASS][432] +1 other test pass
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-17/igt@perf_pmu@busy-idle@vecs0.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@perf_pmu@busy-idle@vecs0.html

  * igt@syncobj_timeline@invalid-query-zero-handles:
    - shard-dg1:          [DMESG-WARN][433] ([i915#4423]) -> [PASS][434] +3 other tests pass
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-18/igt@syncobj_timeline@invalid-query-zero-handles.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-14/igt@syncobj_timeline@invalid-query-zero-handles.html

  
#### Wa

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/index.html

--===============0312014802677136025==
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
<tr><td><b>Series:</b></td><td>Add dsc+bigjoiner subtest (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/128266/">https://patchwork.freedesktop.org/series/128266/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_12396/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_12396/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15919_full -&gt; IGTPW_12396_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12396_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_12396_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/index=
.html</p>
<h2>Participating hosts (10 -&gt; 11)</h2>
<p>Additional (1): shard-glk-0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1239=
6_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-glk4/igt@kms_ccs@crc-primary-suspend-y-tile=
d-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-basic-ultra-joiner} (NEW):</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_dsc@dsc-basic-ultra-joiner.h=
tml">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-fractional-bpp-big-joiner} (NEW):</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-3/igt@kms_dsc@dsc-fractional-bpp-big-j=
oiner.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultra-joiner} (NEW):</p>
<ul>
<li>{shard-dg2-9}:      NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-9/igt@kms_dsc@dsc-fractional-bpp-with-b=
pc-ultra-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-with-bpc-ultra-joiner} (NEW):</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@kms_dsc@dsc-with-bpc-ultra-joine=
r.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-with-formats-ultra-joiner} (NEW):</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-4/igt@kms_dsc@dsc-with-formats-ultra-j=
oiner.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-with-output-formats-big-joiner} (NEW):</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-8/igt@kms_dsc@dsc-with-output-formats-b=
ig-joiner.html">SKIP</a> +12 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats-b=
ig-joiner.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-tglu-4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396=
/shard-tglu-2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">ABORT</a> +2 oth=
er tests abort</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_15919_full and IGTPW_12396=
_full:</p>
<h3>New IGT tests (16)</h3>
<ul>
<li>
<p>igt@kms_dsc@dsc-basic-big-joiner:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultra-joiner:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-big-joiner:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultra-joiner:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-big-joiner:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultra-joiner:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-big-joiner:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-big-joiner:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-ultra-joiner:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-ultra-joiner:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-big-joiner:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-ultra-joiner:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-big-joiner:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-ultra-joiner:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-big-joiner:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultra-joiner:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12396_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-4/igt@api_intel_bb@object-reloc-keep-ca=
che.html">SKIP</a> ([i915#8411])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@api_intel_bb@object-reloc-keep-c=
ache.html">SKIP</a> ([i915#8411])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@api_intel_bb@object-reloc-keep-c=
ache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@debugfs_test@basic-hwmon.html">S=
KIP</a> ([i915#9318])</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-6/igt@device_reset@cold-reset-bound.ht=
ml">SKIP</a> ([i915#11078])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@device_reset@unbind-cold-reset-r=
ebind.html">SKIP</a> ([i915#11078])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@drm_fdinfo@most-busy-check-all@b=
cs0.html">SKIP</a> ([i915#8414]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@gem_ccs@ctrl-surf-copy.html">SKI=
P</a> ([i915#3555] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.ht=
ml">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@gem_ccs@large-ctrl-surf-copy.html=
">SKIP</a> ([i915#13008])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@gem_ccs@large-ctrl-surf-copy.htm=
l">SKIP</a> ([i915#13008])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-com=
pfmt0-lmem0-lmem0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_12396/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-c=
ompressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> ([i915#12392] / [i915#7=
297])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@gem_close_race@multigpu-basic-pro=
cess.html">SKIP</a> ([i915#7697])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@gem_close_race@multigpu-basic-pr=
ocess.html">SKIP</a> ([i915#7697])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@gem_close_race@multigpu-basic-pr=
ocess.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-10/igt@gem_close_race@multigpu-basic-th=
reads.html">SKIP</a> ([i915#7697]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@gem_create@create-ext-set-pat.ht=
ml">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-snb7/igt@gem_ctx_persistence@engines-queued=
.html">SKIP</a> ([i915#1099]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-4/igt@gem_ctx_persistence@heartbeat-hos=
tile.html">SKIP</a> ([i915#8555]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-ho=
stile.html">SKIP</a> ([i915#8555])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-2/igt@gem_ctx_persistence@heartbeat-ho=
stile.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-10/igt@gem_ctx_sseu@invalid-args.html"=
>SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@gem_eio@kms.html">DMESG-WARN</a>=
 ([i915#13363])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@gem_eio@kms.html">FAIL</a> ([i91=
5#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.ht=
ml">SKIP</a> ([i915#4771]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@gem_exec_balancer@bonded-sync.ht=
ml">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-8/igt@gem_exec_balancer@invalid-bonds.h=
tml">SKIP</a> ([i915#4036])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@gem_exec_balancer@invalid-bonds.=
html">SKIP</a> ([i915#4036])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-=
submit-fence.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-4/igt@gem_exec_balancer@parallel-out-f=
ence.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@gem_exec_capture@capture-invisibl=
e.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-5/igt@gem_exec_fence@submit3.html">SKIP=
</a> ([i915#4812]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@gem_exec_flush@basic-uc-prw-defa=
ult.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-2/igt@gem_exec_flush@basic-uc-set-defau=
lt.html">SKIP</a> ([i915#3539]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-6/igt@gem_exec_flush@basic-wb-pro-defau=
lt.html">SKIP</a> ([i915#3539] / [i915#4852]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-before-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@gem_exec_flush@basic-wb-rw-befor=
e-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@gem_exec_reloc@basic-wc-cpu-nore=
loc.html">SKIP</a> ([i915#3281]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@gem_exec_reloc@basic-write-gtt.h=
tml">SKIP</a> ([i915#3281]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@gem_exec_reloc@basic-write-read.h=
tml">SKIP</a> ([i915#3281]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-5/igt@gem_exec_reloc@basic-write-wc-no=
reloc.html">SKIP</a> ([i915#3281]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@gem_exec_schedule@preempt-queue-=
chain.html">SKIP</a> ([i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-2/igt@gem_exec_schedule@semaphore-power=
.html">SKIP</a> ([i915#7276])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-5/igt@gem_exec_schedule@semaphore-power=
.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-7/igt@gem_exec_suspend@basic-s4-devices=
.html">ABORT</a> ([i915#7975] / [i915#8213]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@gem_fenced_exec_thrash@2-spare-f=
ences.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-2/igt@gem_lmem_evict@dontneed-evict-rac=
e.html">SKIP</a> ([i915#4613] / [i915#7582])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-glk2/igt@gem_lmem_swapping@heavy-random.htm=
l">SKIP</a> ([i915#4613]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@gem_lmem_swapping@parallel-random=
-verify-ccs.html">SKIP</a> ([i915#4613]) +4 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@gem_lmem_swapping@parallel-rando=
m-verify-ccs.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@gem_lmem_swapping@parallel-rando=
m-verify-ccs.html">SKIP</a> ([i915#12193])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@gem_lmem_swapping@parallel-rando=
m-verify-ccs@lmem0.html">SKIP</a> ([i915#4565])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-1/igt@gem_lmem_swapping@random.html">S=
KIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-8/igt@gem_lmem_swapping@verify-ccs.htm=
l">SKIP</a> ([i915#4613]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-5/igt@gem_media_fill@media-fill.html">S=
KIP</a> ([i915#8289])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-bo-tiledy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-1/igt@gem_mmap_gtt@big-bo-tiledy.html"=
>SKIP</a> ([i915#4077])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@close-race:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-14/igt@gem_mmap_gtt@close-race.html">SK=
IP</a> ([i915#4077]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-10/igt@gem_mmap_gtt@fault-concurrent-y.=
html">SKIP</a> ([i915#4077]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@fault-concurrent:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@gem_mmap_wc@fault-concurrent.htm=
l">SKIP</a> ([i915#4083]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@invalid-flags:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@gem_mmap_wc@invalid-flags.html">=
SKIP</a> ([i915#4083]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-prefaulted:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-3/igt@gem_mmap_wc@write-prefaulted.htm=
l">SKIP</a> ([i915#4083])</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-3/igt@gem_partial_pwrite_pread@write.ht=
ml">SKIP</a> ([i915#3282]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-4/igt@gem_partial_pwrite_pread@write-un=
cached.html">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-self:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@gem_pwrite@basic-self.html">SKIP=
</a> ([i915#3282]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-7/igt@gem_pxp@create-regular-context-2.=
html">TIMEOUT</a> ([i915#12917] / [i915#12964]) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-10/igt@gem_pxp@display-protected-crc.ht=
ml">SKIP</a> ([i915#4270]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-buffer.ht=
ml">SKIP</a> ([i915#13398])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-10/igt@gem_pxp@hw-rejects-pxp-context.=
html">SKIP</a> ([i915#13398])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@gem_pxp@reject-modify-context-pr=
otection-off-3.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-linear:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-4/igt@gem_render_copy@yf-tiled-ccs-to-=
linear.html">SKIP</a> ([i915#8428]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-1/igt@gem_render_copy@yf-tiled-mc-ccs-t=
o-vebox-y-tiled.html">SKIP</a> ([i915#5190] / [i915#8428]) +10 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@gem_set_tiling_vs_blt@untiled-to-=
tiled.html">SKIP</a> ([i915#4079]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-snb7/igt@gem_tiled_swapping@non-threaded.ht=
ml">ABORT</a> ([i915#13263] / [i915#13449])</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-glk2/igt@gem_tiled_swapping@non-threaded.ht=
ml">ABORT</a> ([i915#13263] / [i915#13449])</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@gem_unfence_active_buffers.html"=
>SKIP</a> ([i915#4879])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-6/igt@gem_unfence_active_buffers.html">=
SKIP</a> ([i915#4879])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-3/igt@gem_userptr_blits@coherency-unsyn=
c.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@gem_userptr_blits@coherency-unsy=
nc.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-8/igt@gem_userptr_blits@dmabuf-sync.ht=
ml">SKIP</a> ([i915#3297] / [i915#3323])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-6/igt@gem_userptr_blits@dmabuf-sync.ht=
ml">SKIP</a> ([i915#3297])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-3/igt@gem_userptr_blits@dmabuf-sync.htm=
l">SKIP</a> ([i915#3297] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@gem_userptr_blits@forbidden-oper=
ations.html">SKIP</a> ([i915#3282] / [i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-2/igt@gem_userptr_blits@readonly-pwrit=
e-unsync.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@gem_userptr_blits@sd-probe.html"=
>SKIP</a> ([i915#3297] / [i915#4958])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@gem_userptr_blits@unsync-unmap.ht=
ml">SKIP</a> ([i915#3297]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@gem_userptr_blits@unsync-unmap-a=
fter-close.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-glk2/igt@gem_workarounds@suspend-resume-fd.=
html">INCOMPLETE</a> ([i915#13356])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-3/igt@gen9_exec_parse@basic-rejected.h=
tml">SKIP</a> ([i915#2527] / [i915#2856]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-4/igt@gen9_exec_parse@batch-without-en=
d.html">SKIP</a> ([i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@gen9_exec_parse@bb-large.html">S=
KIP</a> ([i915#2527]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-6/igt@gen9_exec_parse@bb-oversize.html"=
>SKIP</a> ([i915#2527]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@gen9_exec_parse@cmd-crossing-pag=
e.html">SKIP</a> ([i915#2527] / [i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-3/igt@gen9_exec_parse@shadow-peek.html"=
>SKIP</a> ([i915#2856]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_15919/shard-dg1-14/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-13/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_15919/shard-dg1-18/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/=
shard-dg1-14/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-17/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_15919/shard-dg1-17/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-18/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_15919/shard-dg1-12/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/=
shard-dg1-14/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-13/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_15919/shard-dg1-12/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-13/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_15919/shard-dg1-17/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/=
shard-dg1-18/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-18/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_15919/shard-dg1-12/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-12/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_15919/shard-dg1-14/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/=
shard-dg1-13/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15919/shard-dg1-17/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_15919/shard-dg1-12/igt@i915_module_load@load.html">PASS</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1=
-13/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12=
396/shard-dg1-13/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_12396/shard-dg1-14/igt@i915_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-14/i=
gt@i915_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
2396/shard-dg1-17/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@i915_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_12396/shard-dg1-17/igt@i915_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-12/=
igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@i915_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/=
shard-dg1-13/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-14/igt@i915_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_12396/shard-dg1-18/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-14/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard=
-dg1-12/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@i915_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_12396/shard-dg1-12/igt@i915_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@i915_m=
odule_load@load.html">PASS</a>) ([i915#4423])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-6/igt@i915_module_load@reload-with-fau=
lt-injection.html">ABORT</a> ([i915#12817] / [i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@i915_module_load@resize-bar.html=
">SKIP</a> ([i915#6412])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-2/igt@i915_pm_freq_api@freq-reset.html"=
>SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-mult=
iple.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@i915_pm_rps@basic-api.html">SKIP=
</a> ([i915#11681] / [i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@i915_power@sanity.html">SKIP</a> =
([i915#7984])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@i915_selftest@mock@memory_region.=
html">DMESG-WARN</a> ([i915#9311]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-glk1/igt@i915_suspend@fence-restore-tiled2untiled.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
2396/shard-glk7/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLE=
TE</a> ([i915#4817])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-glk5/igt@i915_suspend@forcewake.html">INCOM=
PLETE</a> ([i915#4817])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-3/igt@kms_addfb_basic@addfb25-y-tiled-s=
mall-legacy.html">SKIP</a> ([i915#5190]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-4/igt@kms_addfb_basic@framebuffer-vs-se=
t-tiling.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-7/igt@kms_addfb_basic@invalid-smem-bo-=
on-discrete.html">SKIP</a> ([i915#12454] / [i915#12712])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-6/igt@kms_addfb_basic@invalid-smem-bo-=
on-discrete.html">SKIP</a> ([i915#12454] / [i915#12712])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-=
a-1-y-rc-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-7/igt@kms_async_flips@async-flip-with-p=
age-flip-events-atomic@pipe-a-hdmi-a-1-y-rc-ccs.html">SKIP</a> ([i915#8709]=
) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-r=
c-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@kms_async_flips@async-flip-with-=
page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html">SKIP</a> ([i915#8709]) +15 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-m=
c-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-4/igt@kms_async_flips@async-flip-with-p=
age-flip-events@pipe-c-hdmi-a-1-4-mc-ccs.html">SKIP</a> ([i915#8709]) +11 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@kms_async_flips@invalid-async-fl=
ip.html">SKIP</a> ([i915#12967] / [i915#6228])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@kms_atomic_transition@plane-all-m=
odeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555]=
)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-6/igt@kms_atomic_transition@plane-all-=
modeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555=
])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-dg1-18/igt@kms_atomic_transition@plane-toggle-modeset-t=
ransition.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_12396/shard-dg1-13/igt@kms_atomic_transition@plane-toggle-mod=
eset-transition.html">FAIL</a> ([i915#5956]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-=
3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@kms_atomic_transition@plane-togg=
le-modeset-transition@pipe-a-hdmi-a-3.html">FAIL</a> ([i915#5956])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-9=
0.html">SKIP</a> ([i915#5286]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0-hflip.html">SKIP</a> ([i915#4538] / [i915#5286]) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-6/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-0.html">SKIP</a> ([i915#5286]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-180-async-flip.html">SKIP</a> ([i915#5286]) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-3/igt@kms_big_fb@linear-8bpp-rotate-270=
.html">SKIP</a> ([i915#3638]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0=
.html">SKIP</a> ([i915#4538] / [i915#5190]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@kms_big_fb@y-tiled-8bpp-rotate-9=
0.html">SKIP</a> ([i915#3638]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-5/igt@kms_big_fb@y-tiled-addfb-size-ov=
erflow.html">SKIP</a> ([i915#6187])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-8/igt@kms_big_fb@yf-tiled-32bpp-rotate=
-180.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-0.html">SKIP</a> ([i915#4538]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-7/igt@kms_ccs@bad-pixel-format-4-tiled=
-dg2-rc-ccs-cc.html">SKIP</a> ([i915#6095]) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-8/igt@kms_ccs@bad-pixel-format-4-tiled=
-dg2-rc-ccs-cc@pipe-c-edp-1.html">SKIP</a> ([i915#6095]) +24 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-10/igt@kms_ccs@bad-pixel-format-4-tiled=
-mtl-rc-ccs@pipe-b-dp-4.html">SKIP</a> ([i915#10307] / [i915#6095]) +169 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-8/igt@kms_ccs@bad-pixel-format-y-tiled-=
ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / [i915#609=
5]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-6/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html">SKIP</a> ([i915#12805])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-glk4/igt@kms_ccs@crc-primary-suspend-y-tile=
d-ccs.html">INCOMPLETE</a> ([i915#12796])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-y-ti=
led-ccs@pipe-b-dp-4.html">SKIP</a> ([i915#6095]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs-cc.html">DMESG-FAIL</a> ([i915#12964]) +3 other tests dmesg=
-fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-glk9/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-=
a-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_12396/shard-glk6/igt@kms_ccs@crc-primary-suspend-yf-tiled-cc=
s@pipe-a-hdmi-a-1.html">INCOMPLETE</a> ([i915#12796])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:<=
/p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#6095]) +39 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-lnl-ccs.html">SKIP</a> ([i915#12313])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-10/igt@kms_ccs@crc-sprite-planes-basic=
-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#6095]) +74 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-4/igt@kms_ccs@random-ccs-data-4-tiled-b=
mg-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-mc-ccs@pipe-c-hdmi-a-3.html">SKIP</a> ([i915#6095]) +175 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@kms_cdclk@mode-transition.html">S=
KIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-6/igt@kms_chamelium_edid@dp-edid-chang=
e-during-suspend.html">SKIP</a> ([i915#7828]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-4/igt@kms_chamelium_edid@dp-mode-timin=
gs.html">SKIP</a> ([i915#7828]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@kms_chamelium_edid@hdmi-edid-chan=
ge-during-suspend.html">SKIP</a> ([i915#7828]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-1/igt@kms_chamelium_frames@dp-crc-fast.=
html">SKIP</a> ([i915#7828]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@kms_chamelium_frames@vga-frame-d=
ump.html">SKIP</a> ([i915#7828]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-after-s=
uspend.html">SKIP</a> ([i915#7828]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_color@deep-color.html">SKIP<=
/a> ([i915#3555] / [i915#9979])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-10/igt@kms_content_protection@atomic.h=
tml">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-1/igt@kms_content_protection@dp-mst-lic=
-type-0.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-4/igt@kms_content_protection@dp-mst-typ=
e-1.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-7/igt@kms_content_protection@legacy.htm=
l">SKIP</a> ([i915#7118] / [i915#9424])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@kms_content_protection@legacy.ht=
ml">SKIP</a> ([i915#7116] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@kms_content_protection@lic-type-0=
.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-9/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> ([i915#6944] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-1/igt@kms_content_protection@srm.html"=
>SKIP</a> ([i915#6944])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@kms_content_protection@type1.html=
">SKIP</a> ([i915#7118] / [i915#9424]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-5/igt@kms_cursor_crc@cursor-offscreen-3=
2x10.html">SKIP</a> ([i915#3555]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-256x256.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12=
396/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-256x256.html">DMESG-WARN=
</a> ([i915#12964]) +40 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-3/igt@kms_cursor_crc@cursor-onscreen-51=
2x170.html">SKIP</a> ([i915#13049])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-5=
12x512.html">SKIP</a> ([i915#13049])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-64x21.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1239=
6/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-64x21.html">DMESG-WARN</a>=
 ([i915#12917] / [i915#12964]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-4/igt@kms_cursor_crc@cursor-random-32x=
10.html">SKIP</a> ([i915#3555]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@kms_cursor_crc@cursor-random-32x=
32.html">SKIP</a> ([i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@kms_cursor_crc@cursor-random-512=
x170.html">SKIP</a> ([i915#13049]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-move=
ment-32x10.html">SKIP</a> ([i915#3555] / [i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x128@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-128=
x128@pipe-b-hdmi-a-2.html">DMESG-WARN</a> ([i915#12964]) +25 other tests dm=
esg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512=
x170.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-51=
2x170.html">SKIP</a> ([i915#13049])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> ([i915#13049])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-1/igt@kms_cursor_legacy@2x-flip-vs-cur=
sor-atomic.html">SKIP</a> ([i915#9809]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-curs=
or-legacy.html">SKIP</a> +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-1/igt@kms_cursor_legacy@2x-long-flip-vs=
-cursor-atomic.html">SKIP</a> ([i915#13046] / [i915#5354]) +7 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-legacy.html">SKIP</a> ([i915#4103]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4103]=
 / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-toggle.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-6/igt@kms_display_modes@mst-extended-m=
ode-negative.html">SKIP</a> ([i915#8588])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-3/igt@kms_draw_crc@draw-method-mmap-gtt=
.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> =
([i915#3555] / [i915#3840]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-3/igt@kms_dsc@dsc-fractional-bpp.html">=
SKIP</a> ([i915#3840] / [i915#9688])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp.html">=
SKIP</a> ([i915#3840])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@kms_dsc@dsc-fractional-bpp.html"=
>SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-14/igt@kms_dsc@dsc-with-bpc-formats.htm=
l">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-2/igt@kms_dsc@dsc-with-formats.html">SK=
IP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats-w=
ith-bpc.html">SKIP</a> ([i915#3840] / [i915#9053])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-10/igt@kms_dsc@dsc-with-output-formats=
-with-bpc.html">SKIP</a> ([i915#3840] / [i915#9053])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-2/igt@kms_feature_discovery@display-4x.=
html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-1/igt@kms_feature_discovery@dp-mst.htm=
l">SKIP</a> ([i915#9337])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@kms_feature_discovery@psr1.html">=
SKIP</a> ([i915#658]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-14/igt@kms_feature_discovery@psr2.html"=
>SKIP</a> ([i915#658])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@kms_feature_discovery@psr2.html">=
SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-2/igt@kms_flip@2x-absolute-wf_vblank-i=
nterruptible.html">SKIP</a> ([i915#3637]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@kms_flip@2x-flip-vs-blocking-wf-v=
blank.html">SKIP</a> ([i915#9934]) +8 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@kms_flip@2x-flip-vs-blocking-wf-=
vblank.html">SKIP</a> ([i915#9934]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-6/igt@kms_flip@2x-flip-vs-modeset.html=
">SKIP</a> ([i915#3637]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@kms_flip@2x-flip-vs-panning-inte=
rruptible.html">SKIP</a> ([i915#9934]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_flip@2x-wf_vblank-ts-check.h=
tml">SKIP</a> ([i915#3637]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-5/igt@kms_flip@flip-vs-fences-interrupt=
ible.html">SKIP</a> ([i915#8381]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-rkl-3/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-r=
kl-5/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> ([i915#11989]) +2 other=
 tests fail</li>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-snb4/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-sn=
b7/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> ([i915#11989]) +1 other t=
est fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-tglu-8/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12=
396/shard-tglu-9/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html">FAIL</a> (=
[i915#11989]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> ([i915#2672] / [i915=
#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587]=
 / [i915#2672]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> ([i915#2672] / [i915#35=
55])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i91=
5#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> ([i915#2672] / [i915#35=
55] / [i915#8813])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tileccs-to-64bpp-yftile-downscaling.html">SKIP</a> ([i915#2672] / [i915#355=
5]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i=
915#2672] / [i915#8813])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915=
#2672]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ileccs-to-64bpp-ytile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555] /=
 [i915#5190]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-=
ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> ([i915#2587] / [i915#2672]=
 / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587]=
 / [i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> ([i915#2672] / [i915#=
3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i=
915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16b=
pp-linear-upscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64b=
pp-linear-to-16bpp-linear-upscaling.html">DMESG-WARN</a> ([i915#4423])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-=
offscren-pri-shrfb-draw-pwrite.html">FAIL</a> ([i915#6880])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-i=
ndfb-draw-mmap-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_12396/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-rgb=
565-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tili=
ng-4.html">SKIP</a> ([i915#5439])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-til=
ing-4.html">SKIP</a> ([i915#5439])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-pri-indfb-multidraw.html">SKIP</a> ([i915#3458]) +17 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-spr-indfb-draw-render.html">SKIP</a> ([i915#3458]) +19 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +21 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-cur-indfb-onoff.html">SKIP</a> ([i915#1825]) +8 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-spr-indfb-draw-pwrite.html">SKIP</a> ([i915#3023]) +22 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-indfb-msflip-blt.html">SKIP</a> ([i915#1825]) +32 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> +437 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-shrfb-draw-pwrite.html">SKIP</a> ([i915#5354]) +31 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-handle-not-fb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@kms_getfb@getfb-handle-not-fb.ht=
ml">DMESG-WARN</a> ([i915#4423])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@kms_hdr@bpc-switch-dpms.html">SKI=
P</a> ([i915#3555] / [i915#8228])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-14/igt@kms_hdr@bpc-switch-dpms.html">SK=
IP</a> ([i915#3555] / [i915#8228])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-9/igt@kms_hdr@bpc-switch-dpms.html">SK=
IP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_hdr@static-swap.html">SKIP</=
a> ([i915#3555] / [i915#8228])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-11/igt@kms_hdr@static-swap.html">SKIP</=
a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@algo-basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-4/igt@kms_histogram@algo-basic.html">S=
KIP</a> ([i915#13389])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-3/igt@kms_histogram@algo-basic.html">SK=
IP</a> ([i915#13389])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@kms_histogram@algo-basic.html">SK=
IP</a> ([i915#13389])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_histogram@algo-basic.html">S=
KIP</a> ([i915#13389])</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@algo-color:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@kms_histogram@algo-color.html">S=
KIP</a> ([i915#13389]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@global-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-6/igt@kms_histogram@global-basic.html">=
SKIP</a> ([i915#13388])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@kms_joiner@basic-force-big-joine=
r.html">SKIP</a> ([i915#12388])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-4/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> ([i915#12394])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-4/igt@kms_joiner@basic-force-ultra-join=
er.html">SKIP</a> ([i915#12394])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@kms_joiner@basic-ultra-joiner.htm=
l">SKIP</a> ([i915#12339])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> ([i915#12339])</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@kms_panel_fitting@atomic-fastset.=
html">SKIP</a> ([i915#6301])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_panel_fitting@atomic-fastset=
.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-3/igt@kms_pipe_b_c_ivb@disable-pipe-b-e=
nable-pipe-c.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-glk8/igt@kms_plane@plane-panning-bottom-rig=
ht-suspend.html">INCOMPLETE</a> ([i915#13026]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@kms_plane_multiple@tiling-yf.html=
">SKIP</a> ([i915#3555]) +4 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> ([i915#3555]) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-3/igt@kms_plane_multiple@tiling-yf.html=
">SKIP</a> ([i915#3555] / [i915#8806])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_plane_scaling@plane-downscal=
e-factor-0-25-with-pixel-format.html">SKIP</a> ([i915#12247]) +8 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-3/igt@kms_plane_scaling@plane-downscal=
e-factor-0-25-with-rotation@pipe-c.html">SKIP</a> ([i915#12247]) +13 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
b:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@kms_plane_scaling@plane-scaler-wi=
th-clipping-clamping-rotation@pipe-b.html">SKIP</a> ([i915#12247]) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:=
</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-1/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-20x20@pipe-a.html">SKIP</a> ([i915#12247]) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:=
</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-14/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> ([i915#12247]) +8 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#695=
3])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-6/igt@kms_plane_scaling@planes-unity-sc=
aling-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953] / [i=
915#9423])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-3/igt@kms_plane_scaling@planes-unity-s=
caling-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-6/igt@kms_plane_scaling@planes-unity-sc=
aling-downscale-factor-0-25@pipe-c.html">SKIP</a> ([i915#12247]) +7 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555])</l=
i>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-10/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555] / [=
i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-6/igt@kms_pm_backlight@basic-brightness=
.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@kms_pm_backlight@brightness-with-=
dpms.html">SKIP</a> ([i915#12343])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-14/igt@kms_pm_backlight@fade-with-suspe=
nd.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-3/igt@kms_pm_dc@dc6-psr.html">SKIP</a> =
([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-1/igt@kms_pm_dc@dc9-dpms.html">SKIP</a>=
 ([i915#3361])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP<=
/a> ([i915#3828])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-10/igt@kms_pm_rpm@dpms-mode-unset-non-=
lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-dg2-1/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-dg2-=
4/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#9519]) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shar=
d-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stres=
s.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-1/igt@kms_prime@basic-crc-vgem.html">SK=
IP</a> ([i915#6524] / [i915#6805])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@kms_prime@basic-modeset-hybrid.h=
tml">SKIP</a> ([i915#6524]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-e=
dp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> ([i915#9808]) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-overlay-prim=
ary-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +7 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1=
:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-overlay-pri=
mary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> ([i915#12316]) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-glk6/igt@kms_psr2_sf@fbc-psr2-primary-plane=
-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_psr2_sf@pr-cursor-plane-upda=
te-sf.html">SKIP</a> ([i915#11520])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-snb4/igt@kms_psr2_sf@psr2-cursor-plane-move=
-continuous-exceed-fully-sf.html">SKIP</a> ([i915#11520]) +11 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-8/igt@kms_psr2_sf@psr2-cursor-plane-mo=
ve-continuous-sf.html">SKIP</a> ([i915#11520]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-sf.html">SKIP</a> ([i915#11520]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-2/igt@kms_psr2_sf@psr2-overlay-plane-up=
date-sf-dmg-area.html">SKIP</a> ([i915#11520]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-14/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-8/igt@kms_psr2_su@page_flip-xrgb8888.ht=
ml">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-7/igt@kms_psr@fbc-pr-cursor-plane-onoff=
.html">SKIP</a> ([i915#1072] / [i915#9732]) +23 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@kms_psr@fbc-pr-cursor-plane-onof=
f.html">SKIP</a> ([i915#1072] / [i915#9732]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-8/igt@kms_psr@fbc-psr-no-drrs.html">SK=
IP</a> ([i915#9732]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@kms_psr@fbc-psr-primary-page-flip=
.html">SKIP</a> ([i915#1072] / [i915#9732]) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-4/igt@kms_psr@pr-basic.html">SKIP</a> =
([i915#9688]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_psr@psr-sprite-plane-move.ht=
ml">SKIP</a> ([i915#9732]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-3/igt@kms_psr@psr2-primary-mmap-gtt@ed=
p-1.html">SKIP</a> ([i915#4077] / [i915#9688]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-glk9/igt@kms_psr@psr2-sprite-plane-onoff.ht=
ml">SKIP</a> +229 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-13/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> ([i915#9685]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-1/igt@kms_psr_stress_test@invalidate-pr=
imary-flip-overlay.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_rotation_crc@primary-4-tiled=
-reflect-x-180.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-=
reflect-x-270.html">SKIP</a> ([i915#12755] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-0.html">SKIP</a> ([i915#5289]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-0.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-3/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-270.html">SKIP</a> ([i915#12755])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation=
-270.html">SKIP</a> ([i915#12755])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-snb4/igt@kms_setmode@basic.html">FAIL</a> (=
[i915#5465]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@kms_sysfs_edid_timing.html">FAIL=
</a> ([IGT#160] / [i915#6493])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-glk5/igt@kms_tiled_display@basic-test-patte=
rn.html">FAIL</a> ([i915#10959])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@kms_vblank@query-forked-hang.html=
">DMESG-WARN</a> ([i915#12917] / [i915#12964]) +3 other tests dmesg-warn</l=
i>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-glk7/igt@kms_vblank@ts-continuation-suspend=
.html">INCOMPLETE</a> ([i915#12276]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-2/igt@kms_vrr@max-min.html">SKIP</a> ([=
i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-4/igt@kms_vrr@seamless-rr-switch-vrr.ht=
ml">SKIP</a> ([i915#9906]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@kms_writeback@writeback-check-out=
put.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@kms_writeback@writeback-check-out=
put-xrgb2101010.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-2/igt@kms_writeback@writeback-fb-id.ht=
ml">SKIP</a> ([i915#2437]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-12/igt@kms_writeback@writeback-invalid-=
parameters.html">SKIP</a> ([i915#2437])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-7/igt@kms_writeback@writeback-invalid-=
parameters.html">SKIP</a> ([i915#2437]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-8/igt@kms_writeback@writeback-pixel-fo=
rmats.html">SKIP</a> ([i915#2437] / [i915#9412]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-mtlp-2/igt@perf@global-sseu-config.html">SK=
IP</a> ([i915#7387])</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config-invalid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-7/igt@perf@global-sseu-config-invalid.h=
tml">SKIP</a> ([i915#7387]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-10/igt@perf_pmu@busy-double-start@vecs1=
.html">FAIL</a> ([i915#4349]) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-mtlp-1/igt@perf_pmu@most-busy-idle-check-all@vcs0.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
2396/shard-mtlp-1/igt@perf_pmu@most-busy-idle-check-all@vcs0.html">FAIL</a>=
 ([i915#11943]) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-5/igt@perf_pmu@rc6@other-idle-gt0.html"=
>SKIP</a> ([i915#8516])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-9/igt@perf_pmu@rc6@other-idle-gt0.html=
">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@render-node-busy-idle@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-mtlp-4/igt@perf_pmu@render-node-busy-idle@vcs1.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1239=
6/shard-mtlp-1/igt@perf_pmu@render-node-busy-idle@vcs1.html">FAIL</a> ([i91=
5#4349]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg2-2/igt@prime_vgem@basic-fence-mmap.html"=
>SKIP</a> ([i915#3708] / [i915#4077])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-17/igt@prime_vgem@basic-fence-read.html=
">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-rkl-3/igt@prime_vgem@fence-read-hang.html">=
SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-6/igt@prime_vgem@fence-write-hang.html=
">SKIP</a> +66 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-tglu-1/igt@sriov_basic@enable-vfs-autoprobe=
-off@numvfs-all.html">FAIL</a> ([i915#12910]) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12396/shard-dg1-18/igt@sriov_basic@enable-vfs-autoprobe=
-on.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_create@create-clear@smem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-dg2-3/igt@gem_create@create-clear@smem0.html">INCOMPLET=
E</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396=
/shard-dg2-8/igt@gem_create@create-clear@smem0.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@full-late-pulse:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-mtlp-4/igt@gem_exec_balancer@full-late-pulse.html">FAIL=
</a> ([i915#13364]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_12396/shard-mtlp-4/igt@gem_exec_balancer@full-late-pulse.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preemptive-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-rkl-5/igt@gem_exec_schedule@preemptive-hang.html">DMESG=
-WARN</a> ([i915#12964]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_12396/shard-rkl-7/igt@gem_exec_schedule@preemptive-hang.html"=
>PASS</a> +35 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-tglu-9/igt@gem_tiled_swapping@non-threaded.html">FAIL</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/sh=
ard-tglu-9/igt@gem_tiled_swapping@non-threaded.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-mtlp-7/igt@i915_selftest@live@workarounds.html">DMESG-F=
AIL</a> ([i915#13393]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_12396/shard-mtlp-3/igt@i915_selftest@live@workarounds.html">PAS=
S</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-rkl-1/igt@i915_suspend@debugfs-reader.html">DMESG-FAIL<=
/a> ([i915#12964]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_12396/shard-rkl-4/igt@i915_suspend@debugfs-reader.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip-atom=
ic@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#10991] / [i915#13335]) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/shard-glk4/igt@k=
ms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">PASS<=
/a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotat=
e-0-hflip.html">FAIL</a> ([i915#5138]) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_12396/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-h=
w-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-snb5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.h=
tml">FAIL</a> ([i915#11989]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_12396/shard-snb4/igt@kms_flip@2x-wf_vblank-ts-check-inter=
ruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-tglu-10/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-=
a1.html">FAIL</a> ([i915#11989]) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_12396/shard-tglu-10/igt@kms_flip@flip-vs-blocking-wf-=
vblank@c-hdmi-a1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-mtlp-6/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html"=
>FAIL</a> ([i915#11989]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_12396/shard-mtlp-2/igt@kms_flip@plain-flip-fb-recreate@a-edp1=
.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-=
clamping-pixel-formats@pipe-a.html">DMESG-WARN</a> ([i915#12964] / [i915#19=
82]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/=
shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel=
-formats@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-tglu-8/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> ([i915#428=
1]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12396/s=
hard-tglu-6/igt@kms_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915=
#9519]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_123=
96/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle@ccs0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-dg2-4/igt@perf_pmu@busy-idle@ccs0.html">FAIL</a> ([i915=
#4349]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_123=
96/shard-dg2-4/igt@perf_pmu@busy-idle@ccs0.html">PASS</a> +1 other test pas=
s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle@vecs0:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-dg1-17/igt@perf_pmu@busy-idle@vecs0.html">FAIL</a> ([i9=
15#4349]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
2396/shard-dg1-18/igt@perf_pmu@busy-idle@vecs0.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-query-zero-handles:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15919/shard-dg1-18/igt@syncobj_timeline@invalid-query-zero-handles.=
html">DMESG-WARN</a> ([i915#4423]) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_12396/shard-dg1-14/igt@syncobj_timeline@invalid-que=
ry-zero-handles.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h4>Wa</h4>

</body>
</html>

--===============0312014802677136025==--
