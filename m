Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3D5C48BF8
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 23:45:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5F410E06F;
	Mon, 19 Feb 2024 23:45:02 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2611510E067;
 Mon, 19 Feb 2024 23:45:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6573535220723126575=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_extend_psr2=5Fsf_test_for_p?=
 =?utf-8?q?r=5Fsf_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 19 Feb 2024 23:45:02 -0000
Message-ID: <170838630213.107368.2176550202035486935@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240219163333.2339647-1-kunal1.joshi@intel.com>
In-Reply-To: <20240219163333.2339647-1-kunal1.joshi@intel.com>
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

--===============6573535220723126575==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: extend psr2_sf test for pr_sf (rev6)
URL   : https://patchwork.freedesktop.org/series/129004/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7717_full -> IGTPW_10696_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10696_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10696_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/index.html

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10696_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-dg1:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * {igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1} (NEW):
    - shard-mtlp:         NOTRUN -> [SKIP][3] +23 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-1/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1.html

  
#### Warnings ####

  * igt@kms_async_flips@test-cursor:
    - shard-mtlp:         [SKIP][4] ([i915#6229]) -> [SKIP][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-mtlp-7/igt@kms_async_flips@test-cursor.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-4/igt@kms_async_flips@test-cursor.html

  
New tests
---------

  New tests have been introduced between IGT_7717_full and IGTPW_10696_full:

### New IGT tests (50) ###

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf@psr2-pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [11.83] s

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf@psr2-pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [11.85] s

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf@psr2-pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [11.51] s

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf@psr2-pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [11.49] s

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf@psr2-pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [11.15] s

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf@psr2-pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [11.19] s

  * igt@kms_psr2_sf@cursor-plane-update-sf@psr2-pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_psr2_sf@cursor-plane-update-sf@psr2-pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf@psr2-pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.87] s

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf@psr2-pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.21] s

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf@psr2-pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.89] s

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf@psr2-pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.22] s

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf@psr2-pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.86] s

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf@psr2-pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.21] s

  * igt@kms_psr2_sf@fbc-cursor-plane-update-sf@psr2-pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.83] s

  * igt@kms_psr2_sf@fbc-cursor-plane-update-sf@psr2-pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.22] s

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf@psr2-pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.88] s

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf@psr2-pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.21] s

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf@psr2-pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.83] s

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf@psr2-pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.21] s

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf@psr2-pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.83] s

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf@psr2-pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.21] s

  * igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf@psr2-pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.85] s

  * igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf@psr2-pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.21] s

  * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.83] s

  * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area@psr2-pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.21] s

  * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area@a-pipe-psr2-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.83] s

  * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area@b-pipe-psr2-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.26] s

  * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.83] s

  * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.22] s

  * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.84] s

  * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.27] s

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf@psr2-pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [17.28] s

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf@psr2-pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [17.27] s

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf@psr2-pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [12.10] s

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf@psr2-pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [12.09] s

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf@psr2-pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.81] s

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf@psr2-pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.78] s

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf@psr2-pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.83] s

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf@psr2-pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.82] s

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.80] s

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area@psr2-pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.81] s

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area@a-pipe-psr2-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.83] s

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area@b-pipe-psr2-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.84] s

  * igt@kms_psr2_sf@plane-move-sf-dmg-area@psr2-pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.47] s

  * igt@kms_psr2_sf@plane-move-sf-dmg-area@psr2-pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.46] s

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb@psr2-pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.46] s

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb@psr2-pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.39] s

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.86] s

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area@psr2-pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.82] s

  

Known issues
------------

  Here are the changes found in IGTPW_10696_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][6] ([i915#8411]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-7/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#8411]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][8] ([i915#8411]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu:         NOTRUN -> [SKIP][9] ([i915#7701])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-3/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@virtual-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][10] ([i915#8414])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-7/igt@drm_fdinfo@virtual-busy.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#8414]) +12 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@drm_fdinfo@virtual-busy-all.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#3936])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][13] ([i915#3555] / [i915#9323])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-3/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][14] ([i915#10137] / [i915#7297])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#6335])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#8562])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-rkl:          [PASS][17] -> [FAIL][18] ([i915#6268])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-mtlp:         NOTRUN -> [SKIP][19] ([fdo#109314])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-5/igt@gem_ctx_param@set-priority-not-supported.html
    - shard-dg2:          NOTRUN -> [SKIP][20] ([fdo#109314])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@gem_ctx_param@set-priority-not-supported.html
    - shard-rkl:          NOTRUN -> [SKIP][21] ([fdo#109314])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-5/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#8555])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-15/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#280])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-4/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@hibernate:
    - shard-rkl:          NOTRUN -> [ABORT][24] ([i915#7975] / [i915#8213])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-3/igt@gem_eio@hibernate.html

  * igt@gem_eio@reset-stress:
    - shard-dg2:          [PASS][25] -> [FAIL][26] ([i915#5784])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-dg2-1/igt@gem_eio@reset-stress.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#4771]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-4/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#4771]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#4036])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-6/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#8555])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#6344])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_capture@many-4k-incremental:
    - shard-mtlp:         NOTRUN -> [FAIL][32] ([i915#9606])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-2/igt@gem_exec_capture@many-4k-incremental.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-tglu:         NOTRUN -> [FAIL][33] ([i915#2842])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-5/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace:
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#3539])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-13/igt@gem_exec_fair@basic-pace.html

  * igt@gem_exec_fair@basic-pace-share:
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#4473] / [i915#4771]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-1/igt@gem_exec_fair@basic-pace-share.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][36] -> [FAIL][37] ([i915#2842])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglu:         [PASS][38] -> [FAIL][39] ([i915#2842])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-7/igt@gem_exec_fair@basic-pace@rcs0.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-10/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-throttle:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#3539]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@gem_exec_fair@basic-throttle.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][41] ([i915#2842]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_fence@submit67:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#4812]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#3539] / [i915#4852]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-wb-ro-default:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#3539] / [i915#4852])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-17/igt@gem_exec_flush@basic-wb-ro-default.html

  * igt@gem_exec_params@secure-non-root:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([fdo#112283]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#3281]) +10 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@gem_exec_reloc@basic-gtt.html

  * igt@gem_exec_reloc@basic-gtt-read-active:
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#3281]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-19/igt@gem_exec_reloc@basic-gtt-read-active.html

  * igt@gem_exec_reloc@basic-scanout:
    - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#3281]) +6 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@gem_exec_reloc@basic-scanout.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#4537] / [i915#4812])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@gem_exec_schedule@reorder-wide.html
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#4537] / [i915#4812]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-5/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4860]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#4613]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#4613]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-glk:          NOTRUN -> [SKIP][54] ([fdo#109271] / [i915#4613])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-glk2/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#8289])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@gem_media_fill@media-fill.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#284])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@gem_media_vme.html
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#284])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-5/igt@gem_media_vme.html

  * igt@gem_mmap@bad-object:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4083]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-17/igt@gem_mmap@bad-object.html

  * igt@gem_mmap_gtt@basic-small-bo:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#4077]) +13 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@gem_mmap_gtt@basic-small-bo.html

  * igt@gem_mmap_gtt@basic-write-read:
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4077]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-7/igt@gem_mmap_gtt@basic-write-read.html

  * igt@gem_mmap_wc@coherency:
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#4083])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-1/igt@gem_mmap_wc@coherency.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4083]) +7 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#3282]) +5 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#3282]) +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4270])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-13/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#4270]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4270]) +5 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4270])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-6/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_readwrite@new-obj:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#3282]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-12/igt@gem_readwrite@new-obj.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#3282]) +5 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-5/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#5190]) +11 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#8428]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-4/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4079]) +4 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#4079])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-6/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4885])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4077]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-16/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#3323])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-3/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#3297] / [i915#4880])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#3297]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#3297]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#3297]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#3281]) +7 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-2/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#3297])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-15/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen3_render_tiledx_blits:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([fdo#109289]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@gen3_render_tiledx_blits.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#2527]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-1/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#2527])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-19/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#2856]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@gen9_exec_parse@shadow-peek.html
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#2856]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-6/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#2527] / [i915#2856]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-9/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_fb_tiling:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#4881])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@i915_fb_tiling.html

  * igt@i915_module_load@reload:
    - shard-snb:          [PASS][91] -> [INCOMPLETE][92] ([i915#9849])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-snb6/igt@i915_module_load@reload.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb2/igt@i915_module_load@reload.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#8399])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [PASS][94] -> [INCOMPLETE][95] ([i915#9407])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-dg2-10/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([fdo#109289]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
    - shard-dg1:          [PASS][97] -> [FAIL][98] ([i915#3591])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([fdo#109293] / [fdo#109506])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#6621]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-idle-park@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#8925])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@i915_pm_rps@thresholds-idle-park@gt0.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#4387])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-5/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglu:         NOTRUN -> [SKIP][103] ([fdo#109303])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-6/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-rkl:          [PASS][104] -> [FAIL][105] ([i915#10031])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-rkl-5/igt@i915_suspend@basic-s3-without-i915.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-4/igt@i915_suspend@basic-s3-without-i915.html
    - shard-tglu:         NOTRUN -> [INCOMPLETE][106] ([i915#7443])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-4/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc:
    - shard-mtlp:         NOTRUN -> [SKIP][107] ([i915#8709]) +11 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#8709]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#8709]) +11 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#1769] / [i915#3555])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#1769] / [i915#3555])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#1769] / [i915#3555])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([fdo#111614]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-8/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][114] ([fdo#111615] / [i915#5286]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#5286]) +4 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#4538] / [i915#5286]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [PASS][117] -> [FAIL][118] ([i915#5138])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][119] ([fdo#111614] / [i915#3638]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-1/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][120] ([fdo#111614])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([fdo#111614]) +4 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         [PASS][122] -> [FAIL][123] ([i915#3743])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#4538] / [i915#5190]) +13 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-mtlp:         NOTRUN -> [SKIP][125] ([fdo#111615]) +5 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][126] ([fdo#111615]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][127] ([fdo#110723]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#4538]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][129] ([fdo#111615]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_joiner@basic:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#2705])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@kms_big_joiner@basic.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][131] ([i915#2705])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-7/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@pipe-a-crc-primary-basic-y-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#5354] / [i915#6095]) +23 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-4/igt@kms_ccs@pipe-a-crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#5354]) +96 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@kms_ccs@pipe-b-crc-primary-basic-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@pipe-b-random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#5354] / [i915#6095]) +9 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-3/igt@kms_ccs@pipe-b-random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
    - shard-glk:          NOTRUN -> [SKIP][135] ([fdo#109271]) +56 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-glk2/igt@kms_ccs@pipe-d-bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-yf-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#5354] / [i915#6095]) +20 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-5/igt@kms_ccs@pipe-d-bad-rotation-90-yf-tiled-ccs.html

  * igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#5354] / [i915#6095]) +7 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-15/igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#5354]) +28 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-3/igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#4087]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-tglu:         NOTRUN -> [SKIP][140] ([i915#7828]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-4/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([fdo#111827]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@kms_chamelium_color@ctm-green-to-red.html
    - shard-dg1:          NOTRUN -> [SKIP][142] ([fdo#111827])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-15/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-tglu:         NOTRUN -> [SKIP][143] ([fdo#111827])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-5/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([fdo#111827])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@kms_chamelium_color@ctm-red-to-blue.html
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([fdo#111827]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-5/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#7828]) +5 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#7828]) +10 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#7828]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-18/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#7828]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@content-type-change:
    - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#6944] / [i915#9424])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-4/igt@kms_content_protection@content-type-change.html
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#9424])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@kms_content_protection@content-type-change.html
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#9424])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#3299])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#3116])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#7118] / [i915#9424])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#7118] / [i915#9424])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][157] ([fdo#109279] / [i915#3359])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#8814])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#3555]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-16/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#3359]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#3555]) +4 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#3359])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#3359]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#3359])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-tglu:         NOTRUN -> [SKIP][165] ([fdo#109274])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([fdo#111767] / [fdo#111825]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
    - shard-snb:          [PASS][167] -> [SKIP][168] ([fdo#109271] / [fdo#111767]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-snb7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#4103] / [i915#4213])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#9809])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([fdo#109274] / [i915#5354]) +5 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][172] ([fdo#111767])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][173] -> [FAIL][174] ([i915#2346])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#4103])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-tglu:         [PASS][176] -> [DMESG-WARN][177] ([i915#10166] / [i915#1982])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-9/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-2/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([fdo#110189] / [i915#9723])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-17/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][179] ([fdo#109271] / [fdo#110189])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-vga-1.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#3555]) +10 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][181] ([i915#3555] / [i915#8812])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-8/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#3840])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-1/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#3555] / [i915#3840])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#3555] / [i915#3840])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-5/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#3840] / [i915#9053])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#3469])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#4854])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#1839]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@kms_feature_discovery@display-2x.html
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#1839])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-18/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@psr1:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#658])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-tglu:         NOTRUN -> [SKIP][191] ([fdo#109274] / [i915#3637]) +2 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-2/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#8381])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-7/igt@kms_flip@2x-flip-vs-fences-interruptible.html
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#8381])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([fdo#109274]) +8 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-mtlp:         NOTRUN -> [SKIP][195] ([i915#3637]) +3 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-4/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([fdo#111825] / [i915#9934])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-13/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#2587] / [i915#2672])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#3555] / [i915#8810]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#2672]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#2672]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#2672]) +6 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#2587] / [i915#2672])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#2672] / [i915#3555])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-tglu:         NOTRUN -> [SKIP][204] ([fdo#109285])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-9/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#5274])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#5274])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-dg2:          NOTRUN -> [FAIL][207] ([i915#6880])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#8708]) +21 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#1825]) +15 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-snb:          [PASS][210] -> [SKIP][211] ([fdo#109271]) +12 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][212] ([i915#8708]) +2 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#3023]) +19 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([fdo#111825]) +7 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-dg1:          NOTRUN -> [SKIP][215] ([fdo#111825]) +9 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][216] ([fdo#111825] / [i915#1825]) +26 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([fdo#109280]) +6 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#8708]) +3 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#10055]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][220] ([fdo#110189]) +4 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([fdo#111767] / [i915#5354])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
    - shard-dg1:          NOTRUN -> [SKIP][222] ([fdo#111767] / [fdo#111825])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#3458]) +26 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#3458]) +3 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#3555] / [i915#8228])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-13/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@static-swap:
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#3555] / [i915#8228])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-6/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#3555] / [i915#8228]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#3555] / [i915#8228]) +2 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#4816])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#6301])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][231] ([fdo#109289])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-8/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-mtlp:         NOTRUN -> [SKIP][232] ([fdo#109289]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-2/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#3555] / [i915#8821])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#9423]) +3 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#9423]) +5 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#9423]) +11 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#5176]) +7 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#5176] / [i915#9423]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#9423]) +11 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-12/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#5235] / [i915#9423] / [i915#9728]) +3 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#5235]) +3 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#5235]) +6 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#3555] / [i915#5235])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#5235]) +9 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#5235] / [i915#9423]) +15 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#10139])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-5/igt@kms_pm_dc@dc6-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#5978])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@kms_pm_dc@dc6-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#3361])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#9519]) +3 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#9519])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][251] -> [SKIP][252] ([i915#9519]) +3 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglu:         NOTRUN -> [SKIP][253] ([fdo#109293] / [fdo#109506])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-2/igt@kms_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#6524] / [i915#6805])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@kms_prime@basic-crc-hybrid.html
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#6524])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-12/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([fdo#110189]) +3 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([fdo#110189]) +2 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#9685])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#4235])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][260] ([i915#5289])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([fdo#111615] / [i915#5289])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#4235] / [i915#5190]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-mtlp:         NOTRUN -> [SKIP][263] ([i915#4235])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-1/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@basic@pipe-a-vga-1-pipe-b-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][264] ([i915#5465]) +3 other tests fail
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb7/igt@kms_setmode@basic@pipe-a-vga-1-pipe-b-hdmi-a-1.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#3555] / [i915#8823])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#8623])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([fdo#109309])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@kms_tv_load_detect@load-detect.html
    - shard-dg1:          NOTRUN -> [SKIP][268] ([fdo#109309])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-18/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [FAIL][269] ([i915#9196])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][270] ([fdo#109271]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb7/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-b-vga-1.html

  * igt@kms_writeback@writeback-check-output:
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#2437])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#2437])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#2437] / [i915#9412])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@kms_writeback@writeback-pixel-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#2437] / [i915#9412])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-4/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#2436] / [i915#7387])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-mtlp:         [PASS][276] -> [FAIL][277] ([i915#4349])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-mtlp-4/igt@perf_pmu@busy-double-start@rcs0.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-6/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#8516])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#8516])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-2/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#3291] / [i915#3708])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][281] ([fdo#109295] / [fdo#111656] / [i915#3708])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@prime_vgem@coherency-gtt.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#9917])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-4/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#9917])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([fdo#109307])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@tools_test@sysfs_l3_parity.html
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#4818])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@tools_test@sysfs_l3_parity.html

  * igt@v3d/v3d_job_submission@array-job-submission:
    - shard-rkl:          NOTRUN -> [SKIP][286] ([fdo#109315]) +7 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-1/igt@v3d/v3d_job_submission@array-job-submission.html

  * igt@v3d/v3d_mmap@mmap-bad-flags:
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#2575]) +2 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-16/igt@v3d/v3d_mmap@mmap-bad-flags.html

  * igt@v3d/v3d_perfmon@destroy-invalid-perfmon:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([fdo#109315] / [i915#2575]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-7/igt@v3d/v3d_perfmon@destroy-invalid-perfmon.html

  * igt@v3d/v3d_submit_cl@valid-submission:
    - shard-mtlp:         NOTRUN -> [SKIP][289] ([i915#2575]) +5 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-6/igt@v3d/v3d_submit_cl@valid-submission.html

  * igt@v3d/v3d_submit_csd@single-out-sync:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#2575]) +15 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@v3d/v3d_submit_csd@single-out-sync.html

  * igt@vc4/vc4_create_bo@create-bo-4096:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#7711]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-13/igt@vc4/vc4_create_bo@create-bo-4096.html

  * igt@vc4/vc4_purgeable_bo@free-purged-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][292] ([i915#7711]) +3 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-5/igt@vc4/vc4_purgeable_bo@free-purged-bo.html

  * igt@vc4/vc4_tiling@get-after-free:
    - shard-tglu:         NOTRUN -> [SKIP][293] ([i915#2575]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-2/igt@vc4/vc4_tiling@get-after-free.html

  * igt@vc4/vc4_tiling@get-bad-flags:
    - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#7711]) +7 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-3/igt@vc4/vc4_tiling@get-bad-flags.html

  * igt@vc4/vc4_tiling@set-get:
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#7711]) +12 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@vc4/vc4_tiling@set-get.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [FAIL][296] ([i915#7742]) -> [PASS][297]
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-5/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [INCOMPLETE][298] ([i915#7297]) -> [PASS][299]
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglu:         [FAIL][300] ([i915#6268]) -> [PASS][301]
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-6/igt@gem_ctx_exec@basic-nohangcheck.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-5/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [FAIL][302] ([i915#5784]) -> [PASS][303]
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-dg1-17/igt@gem_eio@reset-stress.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-18/igt@gem_eio@reset-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          [FAIL][304] ([i915#2846]) -> [PASS][305]
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-3/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [FAIL][306] ([i915#2842]) -> [PASS][307]
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-glk9/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-glk9/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-rkl:          [FAIL][308] ([i915#2842]) -> [PASS][309] +1 other test pass
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-rkl-1/igt@gem_exec_fair@basic-pace@vecs0.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-5/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [INCOMPLETE][310] ([i915#9275]) -> [PASS][311]
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-dg2-6/igt@gem_exec_suspend@basic-s0@smem.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [INCOMPLETE][312] ([i915#10137] / [i915#5566]) -> [PASS][313]
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-glk3/igt@gen9_exec_parse@allowed-all.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-glk2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [INCOMPLETE][314] ([i915#10137] / [i915#9200] / [i915#9849]) -> [PASS][315]
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         [INCOMPLETE][316] ([i915#10137] / [i915#9200]) -> [PASS][317]
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-4/igt@i915_module_load@reload-with-fault-injection.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          [INCOMPLETE][318] ([i915#10137] / [i915#9820] / [i915#9849]) -> [PASS][319]
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-dg2-10/igt@i915_module_load@reload-with-fault-injection.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         [FAIL][320] ([i915#3743]) -> [PASS][321]
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [FAIL][322] ([i915#2346]) -> [PASS][323]
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - shard-tglu:         [DMESG-WARN][324] ([i915#10166]) -> [PASS][325]
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-5/igt@kms_cursor_legacy@torture-bo@pipe-a.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-8/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-snb:          [SKIP][326] ([fdo#109271]) -> [PASS][327] +8 other tests pass
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [SKIP][328] ([i915#4281]) -> [PASS][329]
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-8/igt@kms_pm_dc@dc9-dpms.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-4/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][330] ([i915#9519]) -> [PASS][331]
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][332] ([i915#9196]) -> [PASS][333]
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-mtlp:         [FAIL][334] ([i915#4349]) -> [PASS][335]
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-mtlp-4/igt@perf_pmu@busy-double-start@ccs0.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-6/igt@perf_pmu@busy-double-start@ccs0.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
    - shard-tglu:         [FAIL][336] ([i915#3591]) -> [WARN][337] ([i915#2681]) +1 other test warn
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
    - shard-tglu:         [WARN][338] ([i915#2681]) -> [FAIL][339] ([i915#3591])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * igt@kms_content_protection@mei-interface:
    - shard-snb:          [INCOMPLETE][340] ([i915#9878]) -> [SKIP][341] ([fdo#109271])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-snb7/igt@kms_content_protection@mei-interface.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb6/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-snb:          [SKIP][342] ([fdo#109271]) -> [INCOMPLETE][343] ([i915#8816])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-snb1/igt@kms_content_protection@type1.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb7/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-snb:          [INCOMPLETE][344] ([i915#8816]) -> [SKIP][345] ([fdo#109271])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-snb7/igt@kms_content_protection@uevent.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb4/igt@kms_content_protection@uevent.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          [SKIP][346] ([i915#3955]) -> [SKIP][347] ([fdo#110189] / [i915#3955])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-rkl-4/igt@kms_fbcon_fbt@psr.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@kms_fbcon_fbt@psr.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-snb:          [SKIP][348] ([fdo#109271] / [fdo#111767]) -> [SKIP][349] ([fdo#109271])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-snb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          [SKIP][350] ([i915#4281]) -> [SKIP][351] ([i915#3361])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-rkl-5/igt@kms_pm_dc@dc9-dpms.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-tglu:         [SKIP][352] ([i915#9683]) -> [SKIP][353] ([fdo#110189]) +6 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-8/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-dg1:          [SKIP][354] ([i915#9683]) -> [SKIP][355] ([fdo#110189]) +5 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-dg1-16/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-18/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-dg2:          [SKIP][356] ([i915#9683]) -> [SKIP][357] ([fdo#110189]) +9 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-dg2-10/igt@kms_psr2_sf@cursor-plane-update-sf.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@kms_psr2_sf@cursor-plane-update-sf.html
    - shard-rkl:          [SKIP][358] ([fdo#111068] / [i915#9683]) -> [SKIP][359] ([fdo#110189]) +4 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-rkl-3/igt@kms_psr2_sf@cursor-plane-update-sf.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-5/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          [SKIP][360] ([i915#9683]) -> [SKIP][361] ([fdo#110189]) +3 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-rkl-7/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-1/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-tglu:         [SKIP][362] ([fdo#111068] / [i915#9683]) -> [SKIP][363] ([fdo#110189]) +5 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-7/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-10/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-glk:          [SKIP][364] ([fdo#109271]) -> [SKIP][365] ([fdo#109271] / [fdo#110189]) +12 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-glk9/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-glk8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-dg1:          [SKIP][366] ([fdo#111068] / [i915#9683]) -> [SKIP][367] ([fdo#110189]) +5 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-dg1-15/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-13/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-snb:          [SKIP][368] ([fdo#109271]) -> [SKIP][369] ([fdo#109271] / [fdo#110189]) +12 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-snb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          [CRASH][370] ([i915#9351]) -> [INCOMPLETE][371] ([i915#5493])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-dg2-2/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#10031]: https://gitlab.freedesktop.org/drm/intel/issues/10031
  [i915#10055]: https://gitlab.freedesktop.org/drm/intel/issues/10055
  [i915#10137]: https://gitlab.freedesktop.org/drm/intel/issues/10137
  [i915#10139]: https://gitlab.freedesktop.org/drm/intel/issues/10139
  [i915#10166]: https://gitlab.freedesktop.org/drm/intel/issues/10166
  [i915#10278]: https://gitlab.freedesktop.org/drm/intel/issues/10278
  [i915#10282]: https://gitlab.freedesktop.org/drm/intel/issues/10282
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
  [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#5138]:

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/index.html

--===============6573535220723126575==
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
<tr><td><b>Series:</b></td><td>extend psr2_sf test for pr_sf (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129004/">https://patchwork.freedesktop.org/series/129004/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7717_full -&gt; IGTPW_10696_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10696_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10696_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/index.html</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10696_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1} (NEW):</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-1/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1.html">SKIP</a> +23 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_async_flips@test-cursor:<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-mtlp-7/igt@kms_async_flips@test-cursor.html">SKIP</a> ([i915#6229]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-4/igt@kms_async_flips@test-cursor.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7717_full and IGTPW_10696_full:</p>
<h3>New IGT tests (50)</h3>
<ul>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf@psr2-pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf@psr2-pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf@psr2-pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf@psr2-pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf@psr2-pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf@psr2-pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf@psr2-pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf@psr2-pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf@psr2-pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf@psr2-pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf@psr2-pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf@psr2-pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf@psr2-pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf@psr2-pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-update-sf@psr2-pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-update-sf@psr2-pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf@psr2-pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf@psr2-pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf@psr2-pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf@psr2-pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf@psr2-pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf@psr2-pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf@psr2-pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf@psr2-pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area@psr2-pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area@a-pipe-psr2-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area@b-pipe-psr2-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf@psr2-pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [17.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf@psr2-pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [17.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf@psr2-pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [12.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf@psr2-pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [12.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf@psr2-pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf@psr2-pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf@psr2-pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf@psr2-pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area@psr2-pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area@a-pipe-psr2-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area@b-pipe-psr2-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area@psr2-pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area@psr2-pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb@psr2-pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb@psr2-pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area@psr2-pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.82] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10696_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-7/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-3/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#7701])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-7/igt@drm_fdinfo@virtual-busy.html">SKIP</a> ([i915#8414])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@drm_fdinfo@virtual-busy-all.html">SKIP</a> ([i915#8414]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3936">i915#3936</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-3/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10137">i915#10137</a> / [i915#7297])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> ([i915#6335])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> ([i915#6268])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-5/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109314">fdo#109314</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109314">fdo#109314</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-5/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109314">fdo#109314</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-15/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-4/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-3/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-dg2-1/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-4/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-6/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> ([i915#6344])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@many-4k-incremental:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-2/igt@gem_exec_capture@many-4k-incremental.html">FAIL</a> ([i915#9606])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-5/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-13/igt@gem_exec_fair@basic-pace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-1/igt@gem_exec_fair@basic-pace-share.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4473">i915#4473</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-7/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-10/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@gem_exec_fair@basic-throttle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@gem_exec_fence@submit67.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@gem_exec_flush@basic-uc-ro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-17/igt@gem_exec_flush@basic-wb-ro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@gem_exec_params@secure-non-root.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@gem_exec_reloc@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-19/igt@gem_exec_reloc@basic-gtt-read-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-scanout:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@gem_exec_reloc@basic-scanout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-5/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-glk2/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/284">i915#284</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-5/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-object:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-17/igt@gem_mmap@bad-object.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@gem_mmap_gtt@basic-small-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-write-read:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-7/igt@gem_mmap_gtt@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@coherency:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-1/igt@gem_mmap_wc@coherency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-prefaulted:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@gem_mmap_wc@write-prefaulted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-13/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-6/igt@gem_pxp@verify-pxp-stale-buf-execution.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@new-obj:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-12/igt@gem_readwrite@new-obj.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-bad-handle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-5/igt@gem_readwrite@read-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html">SKIP</a> ([i915#5190]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-4/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#8428]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-6/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-16/igt@gem_tiled_partial_pwrite_pread@writes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-3/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-2/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-15/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@gen3_render_tiledx_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-1/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-19/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-6/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-9/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@i915_fb_tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-snb6/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb2/igt@i915_module_load@reload.html">INCOMPLETE</a> ([i915#9849])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-dg2-10/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> ([i915#9407])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109293">fdo#109293</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> ([i915#6621]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@i915_pm_rps@thresholds-idle-park@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-5/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-6/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109303">fdo#109303</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-rkl-5/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-4/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10031">i915#10031</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-4/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> ([i915#7443])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs.html">SKIP</a> ([i915#8709]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs.html">SKIP</a> ([i915#8709]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-8/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / [i915#5286]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">SKIP</a> ([i915#5286]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / [i915#5286]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-1/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / [i915#5190]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-7/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-4/igt@kms_ccs@pipe-a-crc-primary-basic-y-tiled-ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@kms_ccs@pipe-b-crc-primary-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> ([i915#5354]) +96 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-3/igt@kms_ccs@pipe-b-random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> ([i915#5354] / [i915#6095]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-glk2/igt@kms_ccs@pipe-d-bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-yf-tiled-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-5/igt@kms_ccs@pipe-d-bad-rotation-90-yf-tiled-ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-15/igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-3/igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> ([i915#5354]) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-4/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a> ([i915#7828]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-15/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-5/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-5/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> ([i915#7828]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> ([i915#7828]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-18/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> ([i915#7828]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> ([i915#7828]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-4/igt@kms_content_protection@content-type-change.html">SKIP</a> ([i915#6944] / [i915#9424])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@kms_content_protection@content-type-change.html">SKIP</a> ([i915#9424])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-5/igt@kms_content_protection@content-type-change.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-4/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> ([i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-16/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +1 other test skip</li>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-snb7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> ([i915#9809])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / [i915#5354]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-9/igt@kms_cursor_legacy@torture-move@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-2/igt@kms_cursor_legacy@torture-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10166">i915#10166</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-17/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / [i915#9723])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-8/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-1/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-5/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a> / [i915#9053])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1839">i915#1839</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-18/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-1/igt@kms_feature_discovery@psr1.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-2/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-7/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-4/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-13/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / [i915#9934])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8810]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-9/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> ([i915#5274])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> ([i915#5274])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">FAIL</a> ([i915#6880])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10055">i915#10055</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / [i915#5354])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-13/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-6/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8228]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4816">i915#4816</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-1/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-8/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-2/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#9423]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#9423]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3.html">SKIP</a> ([i915#9423]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b-edp-1.html">SKIP</a> ([i915#5176]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5176] / [i915#9423]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-12/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#9423]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-2.html">SKIP</a> ([i915#5235] / [i915#9423] / [i915#9728]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-3.html">SKIP</a> ([i915#5235]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1.html">SKIP</a> ([i915#5235]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#5235])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5235]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#5235] / [i915#9423]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-5/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10139">i915#10139</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> ([i915#5978])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3361">i915#3361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#9519]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-2/igt@kms_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109293">fdo#109293</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524] / [i915#6805])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-12/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / [i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a> / [i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-1/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-vga-1-pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb7/igt@kms_setmode@basic@pipe-a-vga-1-pipe-b-hdmi-a-1.html">FAIL</a> ([i915#5465]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8823])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-18/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> ([i915#9196])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb7/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-b-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a> / [i915#9412])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-4/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a> / [i915#9412])</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2436">i915#2436</a> / [i915#7387])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-mtlp-4/igt@perf_pmu@busy-double-start@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-6/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@perf_pmu@rc6-all-gts.html">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-2/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-7/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111656">fdo#111656</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-4/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109307">fdo#109307</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4818">i915#4818</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_job_submission@array-job-submission:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-1/igt@v3d/v3d_job_submission@array-job-submission.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_mmap@mmap-bad-flags:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-16/igt@v3d/v3d_mmap@mmap-bad-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@destroy-invalid-perfmon:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-7/igt@v3d/v3d_perfmon@destroy-invalid-perfmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@valid-submission:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-6/igt@v3d/v3d_submit_cl@valid-submission.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@single-out-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@v3d/v3d_submit_csd@single-out-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_create_bo@create-bo-4096:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-13/igt@vc4/vc4_create_bo@create-bo-4096.html">SKIP</a> ([i915#7711]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@free-purged-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-5/igt@vc4/vc4_purgeable_bo@free-purged-bo.html">SKIP</a> ([i915#7711]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-after-free:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-2/igt@vc4/vc4_tiling@get-after-free.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-bad-flags:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-3/igt@vc4/vc4_tiling@get-bad-flags.html">SKIP</a> ([i915#7711]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@set-get:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-10/igt@vc4/vc4_tiling@set-get.html">SKIP</a> ([i915#7711]) +12 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">FAIL</a> ([i915#7742]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-5/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> ([i915#7297]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-6/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> ([i915#6268]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-5/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-dg1-17/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-18/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-3/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-glk9/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-glk9/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-rkl-1/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-5/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-dg2-6/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> ([i915#9275]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-1/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-glk3/igt@gen9_exec_parse@allowed-all.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10137">i915#10137</a> / [i915#5566]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-glk2/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10137">i915#10137</a> / [i915#9200] / [i915#9849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-4/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10137">i915#10137</a> / [i915#9200]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-dg2-10/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10137">i915#10137</a> / [i915#9820] / [i915#9849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-5/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-a:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-5/igt@kms_cursor_legacy@torture-bo@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10166">i915#10166</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-8/igt@kms_cursor_legacy@torture-bo@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-8/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-4/igt@kms_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#9196]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-mtlp-4/igt@perf_pmu@busy-double-start@ccs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-mtlp-6/igt@perf_pmu@busy-double-start@ccs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-snb7/igt@kms_content_protection@mei-interface.html">INCOMPLETE</a> ([i915#9878]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb6/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-snb1/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb7/igt@kms_content_protection@type1.html">INCOMPLETE</a> ([i915#8816])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-snb7/igt@kms_content_protection@uevent.html">INCOMPLETE</a> ([i915#8816]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb4/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-rkl-4/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-2/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-snb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-rkl-5/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3361">i915#3361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-8/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> ([i915#9683]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-dg1-16/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> ([i915#9683]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-18/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-dg2-10/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> ([i915#9683]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-6/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +9 other tests skip</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-rkl-3/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / [i915#9683]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-5/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-rkl-7/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#9683]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-rkl-1/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-tglu-7/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / [i915#9683]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-tglu-10/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-glk9/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-glk8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-dg1-15/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / [i915#9683]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg1-13/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-snb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-snb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7717/shard-dg2-2/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">CRASH</a> ([i915#9351]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/shard-dg2-2/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">INCOMPLETE</a> ([i915#5493])</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<p>[i915#5138]:</p>

</body>
</html>

--===============6573535220723126575==--
