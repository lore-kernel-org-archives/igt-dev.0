Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC6BE7716F
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 21:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06F710E590;
	Wed,  4 Dec 2024 21:25:22 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96B410E590;
 Wed,  4 Dec 2024 21:25:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Add_test_for_configurabl?=
 =?utf-8?q?e_OA_buffer_size?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sai Teja Pottumuttu" <sai.teja.pottumuttu@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 04 Dec 2024 21:25:21 -0000
Message-ID: <173334752168.2687342.5296722079576541537@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241204161606.363295-1-sai.teja.pottumuttu@intel.com>
In-Reply-To: <20241204161606.363295-1-sai.teja.pottumuttu@intel.com>
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

Series: Add test for configurable OA buffer size
URL   : https://patchwork.freedesktop.org/series/142128/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15788_full -> IGTPW_12246_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12246_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12246_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/index.html

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): shard-dg2-set2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12246_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-snb:          NOTRUN -> [ABORT][1] +5 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-snb1/igt@gem_ctx_isolation@preservation-s3@rcs0.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][2] +3 other tests incomplete
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-glk2/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         NOTRUN -> [ABORT][3] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-6/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-1/igt@gem_tiled_swapping@non-threaded.html
    - shard-glk:          NOTRUN -> [ABORT][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-glk8/igt@gem_tiled_swapping@non-threaded.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-y-rc-ccs-cc} (NEW):
    - shard-dg1:          NOTRUN -> [SKIP][6] +7 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-13/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs (NEW):
    - shard-rkl:          NOTRUN -> [SKIP][7] +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-3/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-4-rc-ccs-cc (NEW):
    - shard-dg2:          NOTRUN -> [SKIP][8] +11 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-4-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-4-mc-ccs (NEW):
    - shard-mtlp:         NOTRUN -> [SKIP][9] +12 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-8/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs (NEW):
    - shard-tglu:         NOTRUN -> [SKIP][10] +7 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-6/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         NOTRUN -> [DMESG-FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15788_full and IGTPW_12246_full:

### New IGT tests (108) ###

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.73] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.14] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.24] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.13] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-linear:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.09, 2.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-x:
    - Statuses : 4 pass(s)
    - Exec time: [2.05, 2.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y:
    - Statuses : 2 pass(s)
    - Exec time: [2.09, 2.58] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.63] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.57] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-yf-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.67] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-linear:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.17, 2.07] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-x:
    - Statuses : 2 pass(s)
    - Exec time: [2.07, 2.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-y:
    - Statuses : 2 pass(s)
    - Exec time: [2.13, 2.56] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-y-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.60] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.13] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.13] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.57] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-yf-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.64] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-y:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.27] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.75] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.12] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-linear:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.09, 2.13] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-x:
    - Statuses : 4 pass(s)
    - Exec time: [2.03, 2.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y:
    - Statuses : 2 pass(s)
    - Exec time: [2.08, 2.55] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.60] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.55] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-yf-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.67] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-linear:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.15, 2.05] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-x:
    - Statuses : 2 pass(s)
    - Exec time: [2.05, 2.13] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y:
    - Statuses : 2 pass(s)
    - Exec time: [2.09, 2.53] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.58] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.13] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.12] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.55] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-yf-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.68] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-3-y:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-3-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.22] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-3-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.73] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.14] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.14] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.12] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-linear:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.14, 2.13] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-x:
    - Statuses : 3 pass(s)
    - Exec time: [2.03, 2.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-y:
    - Statuses : 2 pass(s)
    - Exec time: [2.08, 2.54] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.62] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-linear:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.13] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-y:
    - Statuses : 1 pass(s)
    - Exec time: [2.53] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.64] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-3-y:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-3-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.25] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-3-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.78] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.14] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.12] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-linear:
    - Statuses : 2 pass(s)
    - Exec time: [2.03, 2.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-x:
    - Statuses : 2 pass(s)
    - Exec time: [2.03, 2.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-3-y:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-3-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.24] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-3-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-a-hdmi-a-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.08, 0.23] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-b-hdmi-a-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.06, 0.23] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-c-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.18] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.77] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-d-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  

Known issues
------------

  Here are the changes found in IGTPW_12246_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#8411]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-17/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#8411]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-5/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#8411]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-7/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#8411]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-1/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-mtlp:         NOTRUN -> [SKIP][16] ([i915#9318])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-7/igt@debugfs_test@basic-hwmon.html
    - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#9318])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-2/igt@debugfs_test@basic-hwmon.html
    - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#9318])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-7/igt@debugfs_test@basic-hwmon.html

  * igt@drm_fdinfo@virtual-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#8414]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-6/igt@drm_fdinfo@virtual-busy.html

  * igt@drm_fdinfo@virtual-busy-hang:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#8414]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-4/igt@drm_fdinfo@virtual-busy-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#8414]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-13/igt@drm_fdinfo@virtual-busy-hang.html

  * igt@gem_caching@read-writes:
    - shard-mtlp:         NOTRUN -> [SKIP][22] ([i915#4873])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-3/igt@gem_caching@read-writes.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#9323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#9323])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#9323])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-18/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-tglu:         NOTRUN -> [SKIP][26] ([i915#9323])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ctx_persistence@file:
    - shard-snb:          NOTRUN -> [SKIP][27] ([i915#1099]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-snb5/igt@gem_ctx_persistence@file.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#8555]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-close.html
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#8555]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-5/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#8555]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-2/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#280])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-4/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@reset-stress:
    - shard-snb:          NOTRUN -> [FAIL][32] ([i915#8898])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-snb5/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-chain:
    - shard-rkl:          NOTRUN -> [ABORT][33] ([i915#13218]) +25 other tests abort
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-2/igt@gem_exec_balancer@bonded-chain.html

  * igt@gem_exec_balancer@nohangcheck:
    - shard-tglu:         NOTRUN -> [ABORT][34] ([i915#13218]) +27 other tests abort
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-3/igt@gem_exec_balancer@nohangcheck.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#4525])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-3/igt@gem_exec_balancer@parallel-keep-in-fence.html
    - shard-tglu:         NOTRUN -> [SKIP][36] ([i915#4525])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-3/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_balancer@waits:
    - shard-dg1:          NOTRUN -> [ABORT][37] ([i915#13218]) +22 other tests abort
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-17/igt@gem_exec_balancer@waits.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#6334]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-3/igt@gem_exec_capture@capture-invisible.html
    - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#6334]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-4/igt@gem_exec_capture@capture-invisible.html
    - shard-tglu:         NOTRUN -> [SKIP][40] ([i915#6334]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-10/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][41] ([i915#6334]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-glk4/igt@gem_exec_capture@capture-invisible@smem0.html
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#6334]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-4/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#6344])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-7/igt@gem_exec_capture@capture-recoverable.html
    - shard-tglu-1:       NOTRUN -> [SKIP][44] ([i915#6344])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-1/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fence@submit67:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4812])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-11/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#3711])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-4/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#3539] / [i915#4852]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-4/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#3539] / [i915#4852]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-18/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#3281]) +7 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-2/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-wc:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#3281]) +8 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-11/igt@gem_exec_reloc@basic-wc.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#3281]) +8 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-18/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_reloc@basic-wc-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][52] ([i915#3281]) +10 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-4/igt@gem_exec_reloc@basic-wc-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4812])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-14/igt@gem_exec_schedule@preempt-queue.html
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4537] / [i915#4812])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-2/igt@gem_exec_schedule@preempt-queue.html
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4537] / [i915#4812])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-2/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@thriceslice:
    - shard-snb:          NOTRUN -> [SKIP][56] +474 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-snb1/igt@gem_exec_schedule@thriceslice.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#4860])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-13/igt@gem_fence_thrash@bo-write-verify-none.html
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#4860])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-3/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#4613]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-10/igt@gem_lmem_swapping@heavy-random.html
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4613]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-4/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#4613]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
    - shard-tglu-1:       NOTRUN -> [SKIP][62] ([i915#4613])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#12193])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4565])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][65] ([i915#4613]) +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-glk9/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4077]) +8 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-11/igt@gem_mmap_gtt@fault-concurrent-x.html
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4077]) +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-12/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gem_mmap_wc@bad-size:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4083]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-7/igt@gem_mmap_wc@bad-size.html
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4083]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-17/igt@gem_mmap_wc@bad-size.html

  * igt@gem_mmap_wc@set-cache-level:
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#4083]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-6/igt@gem_mmap_wc@set-cache-level.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#3282]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-11/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#3282]) +5 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-2/igt@gem_pwrite@basic-exhaustion.html
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#3282]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-14/igt@gem_pwrite@basic-exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][74] ([i915#2658])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-snb4/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pwrite@basic-self:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#3282]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-8/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][76] ([i915#12964]) +1 other test timeout
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-1/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#13033])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-3/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          NOTRUN -> [TIMEOUT][78] ([i915#12917] / [i915#12964]) +4 other tests timeout
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-3/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4270]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-11/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#4270]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-18/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#8428]) +5 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-7/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#5190] / [i915#8428]) +9 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-1/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#4885])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-7/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4885])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-17/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#4885])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-5/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_pread_basic:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#4079]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-5/igt@gem_tiled_pread_basic.html
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#4079]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-7/igt@gem_tiled_pread_basic.html
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#4079])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-17/igt@gem_tiled_pread_basic.html

  * igt@gem_tiling_max_stride:
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#4077]) +9 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-6/igt@gem_tiling_max_stride.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#3297])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#3297] / [i915#4880])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#3297] / [i915#4880])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#2856]) +4 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-4/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#2527]) +5 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-1/igt@gen9_exec_parse@bb-chained.html
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#2527]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-12/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#2856]) +5 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-1/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#2527] / [i915#2856]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-6/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#8399])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-3/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          NOTRUN -> [INCOMPLETE][99] ([i915#12797])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-glk8/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@engine-order:
    - shard-snb:          NOTRUN -> [ABORT][100] ([i915#13218]) +9 other tests abort
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-snb4/igt@i915_pm_rps@engine-order.html

  * igt@i915_pm_rps@reset:
    - shard-mtlp:         NOTRUN -> [FAIL][101] ([i915#8346])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-5/igt@i915_pm_rps@reset.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-mtlp:         NOTRUN -> [SKIP][102] ([i915#6188])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-7/igt@i915_query@query-topology-coherent-slice-mask.html
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#6188])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-4/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#7707])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-2/igt@intel_hwmon@hwmon-read.html
    - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#7707])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-4/igt@intel_hwmon@hwmon-read.html
    - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#7707])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-5/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#4215])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-12/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#4212])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#4215] / [i915#5190])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-4/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_async_flips@crc:
    - shard-rkl:          [PASS][110] -> [DMESG-WARN][111] ([i915#12964]) +4 other tests dmesg-warn
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-rkl-3/igt@kms_async_flips@crc.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-4/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@test-cursor:
    - shard-mtlp:         NOTRUN -> [SKIP][112] ([i915#10333])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-5/igt@kms_async_flips@test-cursor.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#5286]) +8 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#4538] / [i915#5286]) +5 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-14/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#5286]) +7 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-3/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#5286])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-13/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][117] +23 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-6/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#3638]) +3 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-1/igt@kms_big_fb@linear-64bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#3638]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-14/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][120] +10 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-7/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#4538] / [i915#5190]) +11 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-glk:          NOTRUN -> [SKIP][122] +292 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-glk9/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#5190]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#4538]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#6095]) +89 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-14/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][126] ([i915#6095]) +94 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-10/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#12313])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#12313])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
    - shard-tglu-1:       NOTRUN -> [SKIP][129] ([i915#12313])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#12313])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-17/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][131] ([i915#12313])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#10307] / [i915#6095]) +81 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][133] ([i915#12805])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#12805])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][135] ([i915#12805])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#12805])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#12805])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#6095]) +59 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#6095]) +9 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-11/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][140] ([i915#12796]) +1 other test incomplete
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-glk4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#10307] / [i915#10434] / [i915#6095])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#6095]) +89 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#7828]) +6 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-7/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
    - shard-mtlp:         NOTRUN -> [SKIP][144] ([i915#7828]) +7 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-7/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#7828]) +7 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-3/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#7828]) +5 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#7828]) +7 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
    - shard-tglu-1:       NOTRUN -> [SKIP][148] ([i915#7828]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#3116] / [i915#3299])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-2/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#3299])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-3/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#3299])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-6/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#3116])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-2/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#7118] / [i915#9424])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-6/igt@kms_content_protection@type1.html
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#7118] / [i915#9424])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-2/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#7116] / [i915#9424])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-14/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#3555]) +4 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#3555]) +3 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-6/igt@kms_cursor_crc@cursor-random-32x10.html
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#3555] / [i915#8814]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-2/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][159] ([i915#8814]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-6/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][160] +23 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#9809]) +4 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [PASS][162] -> [FAIL][163] ([i915#2346])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-snb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#4213])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#4103] / [i915#4213])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#4103] / [i915#4213])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-13/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#4103]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#4103]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#8588])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-1/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#8588])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-1/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#8588])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-18/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#3555] / [i915#3840])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-11/igt@kms_dsc@dsc-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#3555] / [i915#3840])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-5/igt@kms_dsc@dsc-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#3555] / [i915#3840])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-12/igt@kms_dsc@dsc-basic.html
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#3555] / [i915#3840])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-5/igt@kms_dsc@dsc-basic.html
    - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#3555] / [i915#3840] / [i915#9159])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-4/igt@kms_dsc@dsc-basic.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][177] ([i915#9878])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-glk9/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#1839])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-11/igt@kms_feature_discovery@display-3x.html
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#1839])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-5/igt@kms_feature_discovery@display-3x.html
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#1839])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-17/igt@kms_feature_discovery@display-3x.html
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#1839])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-6/igt@kms_feature_discovery@display-3x.html
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#1839])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-2/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#3637]) +4 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-6/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#9934]) +7 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-7/igt@kms_flip@2x-flip-vs-fences-interruptible.html
    - shard-tglu-1:       NOTRUN -> [SKIP][185] ([i915#3637])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-1/igt@kms_flip@2x-flip-vs-fences-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#8381])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#8381])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-3/igt@kms_flip@2x-flip-vs-fences-interruptible.html
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#8381])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-5/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#9934]) +5 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-14/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#3637]) +4 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#9934]) +5 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-11/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#2672] / [i915#3555]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#2672] / [i915#3555])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#2672]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#2672]) +2 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#2672] / [i915#3555] / [i915#8813]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#2587] / [i915#2672] / [i915#3555])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#2587] / [i915#2672]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#2672] / [i915#3555])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#2587] / [i915#2672])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#2672] / [i915#8813])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#8708]) +9 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][204] +67 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#1825]) +26 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#8708]) +21 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#1825]) +35 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#3023]) +18 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#10433] / [i915#3458])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][210] +32 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#5354]) +34 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-tglu-1:       NOTRUN -> [SKIP][212] +12 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#3458]) +7 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#3458]) +8 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#8708]) +17 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch:
    - shard-tglu:         NOTRUN -> [SKIP][216] ([i915#3555] / [i915#8228]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-10/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#12713])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-14/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#12713])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-10/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-mtlp:         NOTRUN -> [SKIP][219] ([i915#3555] / [i915#8228])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-2/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#3555] / [i915#8228]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-11/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#3555] / [i915#8228]) +2 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-5/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#3555] / [i915#8228])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-17/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#4816])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#6301]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-4/igt@kms_panel_fitting@atomic-fastset.html
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#6301]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-10/igt@kms_panel_fitting@atomic-fastset.html
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#6301]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-2/igt@kms_panel_fitting@atomic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#6301])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-18/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-snb:          NOTRUN -> [ABORT][228] ([i915#13242]) +4 other tests abort
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-snb2/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#11614] / [i915#3582]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-7/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][230] ([i915#10226] / [i915#11614] / [i915#3582]) +2 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-7/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#3555] / [i915#8821])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-8/igt@kms_plane_lowres@tiling-y.html
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#8821])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-4/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][233] ([i915#12247]) +20 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#12247] / [i915#6953] / [i915#9423]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#12247] / [i915#6953]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
    - shard-tglu-1:       NOTRUN -> [SKIP][236] ([i915#12247] / [i915#6953])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#12247] / [i915#6953])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-17/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#12247]) +3 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html
    - shard-tglu-1:       NOTRUN -> [SKIP][239] ([i915#12247]) +3 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html
    - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#12247]) +3 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-17/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#12247] / [i915#6953]) +2 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#12247] / [i915#6953])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#12247]) +7 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][244] ([i915#12247]) +3 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#6953])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#5354]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-5/igt@kms_pm_backlight@basic-brightness.html
    - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#5354]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-14/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#9812]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-2/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-mtlp:         NOTRUN -> [ABORT][249] ([i915#10159] / [i915#13218]) +2 other tests abort
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-3/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#9293])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-4/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#9685])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-2/igt@kms_pm_dc@dc5-psr.html
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#9685])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-14/igt@kms_pm_dc@dc5-psr.html
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#9685])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-9/igt@kms_pm_dc@dc5-psr.html
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#9685])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#8430])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-3/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#8430])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-13/igt@kms_pm_lpsp@screens-disabled.html
    - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#8430])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-3/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#8430])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-7/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#9519])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#9519]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#9519]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@pm-caching:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][262] ([i915#12964]) +26 other tests dmesg-warn
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-3/igt@kms_pm_rpm@pm-caching.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#6524] / [i915#6805])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-3/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-mtlp:         NOTRUN -> [SKIP][264] ([i915#12316]) +5 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-2/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#9808]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#11520]) +2 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-5/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#11520]) +5 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#11520]) +3 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-18/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#11520]) +5 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
    - shard-tglu-1:       NOTRUN -> [SKIP][270] ([i915#11520])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-1/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-snb:          NOTRUN -> [SKIP][271] ([i915#11520]) +9 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-snb1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][272] ([i915#11520]) +4 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-glk3/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#9683])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#9683])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#9688]) +18 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-4/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#1072] / [i915#9732]) +23 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-1/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#9732]) +21 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-2/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-primary-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][278] ([i915#4077] / [i915#9688]) +5 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-4/igt@kms_psr@psr2-primary-mmap-gtt@edp-1.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][279] ([i915#9732]) +2 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#1072] / [i915#9732]) +20 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-17/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr@psr2-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][281] ([i915#1072] / [i915#9732]) +26 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-4/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-mtlp:         NOTRUN -> [SKIP][282] ([i915#12755]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-7/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#12755])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-4/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#5289]) +2 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-dg1:          NOTRUN -> [SKIP][285] ([i915#5289]) +2 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-14/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#12755] / [i915#5190]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#5289])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#3555]) +3 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-17/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#3555]) +3 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html
    - shard-tglu-1:       NOTRUN -> [SKIP][290] ([i915#3555])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#8623])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-13/igt@kms_tiled_display@basic-test-pattern.html
    - shard-tglu:         NOTRUN -> [SKIP][292] ([i915#8623])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-5/igt@kms_tiled_display@basic-test-pattern.html
    - shard-glk:          NOTRUN -> [FAIL][293] ([i915#10959])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-glk1/igt@kms_tiled_display@basic-test-pattern.html
    - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#8623])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-3/igt@kms_tiled_display@basic-test-pattern.html
    - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#8623])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#11920])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-4/igt@kms_vrr@lobf.html
    - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#11920])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-12/igt@kms_vrr@lobf.html
    - shard-mtlp:         NOTRUN -> [SKIP][298] ([i915#11920])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-7/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          NOTRUN -> [SKIP][299] ([i915#3555] / [i915#9906])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-1/igt@kms_vrr@negative-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#3555] / [i915#9906])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-1/igt@kms_vrr@negative-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#3555] / [i915#9906])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-18/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          NOTRUN -> [SKIP][302] ([i915#9906])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-tglu:         NOTRUN -> [SKIP][303] ([i915#2437] / [i915#9412])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-6/igt@kms_writeback@writeback-pixel-formats.html
    - shard-glk:          NOTRUN -> [SKIP][304] ([i915#2437])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-glk3/igt@kms_writeback@writeback-pixel-formats.html
    - shard-mtlp:         NOTRUN -> [SKIP][305] ([i915#2437] / [i915#9412])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-8/igt@kms_writeback@writeback-pixel-formats.html
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#2437] / [i915#9412])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-4/igt@kms_writeback@writeback-pixel-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#2437] / [i915#9412])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-3/igt@kms_writeback@writeback-pixel-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][308] ([i915#2437] / [i915#9412])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-13/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@invalid-oa-exponent:
    - shard-glk:          NOTRUN -> [ABORT][309] ([i915#13218]) +17 other tests abort
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-glk9/igt@perf@invalid-oa-exponent.html

  * igt@perf@invalid-open-flags:
    - shard-mtlp:         NOTRUN -> [ABORT][310] ([i915#13218]) +25 other tests abort
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-7/igt@perf@invalid-open-flags.html

  * igt@perf@invalid-remove-userspace-config:
    - shard-dg2:          NOTRUN -> [ABORT][311] ([i915#13218]) +22 other tests abort
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-10/igt@perf@invalid-remove-userspace-config.html

  * igt@perf_pmu@init-busy@rcs0:
    - shard-tglu-1:       NOTRUN -> [ABORT][312] ([i915#13218]) +2 other tests abort
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-1/igt@perf_pmu@init-busy@rcs0.html

  * igt@perf_pmu@semaphore-busy@vcs1:
    - shard-dg1:          NOTRUN -> [FAIL][313] ([i915#4349]) +1 other test fail
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-18/igt@perf_pmu@semaphore-busy@vcs1.html

  * igt@perf_pmu@semaphore-busy@vecs0:
    - shard-dg2:          NOTRUN -> [FAIL][314] ([i915#4349]) +3 other tests fail
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-1/igt@perf_pmu@semaphore-busy@vecs0.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-mtlp:         NOTRUN -> [SKIP][315] ([i915#3708] / [i915#4077]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-4/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#3291] / [i915#3708])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-11/igt@prime_vgem@basic-fence-read.html
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#3291] / [i915#3708])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-5/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][318] ([i915#3708] / [i915#4077]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-4/igt@prime_vgem@coherency-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][319] ([i915#3708]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-3/igt@prime_vgem@coherency-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][320] ([i915#3708] / [i915#4077]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-13/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#3708]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-12/igt@prime_vgem@fence-flip-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][322] ([i915#3708]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-mtlp-7/igt@prime_vgem@fence-flip-hang.html
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#3708])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-4/igt@prime_vgem@fence-flip-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#9917])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-5/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
    - shard-tglu:         NOTRUN -> [FAIL][325] ([i915#12910]) +9 other tests fail
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-tglu-5/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg2:          NOTRUN -> [SKIP][326] ([i915#9917])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-4/igt@sriov_basic@enable-vfs-autoprobe-on.html

  
#### Possible fixes ####

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][327] ([i915#12714] / [i915#5784]) -> [PASS][328]
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-dg1-12/igt@gem_eio@unwedge-stress.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg1-17/igt@gem_eio@unwedge-stress.html

  * igt@i915_module_load@load:
    - shard-dg2:          ([PASS][329], [PASS][330], [PASS][331], [PASS][332], [PASS][333], [PASS][334], [PASS][335], [PASS][336], [PASS][337], [PASS][338], [PASS][339], [PASS][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348], [PASS][349], [FAIL][350]) ([i915#13138]) -> ([PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360], [PASS][361], [PASS][362], [PASS][363], [PASS][364], [PASS][365], [PASS][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS][371], [PASS][372])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-dg2-3/igt@i915_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-dg2-3/igt@i915_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-dg2-5/igt@i915_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-dg2-1/igt@i915_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-dg2-8/igt@i915_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-dg2-2/igt@i915_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-dg2-4/igt@i915_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-dg2-10/igt@i915_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-dg2-8/igt@i915_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-dg2-4/igt@i915_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-dg2-2/igt@i915_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-dg2-5/igt@i915_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-dg2-7/igt@i915_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-dg2-6/igt@i915_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-dg2-1/igt@i915_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-dg2-2/igt@i915_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-dg2-8/igt@i915_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-dg2-10/igt@i915_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-dg2-5/igt@i915_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-dg2-6/igt@i915_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-dg2-11/igt@i915_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-dg2-11/igt@i915_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-1/igt@i915_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-5/igt@i915_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-6/igt@i915_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-8/igt@i915_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-5/igt@i915_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-10/igt@i915_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-11/igt@i915_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-6/igt@i915_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-2/igt@i915_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-2/igt@i915_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-7/igt@i915_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-8/igt@i915_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-10/igt@i915_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-10/igt@i915_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-3/igt@i915_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-11/igt@i915_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-5/igt@i915_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-8/igt@i915_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-7/igt@i915_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-4/igt@i915_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-6/igt@i915_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-4/igt@i915_module_load@load.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-rkl:          [DMESG-WARN][373] ([i915#12964]) -> [PASS][374] +5 other tests pass
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-rkl-1/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-4/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2:          [FAIL][375] ([i915#6880]) -> [PASS][376]
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  
#### Warnings ####

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][377] ([i915#4816]) -> [SKIP][378] ([i915#4070] / [i915#4816])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15788/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10159
  [i915#10226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10333]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10333
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10959]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11614]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12714]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12714
  [i915#12755]: https://

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12246/index.html
