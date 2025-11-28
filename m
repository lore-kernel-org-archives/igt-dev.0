Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536CBCFD376
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 06:47:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA0910E0EB;
	Fri, 28 Nov 2025 06:47:12 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFB310E0EB;
 Fri, 28 Nov 2025 06:47:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9064664771293550468=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Fexec=5F?=
 =?utf-8?q?system=5Fallocator=3A_Added_64k_alignment_support_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 28 Nov 2025 06:47:11 -0000
Message-ID: <176431243123.37845.6665547470508819256@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251128043832.322810-1-sobin.thomas@intel.com>
In-Reply-To: <20251128043832.322810-1-sobin.thomas@intel.com>
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

--===============9064664771293550468==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_system_allocator: Added 64k alignment support (rev3)
URL   : https://patchwork.freedesktop.org/series/157691/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8644_full -> IGTPW_14130_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14130_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14130_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14130_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_colorop@plane-xr24-xr24-bypass:
    - shard-tglu-1:       NOTRUN -> [SKIP][1] +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_colorop@plane-xr24-xr24-bypass.html

  * igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc:
    - shard-tglu:         NOTRUN -> [SKIP][2] +13 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-2/igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc.html

  * igt@kms_colorop@plane-xr24-xr24-pq_eotf:
    - shard-dg2:          NOTRUN -> [SKIP][3] +13 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_colorop@plane-xr24-xr24-pq_eotf.html

  * igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf-srgb_eotf:
    - shard-rkl:          NOTRUN -> [SKIP][4] +10 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-3/igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf-srgb_eotf.html

  * igt@kms_colorop@plane-xr30-xr30-multiply_125:
    - shard-mtlp:         NOTRUN -> [SKIP][5] +12 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-6/igt@kms_colorop@plane-xr30-xr30-multiply_125.html

  * igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut:
    - shard-dg1:          NOTRUN -> [SKIP][6] +12 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-17/igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-dg2:          NOTRUN -> [CRASH][7] +1 other test crash
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-7/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_fb_coherency@memset-crc@mmap-gtt:
    - shard-rkl:          NOTRUN -> [CRASH][8] +1 other test crash
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@kms_fb_coherency@memset-crc@mmap-gtt.html
    - shard-snb:          NOTRUN -> [CRASH][9] +1 other test crash
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-snb4/igt@kms_fb_coherency@memset-crc@mmap-gtt.html
    - shard-tglu:         NOTRUN -> [CRASH][10] +1 other test crash
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-7/igt@kms_fb_coherency@memset-crc@mmap-gtt.html

  * igt@kms_fb_coherency@memset-crc@mmap-offset-fixed:
    - shard-dg1:          NOTRUN -> [CRASH][11] +1 other test crash
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@kms_fb_coherency@memset-crc@mmap-offset-fixed.html

  
#### Warnings ####

  * igt@kms_colorop@plane-xr30-xr30-pq_125_inv_eotf:
    - shard-rkl:          [SKIP][12] ([i915#14544]) -> [SKIP][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/igt@kms_colorop@plane-xr30-xr30-pq_125_inv_eotf.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt@kms_colorop@plane-xr30-xr30-pq_125_inv_eotf.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_colorop@plane-xr24-xr24-gamma_2_2_inv_oetf}:
    - shard-tglu:         NOTRUN -> [SKIP][14] +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-7/igt@kms_colorop@plane-xr24-xr24-gamma_2_2_inv_oetf.html

  * {igt@kms_colorop@plane-xr30-xr30-gamma_2_2_inv_oetf-gamma_2_2_oetf-gamma_2_2_inv_oetf}:
    - shard-dg2:          NOTRUN -> [SKIP][15] +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_colorop@plane-xr30-xr30-gamma_2_2_inv_oetf-gamma_2_2_oetf-gamma_2_2_inv_oetf.html
    - shard-rkl:          NOTRUN -> [SKIP][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_colorop@plane-xr30-xr30-gamma_2_2_inv_oetf-gamma_2_2_oetf-gamma_2_2_inv_oetf.html
    - shard-tglu-1:       NOTRUN -> [SKIP][17] +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_colorop@plane-xr30-xr30-gamma_2_2_inv_oetf-gamma_2_2_oetf-gamma_2_2_inv_oetf.html
    - shard-dg1:          NOTRUN -> [SKIP][18] +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-13/igt@kms_colorop@plane-xr30-xr30-gamma_2_2_inv_oetf-gamma_2_2_oetf-gamma_2_2_inv_oetf.html
    - shard-mtlp:         NOTRUN -> [SKIP][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@kms_colorop@plane-xr30-xr30-gamma_2_2_inv_oetf-gamma_2_2_oetf-gamma_2_2_inv_oetf.html

  
New tests
---------

  New tests have been introduced between IGT_8644_full and IGTPW_14130_full:

### New IGT tests (13) ###

  * igt@i915_pm_rps@drm_format:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rps@query-forked-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rps@yf-tiled-16bpp-rotate-180:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_properties@colorop-properties-atomic@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_properties@colorop-properties-atomic@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_properties@colorop-properties-atomic@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.11] s

  * igt@kms_properties@colorop-properties-atomic@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_properties@colorop-properties-atomic@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.03] s

  * igt@kms_properties@colorop-properties-atomic@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.03] s

  * igt@kms_properties@colorop-properties-legacy@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_properties@colorop-properties-legacy@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.12] s

  * igt@kms_properties@colorop-properties-legacy@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_properties@colorop-properties-legacy@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.05] s

  

Known issues
------------

  Here are the changes found in IGTPW_14130_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_buddy@drm_buddy:
    - shard-mtlp:         NOTRUN -> [DMESG-WARN][20] ([i915#15095]) +1 other test dmesg-warn
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@drm_buddy@drm_buddy.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][21] ([i915#9323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-10/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#3555] / [i915#9323])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@gem_ccs@block-multicopy-inplace.html
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#3555] / [i915#9323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-18/igt@gem_ccs@block-multicopy-inplace.html
    - shard-tglu:         NOTRUN -> [SKIP][24] ([i915#3555] / [i915#9323])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-3/igt@gem_ccs@block-multicopy-inplace.html
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#3555] / [i915#9323])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#9323])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][27] ([i915#7697])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-3/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#7697])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-11/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#7697])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-15/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#6335])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-6/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-dg2:          [PASS][31] -> [ABORT][32] ([i915#15317])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-dg2-5/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#8555]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#8555]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@processes:
    - shard-snb:          NOTRUN -> [SKIP][35] ([i915#1099]) +6 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-snb1/igt@gem_ctx_persistence@processes.html

  * igt@gem_ctx_sseu@engines:
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#280]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#4771])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@gem_exec_balancer@bonded-pair.html
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#4771])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-18/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][39] ([i915#4771])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@hog:
    - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#4812])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-6/igt@gem_exec_balancer@hog.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#4036])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#4525]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-tglu:         NOTRUN -> [SKIP][43] ([i915#4525]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-10/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#6334]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-11/igt@gem_exec_capture@capture-invisible.html
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#6334]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-1/igt@gem_exec_capture@capture-invisible.html
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#6334]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-17/igt@gem_exec_capture@capture-invisible.html
    - shard-tglu:         NOTRUN -> [SKIP][47] ([i915#6334]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-9/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][48] ([i915#6334]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-glk1/igt@gem_exec_capture@capture-invisible@smem0.html
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#6334]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_fence@submit:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#4812]) +4 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@gem_exec_fence@submit.html
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4812]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#3539])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#3539] / [i915#4852]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-7/igt@gem_exec_flush@basic-wb-ro-before-default.html
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#3539] / [i915#4852]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-15/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#3281]) +9 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-7/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-cpu-wc-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#14544] / [i915#3281]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-wc-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#3281]) +9 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@gem_exec_reloc@basic-gtt-wc.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#3281]) +11 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#3281]) +8 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4537] / [i915#4812]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4537] / [i915#4812])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          NOTRUN -> [ABORT][62] ([i915#15317]) +10 other tests abort
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#4860])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@gem_fence_thrash@bo-write-verify-y.html
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#4860])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#4613]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][66] ([i915#4613]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-glk9/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][67] ([i915#4613]) +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-7/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@verify:
    - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#4613]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@gem_lmem_swapping@verify.html
    - shard-tglu-1:       NOTRUN -> [SKIP][69] ([i915#4613]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@gem_lmem_swapping@verify.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#14544] / [i915#4613])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#12193])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#4565])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@gem_lmem_swapping@verify-ccs@lmem0.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#284])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@gem_media_vme.html

  * igt@gem_mmap@big-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#4083]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@basic-small-bo:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4077]) +17 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@gem_mmap_gtt@basic-small-bo.html

  * igt@gem_mmap_gtt@cpuset-medium-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4077]) +12 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@gem_mmap_gtt@cpuset-medium-copy.html

  * igt@gem_mmap_gtt@medium-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#4077]) +16 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-13/igt@gem_mmap_gtt@medium-copy-odd.html

  * igt@gem_mmap_wc@read-write-distinct:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4083]) +7 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-19/igt@gem_mmap_wc@read-write-distinct.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4083]) +6 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-7/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#14544] / [i915#3282])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_pread@exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#3282]) +7 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][82] ([i915#2658]) +1 other test warn
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-snb1/igt@gem_pread@exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][83] ([i915#2658]) +1 other test warn
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-4/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][84] ([i915#2658])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-glk5/igt@gem_pread@exhaustion.html
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#3282]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@gem_pread@exhaustion.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#3282]) +6 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> [WARN][87] ([i915#14702] / [i915#2658])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-glk1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pwrite_snooped:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#3282]) +8 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@gem_pwrite_snooped.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#13398])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-3/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#4270]) +4 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-19/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#4270]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-7/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-mtlp:         [PASS][92] -> [ABORT][93] ([i915#15317]) +2 other tests abort
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-7/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_render_copy@y-tiled-ccs-to-linear:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#5190] / [i915#8428]) +8 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-5/igt@gem_render_copy@y-tiled-ccs-to-linear.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#8428]) +8 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4079]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#8411])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-3/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_tiled_pread_basic:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#4079]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@gem_tiled_pread_basic.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#4879])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#3297]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-tglu-1:       NOTRUN -> [SKIP][101] ([i915#3297])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][102] ([i915#3297]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#3282] / [i915#3297])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#3282] / [i915#3297])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-13/igt@gem_userptr_blits@forbidden-operations.html
    - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#3282] / [i915#3297])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#3282] / [i915#3297])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#3297] / [i915#4880])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-7/igt@gem_userptr_blits@map-fixed-invalidate.html
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#3297] / [i915#4880])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-15/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#3281] / [i915#3297])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@gem_userptr_blits@relocations.html
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#3281] / [i915#3297])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-18/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#3297])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-3/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#3297]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-tglu:         NOTRUN -> [SKIP][113] ([i915#3297]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-8/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume:
    - shard-snb:          NOTRUN -> [ABORT][114] ([i915#15317]) +9 other tests abort
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-snb4/igt@gem_workarounds@suspend-resume.html
    - shard-mtlp:         NOTRUN -> [ABORT][115] ([i915#15317]) +6 other tests abort
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@gem_workarounds@suspend-resume.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          NOTRUN -> [INCOMPLETE][116] ([i915#13356])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-glk6/igt@gem_workarounds@suspend-resume-context.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-tglu-1:       NOTRUN -> [ABORT][117] ([i915#15317])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg2:          NOTRUN -> [SKIP][118] +12 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglu-1:       NOTRUN -> [SKIP][119] ([i915#2527] / [i915#2856])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-mtlp:         NOTRUN -> [SKIP][120] ([i915#2856]) +3 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@gen9_exec_parse@batch-without-end.html
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#2856]) +5 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-large:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#2527]) +5 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#2527]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#2527] / [i915#2856]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-4/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_drm_fdinfo@all-busy-check-all:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#14123])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-3/igt@i915_drm_fdinfo@all-busy-check-all.html
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#14123])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-14/igt@i915_drm_fdinfo@all-busy-check-all.html

  * igt@i915_drm_fdinfo@most-busy-idle-check-all:
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#14073]) +6 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@i915_drm_fdinfo@most-busy-idle-check-all.html

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs0:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#14073]) +11 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs0.html

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#14073]) +7 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@i915_drm_fdinfo@virtual-busy:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#14118]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@i915_drm_fdinfo@virtual-busy.html

  * igt@i915_drm_fdinfo@virtual-busy-idle-all:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#14118]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-7/igt@i915_drm_fdinfo@virtual-busy-idle-all.html

  * igt@i915_module_load@reload-no-display:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][132] ([i915#13029] / [i915#14545])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-3/igt@i915_module_load@reload-no-display.html
    - shard-dg1:          NOTRUN -> [DMESG-WARN][133] ([i915#13029] / [i915#14545])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-14/igt@i915_module_load@reload-no-display.html
    - shard-snb:          NOTRUN -> [DMESG-WARN][134] ([i915#14545])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-snb4/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@resize-bar:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][135] ([i915#14545])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-3/igt@i915_module_load@resize-bar.html
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#7178])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-14/igt@i915_module_load@resize-bar.html
    - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#6412])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-2/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#6590]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-2/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#6590]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-tglu:         NOTRUN -> [SKIP][140] ([i915#6590]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-4/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_freq_mult@media-freq@gt1:
    - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#6590]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@i915_pm_freq_mult@media-freq@gt1.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          NOTRUN -> [SKIP][142] +22 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-glk:          NOTRUN -> [ABORT][143] ([i915#15317]) +4 other tests abort
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-glk9/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#11681] / [i915#6621]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-15/igt@i915_pm_rps@basic-api.html
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#11681] / [i915#6621]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-6/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#11681] / [i915#6621]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          NOTRUN -> [INCOMPLETE][147] ([i915#13729] / [i915#13821])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-snb7/igt@i915_pm_rps@reset.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [PASS][148] -> [SKIP][149] ([i915#7984])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-5/igt@i915_power@sanity.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@i915_power@sanity.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#7707])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt@intel_hwmon@hwmon-write.html
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#7707])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-6/igt@intel_hwmon@hwmon-write.html
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#7707])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#4212]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#4212]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-mtlp:         NOTRUN -> [SKIP][155] ([i915#4212]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-3/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-dpms:
    - shard-mtlp:         NOTRUN -> [FAIL][156] ([i915#15313]) +5 other tests fail
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_async_flips@async-flip-dpms.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-mtlp:         NOTRUN -> [FAIL][157] ([i915#15331]) +2 other tests fail
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#3555])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#9531])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu-1:       NOTRUN -> [SKIP][160] ([i915#9531])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#9531])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#1769] / [i915#3555])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-snb:          NOTRUN -> [SKIP][163] ([i915#1769])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-snb7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#1769] / [i915#3555])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-glk10:        NOTRUN -> [SKIP][165] ([i915#1769])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-glk10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#14544] / [i915#5286]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#5286]) +7 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#5286]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#5286]) +10 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][170] ([i915#5286]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#4538] / [i915#5286]) +9 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         NOTRUN -> [FAIL][172] ([i915#5138])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-mtlp:         NOTRUN -> [SKIP][173] +27 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#3638]) +2 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#3638]) +4 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-13/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#5190]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#6187]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#4538] / [i915#5190]) +16 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#4538]) +5 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-18/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#10307] / [i915#6095]) +113 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-7/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#12313]) +5 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-9/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#12313]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#12313]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#12313] / [i915#14544])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#12313]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-19/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#14098] / [i915#6095]) +45 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#6095]) +53 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#14098] / [i915#14544] / [i915#6095]) +9 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][189] ([i915#6095]) +134 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][190] ([i915#12313])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#6095]) +84 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][192] ([i915#12805])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#12805])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-13/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#12805])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#12805])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#12805])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][197] ([i915#6095]) +14 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#6095]) +154 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#6095]) +23 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#10307] / [i915#10434] / [i915#6095])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#12313]) +3 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#14544] / [i915#6095]) +11 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition:
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#13781]) +4 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_cdclk@mode-transition.html
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#3742])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-2/igt@kms_cdclk@mode-transition.html
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#3742])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-17/igt@kms_cdclk@mode-transition.html
    - shard-tglu:         NOTRUN -> [SKIP][206] ([i915#3742])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-9/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-b-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#13781]) +4 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-11/igt@kms_cdclk@mode-transition@pipe-b-dp-3.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#13783]) +3 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#11151] / [i915#7828]) +13 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-8/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#11151] / [i915#7828]) +8 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_chamelium_audio@hdmi-audio.html
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#11151] / [i915#7828]) +7 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-3/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#11151] / [i915#7828]) +9 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-15/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-tglu-1:       NOTRUN -> [SKIP][213] ([i915#11151] / [i915#7828]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#11151] / [i915#7828]) +7 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-6/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#11151] / [i915#14544] / [i915#7828]) +2 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf:
    - shard-glk:          NOTRUN -> [SKIP][216] +225 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-glk9/igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +2 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#14544] / [i915#15330])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_content_protection@dp-mst-suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#15330])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-19/igt@kms_content_protection@dp-mst-suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#15330])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-3/igt@kms_content_protection@dp-mst-suspend-resume.html
    - shard-mtlp:         NOTRUN -> [SKIP][221] ([i915#15330])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@kms_content_protection@dp-mst-suspend-resume.html
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#15330])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@kms_content_protection@dp-mst-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#3116])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-2/igt@kms_content_protection@dp-mst-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#3299])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@kms_content_protection@dp-mst-type-0.html
    - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#3116] / [i915#3299])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-4/igt@kms_content_protection@dp-mst-type-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#3299])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@kms_content_protection@dp-mst-type-0.html
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#3299])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][228] ([i915#6944] / [i915#9424])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-8/igt@kms_content_protection@lic-type-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#6944] / [i915#9424]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_content_protection@lic-type-0.html
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#14544] / [i915#6944] / [i915#9424])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][231] ([i915#6944] / [i915#9424])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-mtlp:         NOTRUN -> [SKIP][232] ([i915#8063] / [i915#9433])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-6/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#6944] / [i915#7118])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_content_protection@srm.html
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#6944] / [i915#7118])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@kms_content_protection@srm.html
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#6944] / [i915#7116])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-18/igt@kms_content_protection@srm.html
    - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#6944] / [i915#7116] / [i915#7118])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-3/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@suspend-resume:
    - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#6944]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#6944] / [i915#7118] / [i915#9424]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@kms_content_protection@type1.html
    - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#6944] / [i915#7118] / [i915#9424]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#6944] / [i915#7116] / [i915#9424]) +2 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-18/igt@kms_content_protection@type1.html
    - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#3555] / [i915#6944] / [i915#9424])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-3/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#13049]) +2 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#13049]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-rkl:          NOTRUN -> [FAIL][244] ([i915#13566]) +1 other test fail
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-tglu:         [PASS][245] -> [FAIL][246] ([i915#13566]) +1 other test fail
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-tglu-2/igt@kms_cursor_crc@cursor-random-128x42.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-3/igt@kms_cursor_crc@cursor-random-128x42.html
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#8814]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#13049]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#13049] / [i915#14544])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#13049]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#3555] / [i915#8814]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#3555]) +4 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#3555]) +8 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#3555]) +5 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-3/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#13049])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][256] -> [FAIL][257] ([i915#13566]) +3 other tests fail
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-tglu-1:       NOTRUN -> [FAIL][258] ([i915#13566]) +1 other test fail
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#14544]) +6 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#9809]) +5 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#4103])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#4103] / [i915#4213]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#4103])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#4103] / [i915#4213])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#13046] / [i915#5354]) +7 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#9067])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#14544] / [i915#4103])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-tglu-1:       NOTRUN -> [SKIP][268] ([i915#4103])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#9723])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][270] ([i915#9723])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-tglu:         NOTRUN -> [SKIP][271] ([i915#9723])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#9833])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_aux_dev:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#1257])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_dp_aux_dev.html
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#1257])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-13/igt@kms_dp_aux_dev.html
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#1257])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-5/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#13749]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#13748])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][278] ([i915#3555] / [i915#3840] / [i915#9159])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][279] ([i915#3555] / [i915#3840])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg1:          NOTRUN -> [ABORT][280] ([i915#15317]) +7 other tests abort
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-17/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-glk10:        NOTRUN -> [INCOMPLETE][281] ([i915#9878])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-glk10/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#3469])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#3469])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-8/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#3469])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#1839])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@kms_feature_discovery@display-4x.html
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#1839]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-18/igt@kms_feature_discovery@display-4x.html
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#1839]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-3/igt@kms_feature_discovery@display-4x.html
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#1839])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#9337])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-10/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_fence_pin_leak:
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#4881])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-18/igt@kms_fence_pin_leak.html
    - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#4881])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@kms_fence_pin_leak.html
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#4881])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][293] ([i915#3637] / [i915#9934]) +12 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#9934]) +12 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][295] ([i915#9934])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#8381])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_flip@2x-flip-vs-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][297] ([i915#8381])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_flip@2x-flip-vs-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#8381])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][299] ([i915#3637] / [i915#9934]) +7 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#9934]) +7 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#14544] / [i915#9934]) +4 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
    - shard-tglu-1:       NOTRUN -> [SKIP][302] ([i915#3637] / [i915#9934]) +2 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#9934]) +13 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][304] ([i915#12745] / [i915#4839] / [i915#6113])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-glk1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-tglu:         NOTRUN -> [ABORT][305] ([i915#15317]) +9 other tests abort
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][306] ([i915#12745] / [i915#6113])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-glk1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [ABORT][307] ([i915#15317]) +10 other tests abort
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-1/igt@kms_flip@flip-vs-suspend@a-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][308] ([i915#2672] / [i915#3555] / [i915#8813]) +7 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][309] ([i915#2672]) +4 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#2587] / [i915#2672]) +3 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][311] ([i915#2587] / [i915#2672]) +5 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][312] ([i915#2587] / [i915#2672] / [i915#3555])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][313] ([i915#2587] / [i915#2672]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][314] ([i915#2672] / [i915#8813]) +3 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#2672] / [i915#3555]) +5 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#14544] / [i915#2672] / [i915#3555])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
    - shard-tglu-1:       NOTRUN -> [SKIP][317] ([i915#2672] / [i915#3555])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][318] ([i915#2672] / [i915#3555]) +3 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][319] ([i915#14544] / [i915#2672])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][320] ([i915#2672] / [i915#3555]) +4 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][321] ([i915#3555] / [i915#8810] / [i915#8813]) +3 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][322] ([i915#2672] / [i915#3555] / [i915#5190]) +3 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#2672]) +5 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#2672] / [i915#3555]) +3 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][325] ([i915#8708]) +11 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][326] +22 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][327] +53 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][328] ([i915#5439])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][329] ([i915#14544] / [i915#15102]) +2 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render.html
    - shard-dg1:          NOTRUN -> [SKIP][330] ([i915#15102]) +4 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#15102]) +4 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#15102]) +2 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][333] ([i915#15104]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][334] ([i915#15104]) +3 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-snb:          NOTRUN -> [SKIP][335] +471 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-snb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][336] ([i915#14544] / [i915#15102] / [i915#3023]) +5 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][337] ([i915#8708]) +19 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][338] ([i915#10433] / [i915#15102] / [i915#3458])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][339] ([i915#8708]) +20 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][340] ([i915#14544] / [i915#1825]) +9 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][341] ([i915#5439])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][342] ([i915#10055])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
    - shard-mtlp:         NOTRUN -> [SKIP][343] ([i915#10055])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][344] ([i915#9766])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg1:          NOTRUN -> [SKIP][345] ([i915#9766])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-19/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][346] ([i915#9766])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg2:          NOTRUN -> [SKIP][347] ([i915#9766])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][348] ([i915#15104]) +4 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][349] ([i915#15102] / [i915#3023]) +22 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
    - shard-dg1:          NOTRUN -> [SKIP][350] ([i915#15102] / [i915#3458]) +20 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][351] ([i915#1825]) +36 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][352] ([i915#1825]) +34 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][353] ([i915#5354]) +39 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][354] +94 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#15102] / [i915#3458]) +21 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][356] ([i915#15102]) +11 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-tglu:         NOTRUN -> [SKIP][357] ([i915#15102]) +39 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg1:          NOTRUN -> [SKIP][358] ([i915#3555] / [i915#8228]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][359] ([i915#3555] / [i915#8228]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-3/igt@kms_hdr@bpc-switch-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][360] ([i915#3555] / [i915#8228]) +2 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         NOTRUN -> [SKIP][361] ([i915#12713])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@kms_hdr@brightness-with-hdr.html
    - shard-dg2:          NOTRUN -> [SKIP][362] ([i915#13331])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-11/igt@kms_hdr@brightness-with-hdr.html
    - shard-dg1:          NOTRUN -> [SKIP][363] ([i915#12713])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-17/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu:         NOTRUN -> [SKIP][364] ([i915#12713])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-9/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][365] ([i915#3555] / [i915#8228])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][366] ([i915#3555] / [i915#8228]) +1 other test skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-3/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][367] ([i915#12339])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][368] ([i915#10656])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][369] ([i915#10656])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-18/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][370] ([i915#10656])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-3/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][371] ([i915#10656])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][372] ([i915#12339])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][373] ([i915#12339])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][374] ([i915#12339])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][375] ([i915#12339] / [i915#14544])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][376] ([i915#12339])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-19/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2:          NOTRUN -> [SKIP][377] ([i915#4816])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][378] ([i915#6301])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@kms_panel_fitting@atomic-fastset.html
    - shard-tglu-1:       NOTRUN -> [SKIP][379] ([i915#6301])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_panel_fitting@atomic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][380] ([i915#6301])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-tglu:         NOTRUN -> [SKIP][381] ([i915#14712]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][382] ([i915#13705])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][383] ([i915#13705])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-mtlp:         NOTRUN -> [SKIP][384] ([i915#11614] / [i915#3582]) +1 other test skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_lowres@tiling-x@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][385] ([i915#10226] / [i915#11614] / [i915#3582]) +2 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@kms_plane_lowres@tiling-x@pipe-a-edp-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][386] ([i915#3555] / [i915#8821])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-7/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2:          NOTRUN -> [SKIP][387] ([i915#13958])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-5/igt@kms_plane_multiple@2x-tiling-none.html
    - shard-rkl:          NOTRUN -> [SKIP][388] ([i915#13958])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-none.html
    - shard-dg1:          NOTRUN -> [SKIP][389] ([i915#13958])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-15/igt@kms_plane_multiple@2x-tiling-none.html
    - shard-tglu:         NOTRUN -> [SKIP][390] ([i915#13958])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-4/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][391] ([i915#14259])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-3/igt@kms_plane_multiple@tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][392] ([i915#14259])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_plane_multiple@tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][393] ([i915#14259])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-8/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d:
    - shard-mtlp:         NOTRUN -> [SKIP][394] ([i915#15329]) +4 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][395] ([i915#5354])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_pm_backlight@bad-brightness.html
    - shard-tglu-1:       NOTRUN -> [SKIP][396] ([i915#9812])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_pm_backlight@bad-brightness.html
    - shard-dg1:          NOTRUN -> [SKIP][397] ([i915#5354])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-13/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][398] ([i915#9812])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-10/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-mtlp:         NOTRUN -> [SKIP][399] ([i915#13441])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-3/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][400] ([i915#15128])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][401] ([i915#9340])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][402] ([i915#14544] / [i915#9340])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-tglu-1:       NOTRUN -> [SKIP][403] ([i915#3828])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][404] ([i915#9340])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          NOTRUN -> [SKIP][405] ([i915#8430])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg1:          NOTRUN -> [SKIP][406] ([i915#8430])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-15/igt@kms_pm_lpsp@screens-disabled.html
    - shard-tglu:         NOTRUN -> [SKIP][407] ([i915#8430])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-4/igt@kms_pm_lpsp@screens-disabled.html
    - shard-mtlp:         NOTRUN -> [SKIP][408] ([i915#8430])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-6/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg2:          NOTRUN -> [SKIP][409] ([i915#8430])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-5/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [PASS][410] -> [SKIP][411] ([i915#15073])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][412] ([i915#15073]) +1 other test skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-5/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-mtlp:         NOTRUN -> [SKIP][413] ([i915#15073]) +1 other test skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][414] ([i915#15073])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglu-1:       NOTRUN -> [SKIP][415] ([i915#15073])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-tglu:         NOTRUN -> [ABORT][416] ([i915#10553] / [i915#15317])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-8/igt@kms_pm_rpm@system-suspend-modeset.html
    - shard-mtlp:         NOTRUN -> [ABORT][417] ([i915#10553] / [i915#15317])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_pm_rpm@system-suspend-modeset.html
    - shard-glk10:        NOTRUN -> [ABORT][418] ([i915#10553] / [i915#15317])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-glk10/igt@kms_pm_rpm@system-suspend-modeset.html
    - shard-dg2:          NOTRUN -> [ABORT][419] ([i915#10553] / [i915#15317])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@kms_pm_rpm@system-suspend-modeset.html
    - shard-dg1:          NOTRUN -> [ABORT][420] ([i915#10553] / [i915#15317])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][421] ([i915#6524] / [i915#6805])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_prime@basic-crc-hybrid.html
    - shard-rkl:          NOTRUN -> [SKIP][422] ([i915#6524])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_prime@basic-crc-hybrid.html
    - shard-tglu-1:       NOTRUN -> [SKIP][423] ([i915#6524])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_prime@basic-crc-hybrid.html
    - shard-dg1:          NOTRUN -> [SKIP][424] ([i915#6524])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-13/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-snb:          NOTRUN -> [SKIP][425] ([i915#11520]) +12 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-snb1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
    - shard-mtlp:         NOTRUN -> [SKIP][426] ([i915#12316]) +7 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][427] ([i915#11520]) +9 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-glk10:        NOTRUN -> [SKIP][428] ([i915#11520]) +4 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-glk10/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][429] ([i915#9808])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][430] ([i915#11520] / [i915#14544]) +1 other test skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html
    - shard-tglu-1:       NOTRUN -> [SKIP][431] ([i915#11520]) +2 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][432] ([i915#11520]) +8 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][433] ([i915#11520]) +7 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-glk9/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][434] ([i915#11520]) +10 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][435] ([i915#11520]) +10 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][436] ([i915#9683]) +1 other test skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][437] ([i915#9683])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-rkl:          NOTRUN -> [SKIP][438] ([i915#14544] / [i915#9683])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-tglu-1:       NOTRUN -> [SKIP][439] ([i915#9683]) +1 other test skip
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-dg1:          NOTRUN -> [SKIP][440] ([i915#9683])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][441] ([i915#9688]) +28 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_psr@fbc-psr-dpms.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-rkl:          NOTRUN -> [SKIP][442] ([i915#1072] / [i915#14544] / [i915#9732]) +2 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@pr-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][443] ([i915#9732]) +29 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-3/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@pr-sprite-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][444] ([i915#9732]) +8 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_psr@pr-sprite-mmap-gtt.html

  * igt@kms_psr@pr-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][445] ([i915#1072] / [i915#9732]) +25 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@kms_psr@pr-suspend.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-rkl:          NOTRUN -> [SKIP][446] ([i915#1072] / [i915#9732]) +20 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][447] ([i915#1072] / [i915#9732]) +28 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-11/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][448] ([i915#9685]) +1 other test skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-tglu-1:       NOTRUN -> [SKIP][449] ([i915#9685])
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][450] ([i915#9685]) +1 other test skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-14/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-tglu:         NOTRUN -> [SKIP][451] ([i915#9685])
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2:          NOTRUN -> [SKIP][452] ([i915#9685]) +1 other test skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][453] ([i915#12755]) +2 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-6/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][454] ([i915#5289]) +1 other test skip
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][455] ([i915#12755] / [i915#5190])
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-dg1:          NOTRUN -> [SKIP][456] ([i915#5289]) +1 other test skip
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-14/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][457] ([i915#12755]) +3 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][458] ([i915#3555]) +10 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html
    - shard-rkl:          NOTRUN -> [SKIP][459] ([i915#14544] / [i915#3555])
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk:          NOTRUN -> [ABORT][460] ([i915#13179]) +1 other test abort
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-glk9/igt@kms_selftest@drm_framebuffer.html
    - shard-mtlp:         NOTRUN -> [ABORT][461] ([i915#13179]) +1 other test abort
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-6/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][462] ([i915#13179]) +1 other test abort
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-7/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-tglu-1:       NOTRUN -> [SKIP][463] ([i915#3555]) +1 other test skip
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-rkl:          [PASS][464] -> [ABORT][465] ([i915#15317]) +2 other tests abort
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-5/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flipline:
    - shard-mtlp:         NOTRUN -> [SKIP][466] ([i915#3555] / [i915#8808])
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][467] ([i915#11920])
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@kms_vrr@lobf.html
    - shard-rkl:          NOTRUN -> [SKIP][468] ([i915#11920])
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@kms_vrr@lobf.html
    - shard-dg1:          NOTRUN -> [SKIP][469] ([i915#11920])
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-19/igt@kms_vrr@lobf.html
    - shard-tglu:         NOTRUN -> [SKIP][470] ([i915#11920])
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-2/igt@kms_vrr@lobf.html
    - shard-mtlp:         NOTRUN -> [SKIP][471] ([i915#11920])
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg2:          NOTRUN -> [SKIP][472] ([i915#9906])
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-rkl:          NOTRUN -> [SKIP][473] ([i915#9906])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-tglu-1:       NOTRUN -> [SKIP][474] ([i915#9906]) +1 other test skip
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-dg1:          NOTRUN -> [SKIP][475] ([i915#9906])
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-13/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output:
    - shard-glk:          NOTRUN -> [SKIP][476] ([i915#2437])
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-glk9/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-glk10:        NOTRUN -> [SKIP][477] +206 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-glk10/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglu:         NOTRUN -> [SKIP][478] ([i915#2437]) +1 other test skip
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-8/igt@kms_writeback@writeback-fb-id.html
    - shard-mtlp:         NOTRUN -> [SKIP][479] ([i915#2437])
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_writeback@writeback-fb-id.html
    - shard-dg2:          NOTRUN -> [SKIP][480] ([i915#2437])
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@kms_writeback@writeback-fb-id.html
    - shard-rkl:          NOTRUN -> [SKIP][481] ([i915#14544] / [i915#2437])
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_writeback@writeback-fb-id.html
    - shard-dg1:          NOTRUN -> [SKIP][482] ([i915#2437])
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_writeback@writeback-fb-id.html

  * igt@perf@mi-rpc:
    - shard-dg2:          NOTRUN -> [SKIP][483] ([i915#2434])
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@perf@mi-rpc.html
    - shard-rkl:          NOTRUN -> [SKIP][484] ([i915#14544] / [i915#2434])
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@perf@mi-rpc.html
    - shard-dg1:          NOTRUN -> [SKIP][485] ([i915#2434])
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@perf@mi-rpc.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][486] ([i915#2433])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@perf@unprivileged-single-ctx-counters.html
    - shard-dg1:          NOTRUN -> [SKIP][487] ([i915#2433])
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg2:          NOTRUN -> [FAIL][488] ([i915#12549] / [i915#6806]) +1 other test fail
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@perf_pmu@frequency@gt0.html
    - shard-dg1:          NOTRUN -> [FAIL][489] ([i915#12549] / [i915#6806]) +1 other test fail
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-18/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@rc6-suspend:
    - shard-mtlp:         NOTRUN -> [ABORT][490] ([i915#15059] / [i915#15317])
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@perf_pmu@rc6-suspend.html
    - shard-glk10:        NOTRUN -> [ABORT][491] ([i915#15317])
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-glk10/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-tglu:         NOTRUN -> [SKIP][492] ([i915#8516])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-6/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-mtlp:         NOTRUN -> [SKIP][493] ([i915#14121]) +1 other test skip
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-mtlp:         NOTRUN -> [SKIP][494] ([i915#3708] / [i915#4077])
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@prime_vgem@basic-fence-mmap.html
    - shard-dg2:          NOTRUN -> [SKIP][495] ([i915#3708] / [i915#4077])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][496] ([i915#3291] / [i915#3708])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-3/igt@prime_vgem@basic-write.html
    - shard-rkl:          NOTRUN -> [SKIP][497] ([i915#3291] / [i915#3708])
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt@prime_vgem@basic-write.html
    - shard-dg1:          NOTRUN -> [SKIP][498] ([i915#3708]) +1 other test skip
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-14/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-read-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][499] ([i915#3708])
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@prime_vgem@fence-read-hang.html
    - shard-dg2:          NOTRUN -> [SKIP][500] ([i915#3708])
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@prime_vgem@fence-read-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][501] ([i915#3708])
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-rkl:          NOTRUN -> [SKIP][502] ([i915#9917]) +1 other test skip
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@bind-unbind-vf@vf-4:
    - shard-tglu:         NOTRUN -> [FAIL][503] ([i915#12910]) +9 other tests fail
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-7/igt@sriov_basic@bind-unbind-vf@vf-4.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-2:
    - shard-mtlp:         NOTRUN -> [FAIL][504] ([i915#12910]) +19 other tests fail
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-2.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2:          NOTRUN -> [SKIP][505] ([i915#9917])
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-rkl:          NOTRUN -> [SKIP][506] ([i915#14544] / [i915#9917])
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-tglu-1:       NOTRUN -> [FAIL][507] ([i915#12910])
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-dg1:          NOTRUN -> [SKIP][508] ([i915#9917])
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-rkl:          [ABORT][509] ([i915#15317]) -> [PASS][510] +3 other tests pass
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-7/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt@gem_ctx_isolation@preservation-s3@bcs0.html
    - shard-dg2:          [ABORT][511] ([i915#15317]) -> [PASS][512]
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-dg2-5/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_eio@in-flight-suspend:
    - shard-mtlp:         [ABORT][513] ([i915#15317]) -> [PASS][514]
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-5/igt@gem_eio@in-flight-suspend.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@kms:
    - shard-rkl:          [DMESG-WARN][515] ([i915#13363]) -> [PASS][516]
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-8/igt@gem_eio@kms.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@gem_eio@kms.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-tglu:         [ABORT][517] ([i915#15317]) -> [PASS][518] +1 other test pass
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-tglu-7/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-tglu-2/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@i915_module_load@load:
    - shard-mtlp:         ([PASS][519], [PASS][520], [PASS][521], [SKIP][522], [PASS][523], [PASS][524], [PASS][525], [PASS][526], [PASS][527], [PASS][528], [PASS][529], [PASS][530], [PASS][531], [PASS][532], [PASS][533], [PASS][534], [PASS][535], [PASS][536], [PASS][537], [PASS][538], [PASS][539], [PASS][540], [PASS][541], [PASS][542]) ([i915#14785]) -> ([PASS][543], [PASS][544], [PASS][545], [PASS][546], [PASS][547], [PASS][548], [PASS][549], [PASS][550], [PASS][551], [PASS][552], [PASS][553], [PASS][554], [PASS][555], [PASS][556], [PASS][557], [PASS][558], [PASS][559], [PASS][560], [PASS][561], [PASS][562], [PASS][563], [PASS][564], [PASS][565], [PASS][566], [PASS][567])
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-7/igt@i915_module_load@load.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-5/igt@i915_module_load@load.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-4/igt@i915_module_load@load.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-4/igt@i915_module_load@load.html
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-3/igt@i915_module_load@load.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-3/igt@i915_module_load@load.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-5/igt@i915_module_load@load.html
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-6/igt@i915_module_load@load.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-2/igt@i915_module_load@load.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-6/igt@i915_module_load@load.html
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-8/igt@i915_module_load@load.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-7/igt@i915_module_load@load.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-2/igt@i915_module_load@load.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-4/igt@i915_module_load@load.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-8/igt@i915_module_load@load.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-7/igt@i915_module_load@load.html
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-3/igt@i915_module_load@load.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-5/igt@i915_module_load@load.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-8/igt@i915_module_load@load.html
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-6/igt@i915_module_load@load.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-8/igt@i915_module_load@load.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-2/igt@i915_module_load@load.html
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-6/igt@i915_module_load@load.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-4/igt@i915_module_load@load.html
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@i915_module_load@load.html
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@i915_module_load@load.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-6/igt@i915_module_load@load.html
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-6/igt@i915_module_load@load.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@i915_module_load@load.html
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@i915_module_load@load.html
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@i915_module_load@load.html
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-3/igt@i915_module_load@load.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@i915_module_load@load.html
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@i915_module_load@load.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@i915_module_load@load.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@i915_module_load@load.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@i915_module_load@load.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@i915_module_load@load.html
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-6/igt@i915_module_load@load.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-3/igt@i915_module_load@load.html
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-3/igt@i915_module_load@load.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-6/igt@i915_module_load@load.html
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-3/igt@i915_module_load@load.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@i915_module_load@load.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@i915_module_load@load.html
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@i915_module_load@load.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@i915_module_load@load.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@i915_module_load@load.html
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@i915_module_load@load.html
    - shard-rkl:          ([PASS][568], [PASS][569], [PASS][570], [PASS][571], [PASS][572], [PASS][573], [PASS][574], [PASS][575], [PASS][576], [PASS][577], [PASS][578], [PASS][579], [PASS][580], [PASS][581], [PASS][582], [PASS][583], [PASS][584], [PASS][585], [PASS][586], [PASS][587], [SKIP][588], [PASS][589]) ([i915#14785]) -> ([PASS][590], [PASS][591], [PASS][592], [PASS][593], [PASS][594], [PASS][595], [PASS][596], [PASS][597], [PASS][598], [PASS][599], [PASS][600], [PASS][601], [PASS][602], [PASS][603], [PASS][604], [PASS][605], [PASS][606], [PASS][607], [PASS][608], [PASS][609], [PASS][610], [PASS][611], [PASS][612], [PASS][613], [PASS][614])
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-5/igt@i915_module_load@load.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-5/igt@i915_module_load@load.html
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-2/igt@i915_module_load@load.html
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/igt@i915_module_load@load.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-5/igt@i915_module_load@load.html
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/igt@i915_module_load@load.html
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-5/igt@i915_module_load@load.html
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/igt@i915_module_load@load.html
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-2/igt@i915_module_load@load.html
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-4/igt@i915_module_load@load.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-7/igt@i915_module_load@load.html
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-2/igt@i915_module_load@load.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-7/igt@i915_module_load@load.html
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-7/igt@i915_module_load@load.html
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-3/igt@i915_module_load@load.html
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-3/igt@i915_module_load@load.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-8/igt@i915_module_load@load.html
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-3/igt@i915_module_load@load.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-4/igt@i915_module_load@load.html
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-8/igt@i915_module_load@load.html
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-8/igt@i915_module_load@load.html
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-4/igt@i915_module_load@load.html
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt@i915_module_load@load.html
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt@i915_module_load@load.html
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-1/igt@i915_module_load@load.html
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt@i915_module_load@load.html
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@i915_module_load@load.html
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-2/igt@i915_module_load@load.html
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@i915_module_load@load.html
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@i915_module_load@load.html
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@i915_module_load@load.html
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-2/igt@i915_module_load@load.html
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-3/igt@i915_module_load@load.html
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@i915_module_load@load.html
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-3/igt@i915_module_load@load.html
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@i915_module_load@load.html
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@i915_module_load@load.html
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@i915_module_load@load.html
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@i915_module_load@load.html
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-1/igt@i915_module_load@load.html
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-3/igt@i915_module_load@load.html
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt@i915_module_load@load.html
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-3/igt@i915_module_load@load.html
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@i915_module_load@load.html
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@i915_module_load@load.html
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-2/igt@i915_module_load@load.html
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@i915_module_load@load.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-snb:          [ABORT][615] ([i915#15317]) -> [PASS][616]
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-snb7/igt@i915_suspend@basic-s2idle-without-i915.html
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-snb6/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-mtlp:         [FAIL][617] ([i915#5138]) -> [PASS][618]
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-rkl:          [SKIP][619] ([i915#3555] / [i915#8228]) -> [PASS][620]
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-7/igt@kms_hdr@static-toggle-dpms.html
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [SKIP][621] ([i915#15073]) -> [PASS][622]
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-7/igt@kms_pm_rpm@dpms-lpsp.html
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html

  
#### Warnings ####

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [INCOMPLETE][623] ([i915#13356]) -> [ABORT][624] ([i915#15317]) +1 other test abort
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-dg2-7/igt@gem_ccs@suspend-resume.html
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@gem_ccs@suspend-resume.html

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          [INCOMPLETE][625] ([i915#13390]) -> [ABORT][626] ([i915#15317])
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-3/igt@gem_eio@in-flight-suspend.html
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_reloc@basic-cpu:
    - shard-rkl:          [SKIP][627] ([i915#14544] / [i915#3281]) -> [SKIP][628] ([i915#3281])
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/igt@gem_exec_reloc@basic-cpu.html
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt@gem_exec_reloc@basic-cpu.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          [SKIP][629] ([i915#3281]) -> [SKIP][630] ([i915#14544] / [i915#3281]) +1 other test skip
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-rkl:          [SKIP][631] ([i915#14544] / [i915#4613]) -> [SKIP][632] ([i915#4613])
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/igt@gem_lmem_swapping@random-engines.html
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_media_vme:
    - shard-rkl:          [SKIP][633] ([i915#284]) -> [SKIP][634] ([i915#14544] / [i915#284])
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-5/igt@gem_media_vme.html
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@gem_media_vme.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          [SKIP][635] ([i915#14544] / [i915#3282]) -> [SKIP][636] ([i915#3282])
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          [SKIP][637] ([i915#3282]) -> [SKIP][638] ([i915#14544] / [i915#3282]) +2 other tests skip
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-4/igt@gem_set_tiling_vs_pwrite.html
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-rkl:          [SKIP][639] ([i915#14544] / [i915#3297]) -> [SKIP][640] ([i915#3297]) +1 other test skip
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/igt@gem_userptr_blits@unsync-overlap.html
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@gem_userptr_blits@unsync-overlap.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          [SKIP][641] ([i915#14544] / [i915#8399]) -> [SKIP][642] ([i915#8399])
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/igt@i915_pm_freq_api@freq-reset.html
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-rkl:          [SKIP][643] ([i915#14544]) -> [SKIP][644]
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          [INCOMPLETE][645] ([i915#4817]) -> [ABORT][646] ([i915#15317])
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-glk6/igt@i915_suspend@fence-restore-tiled2untiled.html
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-glk1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          [SKIP][647] ([i915#9531]) -> [SKIP][648] ([i915#14544] / [i915#9531])
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][649] ([i915#5286]) -> [SKIP][650] ([i915#14544] / [i915#5286])
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-rkl:          [SKIP][651] ([i915#14544] / [i915#5286]) -> [SKIP][652] ([i915#5286])
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-rkl:          [SKIP][653] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][654] ([i915#14098] / [i915#6095])
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
    - shard-rkl:          [SKIP][655] ([i915#14098] / [i915#6095]) -> [SKIP][656] ([i915#14098] / [i915#14544] / [i915#6095]) +1 other test skip
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-8/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          [SKIP][657] ([i915#14544] / [i915#3742]) -> [SKIP][658] ([i915#3742])
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/igt@kms_cdclk@plane-scaling.html
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-rkl:          [SKIP][659] ([i915#11151] / [i915#7828]) -> [SKIP][660] ([i915#11151] / [i915#14544] / [i915#7828])
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-7/igt@kms_chamelium_edid@hdmi-edid-read.html
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          [SKIP][661] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][662] ([i915#11151] / [i915#7828]) +1 other test skip
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          [SKIP][663] -> [SKIP][664] ([i915#14544]) +7 other tests skip
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-rkl:          [SKIP][665] ([i915#9067]) -> [SKIP][666] ([i915#14544] / [i915#9067])
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-4/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-rkl:          [SKIP][667] ([i915#3555] / [i915#3840]) -> [SKIP][668] ([i915#14544] / [i915#3555] / [i915#3840])
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-3/igt@kms_dsc@dsc-with-bpc-formats.html
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-rkl:          [SKIP][669] ([i915#14544] / [i915#2672] / [i915#3555]) -> [SKIP][670] ([i915#2672] / [i915#3555])
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          [SKIP][671] ([i915#14544] / [i915#2672]) -> [SKIP][672] ([i915#2672])
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-rkl:          [SKIP][673] ([i915#2672] / [i915#3555]) -> [SKIP][674] ([i915#14544] / [i915#2672] / [i915#3555])
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-rkl:          [SKIP][675] ([i915#2672]) -> [SKIP][676] ([i915#14544] / [i915#2672])
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][677] ([i915#1825]) -> [SKIP][678] ([i915#14544] / [i915#1825]) +7 other tests skip
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [ABORT][679] ([i915#15317]) -> [INCOMPLETE][680] ([i915#10056])
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          [SKIP][681] ([i915#5439]) -> [SKIP][682] ([i915#14544] / [i915#5439])
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][683] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][684] ([i915#15102] / [i915#3023]) +2 other tests skip
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][685] ([i915#10433] / [i915#15102] / [i915#3458]) -> [SKIP][686] ([i915#15102] / [i915#3458])
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-dg2:          [SKIP][687] ([i915#15102] / [i915#3458]) -> [SKIP][688] ([i915#10433] / [i915#15102] / [i915#3458])
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:
    - shard-rkl:          [SKIP][689] ([i915#14544] / [i915#1825]) -> [SKIP][690] ([i915#1825]) +3 other tests skip
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-rkl:          [SKIP][691] ([i915#15102] / [i915#3023]) -> [SKIP][692] ([i915#14544] / [i915#15102] / [i915#3023]) +2 other tests skip
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          [ABORT][693] ([i915#15317]) -> [SKIP][694] ([i915#3555] / [i915#8228])
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-dg2-11/igt@kms_hdr@static-toggle-suspend.html
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          [SKIP][695] ([i915#6301]) -> [SKIP][696] ([i915#14544] / [i915#6301])
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-5/igt@kms_panel_fitting@atomic-fastset.html
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-rkl:          [SKIP][697] ([i915#13958]) -> [SKIP][698] ([i915#13958] / [i915#14544])
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-x.html
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          [SKIP][699] ([i915#15329]) -> [SKIP][700] ([i915#14544] / [i915#15329]) +3 other tests skip
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          [SKIP][701] ([i915#6524]) -> [SKIP][702] ([i915#14544] / [i915#6524])
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-4/igt@kms_prime@basic-modeset-hybrid.html
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][703] ([i915#11520]) -> [SKIP][704] ([i915#11520] / [i915#14544])
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          [SKIP][705] ([i915#11520] / [i915#14544]) -> [SKIP][706] ([i915#11520])
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@pr-sprite-mmap-gtt:
    - shard-rkl:          [SKIP][707] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][708] ([i915#1072] / [i915#9732]) +5 other tests skip
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/igt@kms_psr@pr-sprite-mmap-gtt.html
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_psr@pr-sprite-mmap-gtt.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-rkl:          [SKIP][709] ([i915#1072] / [i915#9732]) -> [SKIP][710] ([i915#1072] / [i915#14544] / [i915#9732]) +7 other tests skip
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-4/igt@kms_psr@psr-sprite-plane-onoff.html
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-rkl:          [SKIP][711] ([i915#3555]) -> [SKIP][712] ([i915#14544] / [i915#3555]) +1 other test skip
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-2/igt@kms_setmode@basic-clone-single-crtc.html
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          [SKIP][713] ([i915#14544] / [i915#2435]) -> [SKIP][714] ([i915#2435])
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-rkl:          [SKIP][715] ([i915#14544] / [i915#8516]) -> [SKIP][716] ([i915#8516])
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          [SKIP][717] ([i915#14544] / [i915#3708]) -> [SKIP][718] ([i915#3708])
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-3/igt@prime_vgem@fence-flip-hang.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11614]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12549]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12549
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13331]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13331
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13705]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705
  [i915#13729]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13729
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13783]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783
  [i915#13821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13821
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14785]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14785
  [i915#15059]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15059
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15095
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15128]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15128
  [i915#15313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15313
  [i915#15317]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15331]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15331
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4036]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4879]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6806]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6806
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7178
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8063]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8063
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159
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
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8644 -> IGTPW_14130

  CI-20190529: 20190529
  CI_DRM_17600: 2e2c779bc906d76b96ec0a46d9b85d1b035d2e23 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14130: 6ab97b6621bcc44e67a97b073f6e37d94bd840d2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8644: 069c5ee6eb658181e7264883c6c4fba41fc917a4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/index.html

--===============9064664771293550468==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_system_allocator: Added =
64k alignment support (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/157691/">https://patchwork.freedesktop.org/series/157691/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14130/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14130/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8644_full -&gt; IGTPW_14130_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14130_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_14130_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/index=
.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1413=
0_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-bypass:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_colorop@plane-xr24-xr24-bypa=
ss.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-2/igt@kms_colorop@plane-xr24-xr24-ctm_=
3x4_bt709_enc.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-pq_eotf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_colorop@plane-xr24-xr24-pq_eo=
tf.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf-srgb_eotf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-3/igt@kms_colorop@plane-xr24-xr24-srgb_=
eotf-srgb_inv_eotf-srgb_eotf.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-multiply_125:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-6/igt@kms_colorop@plane-xr30-xr30-mult=
iply_125.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-17/igt@kms_colorop@plane-xr30-xr30-srgb=
_inv_eotf_lut.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-7/igt@kms_fb_coherency@memset-crc.html"=
>CRASH</a> +1 other test crash</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc@mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@kms_fb_coherency@memset-crc@mmap-=
gtt.html">CRASH</a> +1 other test crash</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-snb4/igt@kms_fb_coherency@memset-crc@mmap-g=
tt.html">CRASH</a> +1 other test crash</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-7/igt@kms_fb_coherency@memset-crc@mmap=
-gtt.html">CRASH</a> +1 other test crash</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc@mmap-offset-fixed:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@kms_fb_coherency@memset-crc@mmap=
-offset-fixed.html">CRASH</a> +1 other test crash</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_colorop@plane-xr30-xr30-pq_125_inv_eotf:<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-6/igt@kms_colorop@plane-xr30-xr30-pq_125_inv_eotf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14130/shard-rkl-4/igt@kms_colorop@plane-xr30-xr30-pq_125_inv=
_eotf.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_colorop@plane-xr24-xr24-gamma_2_2_inv_oetf}:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-7/igt@kms_colorop@plane-xr24-xr24-gamm=
a_2_2_inv_oetf.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_colorop@plane-xr30-xr30-gamma_2_2_inv_oetf-gamma_2_2_oetf-gamma=
_2_2_inv_oetf}:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_colorop@plane-xr30-xr30-gamma=
_2_2_inv_oetf-gamma_2_2_oetf-gamma_2_2_inv_oetf.html">SKIP</a> +2 other tes=
ts skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_colorop@plane-xr30-xr30-gamma=
_2_2_inv_oetf-gamma_2_2_oetf-gamma_2_2_inv_oetf.html">SKIP</a></li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_colorop@plane-xr30-xr30-gamm=
a_2_2_inv_oetf-gamma_2_2_oetf-gamma_2_2_inv_oetf.html">SKIP</a> +1 other te=
st skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-13/igt@kms_colorop@plane-xr30-xr30-gamm=
a_2_2_inv_oetf-gamma_2_2_oetf-gamma_2_2_inv_oetf.html">SKIP</a> +2 other te=
sts skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@kms_colorop@plane-xr30-xr30-gamm=
a_2_2_inv_oetf-gamma_2_2_oetf-gamma_2_2_inv_oetf.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8644_full and IGTPW_14130_ful=
l:</p>
<h3>New IGT tests (13)</h3>
<ul>
<li>
<p>igt@i915_pm_rps@drm_format:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@query-forked-busy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14130_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@drm_buddy@drm_buddy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@drm_buddy@drm_buddy.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15095">i915#15095</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-10/igt@gem_ccs@block-multicopy-compres=
sed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@gem_ccs@block-multicopy-inplace.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-18/igt@gem_ccs@block-multicopy-inplace.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-3/igt@gem_ccs@block-multicopy-inplace.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@gem_ccs@block-multicopy-inplace.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-3/igt@gem_close_race@multigpu-basic-pr=
ocess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7697">i915#7697</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-11/igt@gem_close_race@multigpu-basic-pr=
ocess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7697">i915#7697</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-15/igt@gem_close_race@multigpu-basic-pr=
ocess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-6/igt@gem_create@create-ext-cpu-access=
-sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-dg2-5/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/=
shard-dg2-8/igt@gem_ctx_isolation@preservation-s3@rcs0.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915=
#15317</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@gem_ctx_persistence@hang.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-ma=
ny.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@processes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-snb1/igt@gem_ctx_persistence@processes.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/1099">i915#1099</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@gem_ctx_sseu@engines.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280=
">i915#280</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@gem_exec_balancer@bonded-pair.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4771">i915#4771</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-18/igt@gem_exec_balancer@bonded-pair.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@gem_exec_balancer@bonded-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@hog:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-6/igt@gem_exec_balancer@hog.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/48=
12">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@gem_exec_balancer@invalid-bonds.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@gem_exec_balancer@parallel.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4525">i915#4525</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-10/igt@gem_exec_balancer@parallel-cont=
exts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4525">i915#4525</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-11/igt@gem_exec_capture@capture-invisib=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/6334">i915#6334</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-1/igt@gem_exec_capture@capture-invisibl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6334">i915#6334</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-17/igt@gem_exec_capture@capture-invisib=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/6334">i915#6334</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-9/igt@gem_exec_capture@capture-invisib=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-glk1/igt@gem_exec_capture@capture-invisible=
@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@gem_exec_capture@capture-invisib=
le@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@gem_exec_fence@submit.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/48=
12">i915#4812</a>) +4 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@gem_exec_fence@submit.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/481=
2">i915#4812</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@gem_exec_flush@basic-uc-prw-defa=
ult.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-before-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-7/igt@gem_exec_flush@basic-wb-ro-before=
-default.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-15/igt@gem_exec_flush@basic-wb-ro-befor=
e-default.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-7/igt@gem_exec_reloc@basic-active.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3281">i915#3281</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-wc-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-wc-norel=
oc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@gem_exec_reloc@basic-gtt-wc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3281">i915#3281</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@gem_exec_reloc@basic-gtt-wc-nore=
loc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3281">i915#3281</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@gem_exec_schedule@preempt-queue-=
chain.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-c=
ontexts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@gem_exec_suspend@basic-s0@smem.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15317">i915#15317</a>) +10 other tests abort</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@gem_fence_thrash@bo-write-verify-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4860">i915#4860</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@gem_fence_thrash@bo-write-verify=
-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@gem_lmem_swapping@massive-random=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-glk9/igt@gem_lmem_swapping@parallel-random-=
verify-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-7/igt@gem_lmem_swapping@smem-oom.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4613">i915#4613</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@gem_lmem_swapping@verify.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4613">i915#4613</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@gem_lmem_swapping@verify.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4613">i915#4613</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@gem_lmem_swapping@verify-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12193">i915#12193</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@gem_lmem_swapping@verify-ccs@lme=
m0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@gem_media_vme.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#2=
84</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@big-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@gem_mmap@big-bo.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i9=
15#4083</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@gem_mmap_gtt@basic-small-bo.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4077">i915#4077</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@gem_mmap_gtt@cpuset-medium-copy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4077">i915#4077</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@medium-copy-odd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-13/igt@gem_mmap_gtt@medium-copy-odd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4077">i915#4077</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read-write-distinct:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-19/igt@gem_mmap_wc@read-write-distinct.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4083">i915#4083</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-prefaulted:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-7/igt@gem_mmap_wc@write-prefaulted.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4083">i915#4083</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@gem_partial_pwrite_pread@reads.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@gem_pread@exhaustion.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/328=
2">i915#3282</a>) +7 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-snb1/igt@gem_pread@exhaustion.html">WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658"=
>i915#2658</a>) +1 other test warn</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-4/igt@gem_pread@exhaustion.html">WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/265=
8">i915#2658</a>) +1 other test warn</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-glk5/igt@gem_pread@exhaustion.html">WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658"=
>i915#2658</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@gem_pread@exhaustion.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/328=
2">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@gem_pread@snoop.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i91=
5#3282</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-glk1/igt@gem_pwrite@basic-exhaustion.html">=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14702">i915#14702</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite_snooped:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@gem_pwrite_snooped.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">=
i915#3282</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-3/igt@gem_pxp@hw-rejects-pxp-buffer.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-19/igt@gem_pxp@protected-encrypted-src-=
copy-not-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4270">i915#4270</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-7/igt@gem_pxp@regular-baseline-src-copy=
-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4270">i915#4270</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-mtlp-7/igt@gem_pxp@verify-pxp-key-change-after-suspend-resu=
me.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14130/shard-mtlp-7/igt@gem_pxp@verify-pxp-key-change-after-suspend-r=
esume.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15317">i915#15317</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-linear:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-5/igt@gem_render_copy@y-tiled-ccs-to-li=
near.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/8428">i915#8428</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@gem_render_copy@yf-tiled-mc-ccs-=
to-vebox-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/8428">i915#8428</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@gem_set_tiling_vs_blt@untiled-to=
-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4079">i915#4079</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-3/igt@gem_set_tiling_vs_blt@untiled-to-=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@gem_tiled_pread_basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/407=
9">i915#4079</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@gem_unfence_active_buffers.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4879">i915#4879</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@gem_userptr_blits@create-destroy-=
unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@gem_userptr_blits@create-destroy=
-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@gem_userptr_blits@create-destroy=
-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@gem_userptr_blits@forbidden-opera=
tions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3282">i915#3282</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-13/igt@gem_userptr_blits@forbidden-oper=
ations.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3282">i915#3282</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@gem_userptr_blits@forbidden-oper=
ations.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3282">i915#3282</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@gem_userptr_blits@forbidden-opera=
tions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3282">i915#3282</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-7/igt@gem_userptr_blits@map-fixed-inval=
idate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-15/igt@gem_userptr_blits@map-fixed-inva=
lidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@gem_userptr_blits@relocations.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3281">i915#3281</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-18/igt@gem_userptr_blits@relocations.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3281">i915#3281</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-3/igt@gem_userptr_blits@unsync-unmap-cy=
cles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@gem_userptr_blits@unsync-unmap-c=
ycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-8/igt@gem_userptr_blits@unsync-unmap-c=
ycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-snb4/igt@gem_workarounds@suspend-resume.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15317">i915#15317</a>) +9 other tests abort</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@gem_workarounds@suspend-resume.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15317">i915#15317</a>) +6 other tests abort</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-glk6/igt@gem_workarounds@suspend-resume-con=
text.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@gem_workarounds@suspend-resume-f=
d.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15317">i915#15317</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@gen7_exec_parse@bitmasks.html">SK=
IP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@gen9_exec_parse@basic-rejected-c=
tx-param.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@gen9_exec_parse@batch-without-en=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2856">i915#2856</a>) +3 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@gen9_exec_parse@batch-without-end=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/2856">i915#2856</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@gen9_exec_parse@bb-large.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2527">i915#2527</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@gen9_exec_parse@bb-start-param.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2527">i915#2527</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-4/igt@gen9_exec_parse@unaligned-jump.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2856">i915#2856</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-3/igt@i915_drm_fdinfo@all-busy-check-al=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14123">i915#14123</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-14/igt@i915_drm_fdinfo@all-busy-check-a=
ll.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@i915_drm_fdinfo@most-busy-idle-c=
heck-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14073">i915#14073</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@i915_drm_fdinfo@most-busy-idle-c=
heck-all@vecs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14073">i915#14073</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@i915_drm_fdinfo@most-busy-idle-ch=
eck-all@vecs1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14073">i915#14073</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@i915_drm_fdinfo@virtual-busy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14118">i915#14118</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-7/igt@i915_drm_fdinfo@virtual-busy-idle=
-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14118">i915#14118</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-3/igt@i915_module_load@reload-no-displa=
y.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13029">i915#13029</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-14/igt@i915_module_load@reload-no-displ=
ay.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13029">i915#13029</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-snb4/igt@i915_module_load@reload-no-display=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-3/igt@i915_module_load@resize-bar.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14545">i915#14545</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-14/igt@i915_module_load@resize-bar.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/7178">i915#7178</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-2/igt@i915_module_load@resize-bar.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-2/igt@i915_pm_freq_mult@media-freq@gt0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6590">i915#6590</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@i915_pm_freq_mult@media-freq@gt0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6590">i915#6590</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-4/igt@i915_pm_freq_mult@media-freq@gt0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@i915_pm_freq_mult@media-freq@gt1=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6590">i915#6590</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@i915_pm_rc6_residency@media-rc6-a=
ccuracy.html">SKIP</a> +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-devices:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-glk9/igt@i915_pm_rpm@system-suspend-devices=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15317">i915#15317</a>) +4 other tests abort</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-15/igt@i915_pm_rps@basic-api.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6621">i915#6621</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-6/igt@i915_pm_rps@basic-api.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6621">i915#6621</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@i915_pm_rps@min-max-config-loaded=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/6621">i915#6621</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-snb7/igt@i915_pm_rps@reset.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
729">i915#13729</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13821">i915#13821</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-mtlp-5/igt@i915_power@sanity.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@i=
915_power@sanity.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/7984">i915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt@intel_hwmon@hwmon-write.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7=
707">i915#7707</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-6/igt@intel_hwmon@hwmon-write.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
7707">i915#7707</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@intel_hwmon@hwmon-write.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@kms_addfb_basic@bo-too-small-due=
-to-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@kms_addfb_basic@framebuffer-vs-se=
t-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-3/igt@kms_addfb_basic@tile-pitch-misma=
tch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_async_flips@async-flip-dpms.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15313">i915#15313</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_async_flips@invalid-async-fl=
ip-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15331">i915#15331</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-3/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@kms_atomic@plane-primary-overlay-=
mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9531">i915#9531</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9531">i915#9531</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-snb7/igt@kms_atomic_transition@plane-all-mo=
deset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-3/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915=
#3555</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-glk10/igt@kms_atomic_transition@plane-all-m=
odeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/5286">i915#5286</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@kms_big_fb@4-tiled-addfb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +10 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a=
>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-180-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-=
180.html">SKIP</a> +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_big_fb@y-tiled-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-13/igt@kms_big_fb@y-tiled-64bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3638">i915#3638</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_big_fb@y-tiled-addfb-size-ove=
rflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@kms_big_fb@y-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/6187">i915#6187</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5190">i915#5190</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-18/igt@kms_big_fb@yf-tiled-8bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4538">i915#4538</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-7/igt@kms_ccs@bad-aux-stride-4-tiled-mt=
l-rc-ccs-cc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1=
13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-9/igt@kms_ccs@bad-rotation-90-4-tiled-=
bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>) +5 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-b=
mg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@kms_ccs@bad-rotation-90-4-tiled-l=
nl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-l=
nl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12313">i915#12313</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-19/igt@kms_ccs@bad-rotation-90-4-tiled-=
lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-m=
tl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +45 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-m=
tl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +53 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-y-tiled=
-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) =
+9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-8/igt@kms_ccs@ccs-on-another-bo-y-tile=
d-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +134 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +84 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-13/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-til=
ed-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-til=
ed-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +14 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs-cc@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +154 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-til=
ed-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/6095">i915#6095</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-=
1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10=
434</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-m=
tl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +=
11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_cdclk@mode-transition.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13781">i915#13781</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-2/igt@kms_cdclk@mode-transition.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3742">i915#3742</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-17/igt@kms_cdclk@mode-transition.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3742">i915#3742</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-9/igt@kms_cdclk@mode-transition.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-11/igt@kms_cdclk@mode-transition@pipe-b=
-dp-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13781">i915#13781</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@kms_cdclk@plane-scaling@pipe-b-hd=
mi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13783">i915#13783</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-8/igt@kms_chamelium_audio@dp-audio.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/7828">i915#7828</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_chamelium_audio@hdmi-audio.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/7828">i915#7828</a>) +8 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-3/igt@kms_chamelium_audio@hdmi-audio.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-15/igt@kms_chamelium_audio@hdmi-audio-e=
did.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-sing=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-6/igt@kms_chamelium_hpd@dp-hpd-for-eac=
h-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-glk9/igt@kms_colorop@plane-xr24-xr24-srgb_e=
otf-srgb_inv_eotf.html">SKIP</a> +225 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-4/igt@kms_content_protection@atomic-dp=
ms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/7116">i915#7116</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_content_protection@dp-mst-sus=
pend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-19/igt@kms_content_protection@dp-mst-su=
spend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-3/igt@kms_content_protection@dp-mst-su=
spend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@kms_content_protection@dp-mst-su=
spend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@kms_content_protection@dp-mst-sus=
pend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-2/igt@kms_content_protection@dp-mst-typ=
e-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3116">i915#3116</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@kms_content_protection@dp-mst-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3299">i915#3299</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-4/igt@kms_content_protection@dp-mst-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3116">i915#3116</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@kms_content_protection@dp-mst-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3299">i915#3299</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_content_protection@dp-mst-typ=
e-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-8/igt@kms_content_protection@lic-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_content_protection@lic-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_content_protection@lic-type-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_content_protection@lic-type-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-6/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8063">i915#8063</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9433">i915#9433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_content_protection@srm.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/7118">i915#7118</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@kms_content_protection@srm.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/7118">i915#7118</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-18/igt@kms_content_protection@srm.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/7116">i915#7116</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-3/igt@kms_content_protection@srm.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/7116">i915#7116</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@kms_content_protection@suspend-r=
esume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6944">i915#6944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@kms_content_protection@type1.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/7118">i915#7118</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt@kms_content_protection@type1.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/7118">i915#7118</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-18/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/7116">i915#7116</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) +2 other tests skip</=
li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-3/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-2/igt@kms_cursor_crc@cursor-offscreen-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-64=
x21.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-tglu-2/igt@kms_cursor_crc@cursor-random-128x42.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/sh=
ard-tglu-3/igt@kms_cursor_crc@cursor-random-128x42.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#135=
66</a>) +1 other test fail</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@kms_cursor_crc@cursor-random-128=
x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8814">i915#8814</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x=
170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x=
170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_cursor_crc@cursor-random-512=
x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@kms_cursor_crc@cursor-random-max=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8814">i915#8814</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movem=
ent-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@kms_cursor_crc@cursor-rapid-move=
ment-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-3/igt@kms_cursor_crc@cursor-rapid-movem=
ent-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movem=
ent-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-=
a-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14130/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-h=
dmi-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-25=
6x85.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_cursor_legacy@2x-long-flip-vs=
-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@kms_cursor_legacy@2x-nonblocking=
-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-3/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other =
test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-8/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@kms_cursor_legacy@cursora-vs-flip=
b-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +7 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-8/igt@kms_cursor_legacy@modeset-atomic=
-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103=
</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9723">i915#9723</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@kms_dirtyfb@psr-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9723">i915#9723</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9723">i915#9723</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9833">i915#9833</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_dp_aux_dev.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915=
#1257</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-13/igt@kms_dp_aux_dev.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i91=
5#1257</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-5/igt@kms_dp_aux_dev.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i91=
5#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@kms_dp_link_training@uhbr-mst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13749">i915#13749</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_dp_link_training@uhbr-sst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@kms_dsc@dsc-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3840">i915#3840</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9159">i915#9159</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_dsc@dsc-with-bpc-formats.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-17/igt@kms_fbcon_fbt@fbc-suspend.html">=
ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15317">i915#15317</a>) +7 other tests abort</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-glk10/igt@kms_fbcon_fbt@fbc-suspend.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3469">i915#3469</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-8/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3469">i915#3469</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_fbcon_fbt@psr-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@kms_feature_discovery@display-4x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/1839">i915#1839</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-18/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1839">i915#1839</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-3/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1839">i915#1839</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_feature_discovery@display-4x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-10/igt@kms_feature_discovery@dp-mst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9337">i915#9337</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-18/igt@kms_fence_pin_leak.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881"=
>i915#4881</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@kms_fence_pin_leak.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881"=
>i915#4881</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_fence_pin_leak.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881">=
i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-6/igt@kms_flip@2x-flip-vs-absolute-wf_=
vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@kms_flip@2x-flip-vs-blocking-wf-v=
blank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9934">i915#9934</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_flip@2x-flip-vs-fences.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8381">i915#8381</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_flip@2x-flip-vs-fences.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8381">i915#8381</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@kms_flip@2x-flip-vs-fences.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@kms_flip@2x-flip-vs-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9934">i915#9934</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt@kms_flip@2x-plain-flip-interrupti=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9934">i915#9934</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_flip@2x-wf_vblank-ts-check-in=
terruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests ski=
p</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_flip@2x-wf_vblank-ts-check-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip=
</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_flip@2x-wf_vblank-ts-check-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9934">i915#9934</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-glk1/igt@kms_flip@flip-vs-suspend.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4839">i915#4839</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-9/igt@kms_flip@flip-vs-suspend@a-hdmi-=
a1.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15317">i915#15317</a>) +9 other tests abort</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-glk1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-1/igt@kms_flip@flip-vs-suspend@a-hdmi-a=
2.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15317">i915#15317</a>) +10 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i=
915#8813</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a=
>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
672">i915#2672</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-y=
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
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
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
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#258=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i=
915#2672</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/8813">i915#8813</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-=
4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)=
 +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i9=
15#3555</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</l=
i>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672=
">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#355=
5</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i=
915#8813</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i9=
15#5190</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)=
 +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#355=
5</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +11 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-cur-indfb-draw-render.html">SKIP</a> +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-til=
ing-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#151=
02</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +4 other test=
s skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt=
:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>) +1 othe=
r test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-snb1/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> +471 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/30=
23">i915#3023</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +19 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i91=
5#3458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +20 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825=
</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr=
-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-t=
iling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/10055">i915#10055</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/10055">i915#10055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@kms_frontbuffer_tracking@pipe-fbc=
-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9766">i915#9766</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-19/igt@kms_frontbuffer_tracking@pipe-fb=
c-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9766">i915#9766</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-2/igt@kms_frontbuffer_tracking@pipe-fb=
c-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9766">i915#9766</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@kms_frontbuffer_tracking@pipe-fbc=
-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-=
offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +22 o=
ther tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +20 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +36 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +34 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +39 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +94 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-indf=
b-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +21 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb=
101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15102">i915#15102</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-shr=
fb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15102">i915#15102</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@kms_hdr@bpc-switch.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"=
>i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-3/igt@kms_hdr@bpc-switch-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_hdr@bpc-switch-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@kms_hdr@brightness-with-hdr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/12713">i915#12713</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-11/igt@kms_hdr@brightness-with-hdr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13331">i915#13331</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-17/igt@kms_hdr@brightness-with-hdr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/12713">i915#12713</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-9/igt@kms_hdr@brightness-with-hdr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_hdr@static-toggle-dpms.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-3/igt@kms_hdr@static-toggle-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12339">i915#12339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@kms_joiner@invalid-modeset-big-jo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/10656">i915#10656</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-18/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/10656">i915#10656</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-3/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/10656">i915#10656</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_joiner@invalid-modeset-big-jo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-3/igt@kms_joiner@invalid-modeset-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12339">i915#12339</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@kms_joiner@invalid-modeset-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12339">i915#12339</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@kms_joiner@invalid-modeset-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12339">i915#12339</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12339">i915#12339</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-19/igt@kms_joiner@invalid-modeset-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12339">i915#12339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_multipipe_modeset@basic-max-p=
ipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4816">i915#4816</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@kms_panel_fitting@atomic-fastset.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6301">i915#6301</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_panel_fitting@atomic-fastset=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6301">i915#6301</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_panel_fitting@atomic-fastset=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-6/igt@kms_pipe_stress@stress-xrgb8888-=
yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14712">i915#14712</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_pipe_stress@stress-xrgb8888-y=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13705">i915#13705</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@kms_pipe_stress@stress-xrgb8888-=
ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13705">i915#13705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@kms_plane_lowres@tiling-x.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/11614">i915#11614</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3582">i915#3582</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@kms_plane_lowres@tiling-x@pipe-a=
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
/tree/drm-tip/IGTPW_14130/shard-dg2-7/igt@kms_plane_lowres@tiling-yf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-5/igt@kms_plane_multiple@2x-tiling-none=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13958">i915#13958</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-none=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13958">i915#13958</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-15/igt@kms_plane_multiple@2x-tiling-non=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13958">i915#13958</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-4/igt@kms_plane_multiple@2x-tiling-non=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-3/igt@kms_plane_multiple@tiling-4.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14259">i915#14259</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_plane_multiple@tiling-4.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14259">i915#14259</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-8/igt@kms_plane_multiple@tiling-4.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d:<=
/p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5-unity-scaling@pipe-d.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_pm_backlight@bad-brightness.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/5354">i915#5354</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_pm_backlight@bad-brightness.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9812">i915#9812</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-13/igt@kms_pm_backlight@bad-brightness.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-10/igt@kms_pm_backlight@fade-with-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-3/igt@kms_pm_dc@dc5-dpms-negative.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13441">i915#13441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-6/igt@kms_pm_dc@dc6-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15128=
">i915#15128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340=
">i915#9340</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9340">i915#9340</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_pm_lpsp@kms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/382=
8">i915#3828</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_pm_lpsp@kms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/934=
0">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@kms_pm_lpsp@screens-disabled.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8430">i915#8430</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-15/igt@kms_pm_lpsp@screens-disabled.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8430">i915#8430</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-4/igt@kms_pm_lpsp@screens-disabled.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8430">i915#8430</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-6/igt@kms_pm_lpsp@screens-disabled.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8430">i915#8430</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-5/igt@kms_pm_lpsp@screens-disabled.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@km=
s_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-5/igt@kms_pm_rpm@modeset-non-lpsp.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15073">i915#15073</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@kms_pm_rpm@modeset-non-lpsp.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15073">i915#15073</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-8/igt@kms_pm_rpm@system-suspend-modese=
t.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/10553">i915#10553</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15317">i915#15317</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_pm_rpm@system-suspend-modese=
t.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/10553">i915#10553</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15317">i915#15317</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-glk10/igt@kms_pm_rpm@system-suspend-modeset=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/10553">i915#10553</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15317">i915#15317</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@kms_pm_rpm@system-suspend-modeset=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/10553">i915#10553</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15317">i915#15317</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_pm_rpm@system-suspend-modese=
t.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/10553">i915#10553</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15317">i915#15317</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_prime@basic-crc-hybrid.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6524">i915#6524</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6805">i915#6805</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_prime@basic-crc-hybrid.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6524">i915#6524</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_prime@basic-crc-hybrid.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6524">i915#6524</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-13/igt@kms_prime@basic-crc-hybrid.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-snb1/igt@kms_psr2_sf@fbc-pr-overlay-plane-m=
ove-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +12 other tests ski=
p</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-=
update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-glk10/igt@kms_psr2_sf@fbc-psr2-overlay-plan=
e-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-=
continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 othe=
r test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_psr2_sf@pr-cursor-plane-move=
-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_psr2_sf@pr-overlay-plane-upda=
te-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11520">i915#11520</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-glk9/igt@kms_psr2_sf@pr-overlay-primary-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-6/igt@kms_psr2_sf@psr2-cursor-plane-mo=
ve-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9683">i915#9683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@kms_psr2_su@page_flip-xrgb8888.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9683">i915#9683</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_psr2_su@page_flip-xrgb8888.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9683">i915#9683</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9683">i915#9683</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_psr@fbc-psr-dpms.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/968=
8">i915#9688</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_psr@fbc-psr-primary-page-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-3/igt@kms_psr@pr-dpms.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i9=
15#9732</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-mmap-gtt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_psr@pr-sprite-mmap-gtt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@kms_psr@pr-suspend.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072"=
>i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9732">i915#9732</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@kms_psr@psr-sprite-plane-move.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-11/igt@kms_psr@psr2-primary-mmap-gtt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9732">i915#9732</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_psr_stress_test@flip-primary-=
invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9685">i915#9685</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-14/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9685">i915#9685</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-6/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-3/igt@kms_psr_stress_test@invalidate-pr=
imary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9685">i915#9685</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-6/igt@kms_rotation_crc@bad-tiling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/12755">i915#12755</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-6/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-14/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@kms_rotation_crc@sprite-rotation-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12755">i915#12755</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-8/igt@kms_scaling_modes@scaling-mode-f=
ull-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) +10 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-fu=
ll-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-glk9/igt@kms_selftest@drm_framebuffer.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13179">i915#13179</a>) +1 other test abort</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-6/igt@kms_selftest@drm_framebuffer.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-7/igt@kms_selftest@drm_framebuffer@drm_=
test_framebuffer_free.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</=
li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-5/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-=
1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14130/shard-rkl-5/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-=
a-1.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15317">i915#15317</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@kms_vrr@flipline.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i=
915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/8808">i915#8808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@kms_vrr@lobf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#=
11920</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@kms_vrr@lobf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#=
11920</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-19/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915=
#11920</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-2/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915=
#11920</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915=
#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_vrr@seamless-rr-switch-virtua=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9906">i915#9906</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_vrr@seamless-rr-switch-virtua=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9906">i915#9906</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-virtu=
al.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-13/igt@kms_vrr@seamless-rr-switch-virtu=
al.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-glk9/igt@kms_writeback@writeback-check-outp=
ut.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-glk10/igt@kms_writeback@writeback-check-out=
put-xrgb2101010.html">SKIP</a> +206 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-8/igt@kms_writeback@writeback-fb-id.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2437">i915#2437</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@kms_writeback@writeback-fb-id.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2437">i915#2437</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@kms_writeback@writeback-fb-id.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2437">i915#2437</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_writeback@writeback-fb-id.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2437">i915#2437</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@kms_writeback@writeback-fb-id.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@perf@mi-rpc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#24=
34</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@perf@mi-rpc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2434">i915#2434</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@perf@mi-rpc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2=
434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@perf@unprivileged-single-ctx-coun=
ters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2433">i915#2433</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-12/igt@perf@unprivileged-single-ctx-cou=
nters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@perf_pmu@frequency@gt0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12=
549">i915#12549</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6806">i915#6806</a>) +1 other test fail</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-18/igt@perf_pmu@frequency@gt0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
2549">i915#12549</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/6806">i915#6806</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@perf_pmu@rc6-suspend.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
059">i915#15059</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15317">i915#15317</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-glk10/igt@perf_pmu@rc6-suspend.html">ABORT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/153=
17">i915#15317</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-6/igt@perf_pmu@rc6@other-idle-gt0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@prime_mmap@test_aperture_limit.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14121">i915#14121</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@prime_vgem@basic-fence-mmap.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4077">i915#4077</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-8/igt@prime_vgem@basic-fence-mmap.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3708">i915#3708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-3/igt@prime_vgem@basic-write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
91">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3708">i915#3708</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt@prime_vgem@basic-write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
91">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3708">i915#3708</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-14/igt@prime_vgem@basic-write.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@prime_vgem@fence-read-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3708">i915#3708</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-1/igt@prime_vgem@fence-read-hang.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3708">i915#3708</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@prime_vgem@fence-read-hang.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt@sriov_basic@bind-unbind-vf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9917">i915#9917</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf@vf-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-7/igt@sriov_basic@bind-unbind-vf@vf-4.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12910">i915#12910</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-2:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-7/igt@sriov_basic@enable-vfs-autoprobe=
-on@numvfs-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12910">i915#12910</a>) +19 other tests fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg2-6/igt@sriov_basic@enable-vfs-bind-unbin=
d-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbin=
d-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbi=
nd-each-numvfs-all.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12910">i915#12910</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-dg1-16/igt@sriov_basic@enable-vfs-bind-unbi=
nd-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-7/igt@gem_ctx_isolation@preservation-s3@bcs0.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5317">i915#15317</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14130/shard-rkl-4/igt@gem_ctx_isolation@preservation-s3@bcs0.htm=
l">PASS</a> +3 other tests pass</li>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-dg2-5/igt@gem_ctx_isolation@preservation-s3@bcs0.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5317">i915#15317</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14130/shard-dg2-8/igt@gem_ctx_isolation@preservation-s3@bcs0.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-mtlp-5/igt@gem_eio@in-flight-suspend.html">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915#1=
5317</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4130/shard-mtlp-4/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-8/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363">i915#13363</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard=
-rkl-6/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-tglu-7/igt@gem_pxp@verify-pxp-key-change-after-suspend-resu=
me.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15317">i915#15317</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14130/shard-tglu-2/igt@gem_pxp@verify-pxp-key-chang=
e-after-suspend-resume.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8644/shard-mtlp-7/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-5/igt@i915=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_8644/shard-mtlp-4/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-4/i=
gt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGT_8644/shard-mtlp-3/igt@i915_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-m=
tlp-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-5/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/=
shard-mtlp-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-2/igt@i915_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
T_8644/shard-mtlp-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-8/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGT_8644/shard-mtlp-7/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-2/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_8644/shard-mtlp-4/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-8/=
igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGT_8644/shard-mtlp-7/igt@i915_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-=
mtlp-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-5/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644=
/shard-mtlp-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-6/igt@i915_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GT_8644/shard-mtlp-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-2/igt@i915_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGT_8644/shard-mtlp-6/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-mtlp-4/igt@i9=
15_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14785">i915#14785</a>) -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14130/shard-mtlp-4/igt@i915_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-6/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14130/shard-mtlp-6/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/s=
hard-mtlp-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@i915_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14130/shard-mtlp-7/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-3/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard=
-mtlp-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@i915_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14130/shard-mtlp-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-8/igt@i915_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14130/shard-mtlp-5/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp=
-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-3/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_141=
30/shard-mtlp-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-6/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14130/shard-mtlp-3/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-7/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@i915_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/sh=
ard-mtlp-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-4/igt@i915_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14130/shard-mtlp-5/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-mtlp-2/igt@i=
915_module_load@load.html">PASS</a>)</li>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8644/shard-rkl-5/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-5/igt@i915_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGT_8644/shard-rkl-2/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_8644/shard-rkl-5/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-6/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGT_8644/shard-rkl-5/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl=
-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_8644/shard-rkl-2/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shar=
d-rkl-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-7/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644=
/shard-rkl-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-7/igt@i915_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
_8644/shard-rkl-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-3/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8644/shard-rkl-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-8/igt@i915_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGT_8644/shard-rkl-3/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-4/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_8644/shard-rkl-8/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8644/shard-rkl-8/ig=
t@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGT_8644/shard-rkl-4/igt@i915_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
785">i915#14785</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14130/shard-rkl-4/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt=
@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14130/shard-rkl-1/igt@i915_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shar=
d-rkl-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@i915_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14130/shard-rkl-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@i915_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14130/shard-rkl-7/igt@i915_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-5/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14130/shard-rkl-2/igt@i915_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/sha=
rd-rkl-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@i915_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14130/shard-rkl-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@i915_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14130/shard-rkl-7/igt@i915_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@i915_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/sh=
ard-rkl-1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-3/igt@i915_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14130/shard-rkl-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-3/igt@i915_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14130/shard-rkl-8/igt@i915_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-5/=
igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14130/shard-rkl-2/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/s=
hard-rkl-8/igt@i915_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-snb7/igt@i915_suspend@basic-s2idle-without-i915.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
317">i915#15317</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14130/shard-snb6/igt@i915_suspend@basic-s2idle-without-i915.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5138">i915#5138</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14130/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-7/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#355=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14130/shard-rkl-6/igt@kms_hdr@static-toggle-dpms.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-7/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/sh=
ard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-dg2-7/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#=
13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14130/shard-dg2-8/igt@gem_ccs@suspend-resume.html">ABORT</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915#15317</a>=
) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-3/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390">i9=
15#13390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14130/shard-rkl-6/igt@gem_eio@in-flight-suspend.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i915#153=
17</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-6/igt@gem_exec_reloc@basic-cpu.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14130/shard-rkl-4/igt@gem_exec_reloc@basic-cpu.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i91=
5#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281"=
>i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14130/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-6/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14130/shard-rkl-7/igt@gem_lmem_swapping@random-engines.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-5/igt@gem_media_vme.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/i=
gt@gem_media_vme.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@gem_partial_pwrite_pread=
@writes-after-reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-4/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130=
/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i91=
5#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-6/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14130/shard-rkl-8/igt@gem_userptr_blits@unsync-overlap.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-6/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8399">i915#8399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14130/shard-rkl-7/igt@i915_pm_freq_api@freq-reset.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399=
">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14130/shard-rkl-1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</=
a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-glk6/igt@i915_suspend@fence-restore-tiled2untiled.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4817">i915#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14130/shard-glk1/igt@i915_suspend@fence-restore-tiled2untile=
d.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15317">i915#15317</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9531">i915#9531</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutab=
le-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-h=
flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stri=
de-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180=
-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-4/igt@kms_big=
_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#52=
86</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/140=
98">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_ccs@ccs-on=
-another-bo-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-8/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_ccs@missing-ccs=
-buffer-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"=
>i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-6/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3742">i915#3742</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14130/shard-rkl-1/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915=
#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-7/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">=
i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-read.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
1151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_chameliu=
m_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">=
SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
130/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-4/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9067">i915#9067</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic-cur=
sor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-3/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3=
555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3840">i915#3840</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14130/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yf=
tileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/sha=
rd-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upsca=
ling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2672">i915#2672</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yf=
tileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130=
/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-u=
pscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-yti=
leccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@km=
s_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2672">i915#2672</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-yti=
leccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt=
@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-=
valid-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indf=
b-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_frontbuffer_trac=
king@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i=
915#1825</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-suspend.html">ABORT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/153=
17">i915#15317</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14130/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/10056">i915#10056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/543=
9">i915#5439</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14130/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrac=
k-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rk=
l-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3023">i915#3023</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-i=
ndfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/sh=
ard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pw=
rite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3458">i915#3458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-dg2-4/igt@kms_frontbuffer_t=
racking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#151=
02</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3458">i915#3458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indf=
b-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@kms_frontbuf=
fer_tracking@psr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-=
gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_frontbuffer=
_tracking@psr-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#1=
5102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3023">i915#3023</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-dg2-11/igt@kms_hdr@static-toggle-suspend.html">ABORT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15317">i9=
15#15317</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14130/shard-dg2-8/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3=
555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-5/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i9=
15#6301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14130/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i91=
5#13958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14130/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#=
13958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotati=
on@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_plane_scaling@plane=
-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#153=
29</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-4/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915=
#6524</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14130/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-ar=
ea.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-pla=
ne-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-ex=
ceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14130/shard-rkl-5/igt@km=
s_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520"=
>i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-6/igt@kms_psr@pr-sprite-mmap-gtt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#107=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_14130/shard-rkl-8/igt@kms_psr@pr-sprite-mmap-gtt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-4/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915=
#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14130/shard-rkl-6/igt@kms_psr@psr-sprite-plane-onoff.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"=
>i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14130/shard-rkl-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2435">i915#2435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14130/shard-rkl-7/igt@perf@per-context-mode-unprivilege=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2435">i915#2435</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516=
">i915#8516</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14130/shard-rkl-4/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a=
>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8644/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14130/shard-rkl-3/igt@prime_vgem@fence-flip-hang.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">=
i915#3708</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8644 -&gt; IGTPW_14130</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17600: 2e2c779bc906d76b96ec0a46d9b85d1b035d2e23 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_14130: 6ab97b6621bcc44e67a97b073f6e37d94bd840d2 @ https://gitlab.fr=
eedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8644: 069c5ee6eb658181e7264883c6c4fba41fc917a4 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============9064664771293550468==--
