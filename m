Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6041FCF6491
	for <igt-dev@archiver.kernel.org>; Sat, 28 Sep 2024 19:45:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0B410E24F;
	Sat, 28 Sep 2024 19:45:34 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D2F10E24F;
 Sat, 28 Sep 2024 19:45:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0200729762078939328=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/3=5D_igt=3A_Fix_printf_formats_on_x86-32?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 28 Sep 2024 19:45:33 -0000
Message-ID: <172755273357.1131639.16821415025915110823@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240927163307.10159-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240927163307.10159-1-ville.syrjala@linux.intel.com>
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

--===============0200729762078939328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/3] igt: Fix printf formats on x86-32
URL   : https://patchwork.freedesktop.org/series/139232/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15453_full -> IGTPW_11831_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11831_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11831_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/index.html

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): shard-glk 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11831_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][1] +25 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-dg2:          NOTRUN -> [SKIP][2] +22 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][3] +16 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][4] +25 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][5] +13 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_vblank@query-busy-hang:
    - shard-tglu:         [PASS][6] -> [SKIP][7] +17 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-3/igt@kms_vblank@query-busy-hang.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_vblank@query-busy-hang.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-tglu:         [SKIP][8] ([i915#5286]) -> [SKIP][9] +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-5/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-tglu:         [SKIP][10] ([i915#6095]) -> [SKIP][11] +4 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          [SKIP][12] ([i915#9197]) -> [SKIP][13] +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         [SKIP][14] ([i915#6944] / [i915#9424]) -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-4/igt@kms_content_protection@lic-type-0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-tglu:         [SKIP][16] ([i915#11453]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-3/igt@kms_cursor_crc@cursor-random-512x512.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu:         [SKIP][18] ([i915#9723]) -> [SKIP][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg1:          [SKIP][20] ([i915#4423]) -> [SKIP][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][22] ([i915#5354]) -> [SKIP][23] +8 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-tglu:         [SKIP][24] ([i915#3555]) -> [SKIP][25] +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-9/igt@kms_plane_lowres@tiling-yf.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-tglu:         [SKIP][26] ([i915#9906]) -> [SKIP][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-9/igt@kms_vrr@seamless-rr-switch-vrr.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_vrr@seamless-rr-switch-vrr.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - {shard-tglu-1}:     NOTRUN -> [ABORT][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - {shard-tglu-1}:     NOTRUN -> [SKIP][29] +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15453_full and IGTPW_11831_full:

### New IGT tests (1) ###

  * igt@kms_lease@lease-again@pipe-d-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_11831_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#8411])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#9318])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-7/igt@debugfs_test@basic-hwmon.html

  * igt@drm_fdinfo@virtual-busy-hang:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#8414]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@drm_fdinfo@virtual-busy-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#8414]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-16/igt@drm_fdinfo@virtual-busy-hang.html

  * igt@drm_fdinfo@virtual-busy-idle:
    - shard-mtlp:         NOTRUN -> [SKIP][34] ([i915#8414]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-5/igt@drm_fdinfo@virtual-busy-idle.html

  * igt@fbdev@read:
    - shard-dg2:          [PASS][35] -> [SKIP][36] ([i915#2582])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-4/igt@fbdev@read.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@fbdev@read.html

  * igt@gem_busy@close-race:
    - shard-mtlp:         NOTRUN -> [FAIL][37] ([i915#12297])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-4/igt@gem_busy@close-race.html
    - shard-rkl:          NOTRUN -> [FAIL][38] ([i915#12297])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@gem_busy@close-race.html
    - shard-snb:          NOTRUN -> [FAIL][39] ([i915#12297])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-snb6/igt@gem_busy@close-race.html
    - shard-dg1:          NOTRUN -> [FAIL][40] ([i915#12297])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-13/igt@gem_busy@close-race.html
    - shard-tglu:         NOTRUN -> [FAIL][41] ([i915#12297])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-7/igt@gem_busy@close-race.html

  * igt@gem_caching@read-writes:
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#4873])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-6/igt@gem_caching@read-writes.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][43] ([i915#3555] / [i915#9323])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-6/igt@gem_ccs@block-copy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#3555] / [i915#9323])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-1/igt@gem_ccs@block-copy-compressed.html
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#3555] / [i915#9323])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#9323])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][47] ([i915#9323])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#3555] / [i915#9323])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-14/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [PASS][49] -> [INCOMPLETE][50] ([i915#7297]) +1 other test incomplete
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-4/igt@gem_ccs@suspend-resume.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-5/igt@gem_ccs@suspend-resume.html

  * igt@gem_compute@compute-square:
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#9310])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-8/igt@gem_compute@compute-square.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][52] ([i915#6335])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-7/igt@gem_create@create-ext-cpu-access-big.html
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#6335])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-4/igt@gem_create@create-ext-cpu-access-big.html
    - shard-dg2:          NOTRUN -> [ABORT][54] ([i915#9846])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-1/igt@gem_create@create-ext-cpu-access-big.html
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#6335])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_engines@invalid-engines:
    - shard-tglu:         [PASS][56] -> [FAIL][57] ([i915#12027])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-8/igt@gem_ctx_engines@invalid-engines.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-4/igt@gem_ctx_engines@invalid-engines.html
    - shard-mtlp:         [PASS][58] -> [FAIL][59] ([i915#12031])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-mtlp-8/igt@gem_ctx_engines@invalid-engines.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-6/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_ctx_freq@sysfs:
    - shard-dg2:          [PASS][60] -> [FAIL][61] ([i915#9561]) +1 other test fail
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-10/igt@gem_ctx_freq@sysfs.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-4/igt@gem_ctx_freq@sysfs.html

  * igt@gem_ctx_persistence@hang:
    - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#8555]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-4/igt@gem_ctx_persistence@hang.html
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#8555]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-10/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#8555]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          NOTRUN -> [FAIL][65] ([i915#11980])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-10/igt@gem_ctx_persistence@hostile.html
    - shard-rkl:          NOTRUN -> [FAIL][66] ([i915#11980])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-7/igt@gem_ctx_persistence@hostile.html
    - shard-dg1:          NOTRUN -> [FAIL][67] ([i915#11980])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-16/igt@gem_ctx_persistence@hostile.html
    - shard-snb:          NOTRUN -> [SKIP][68] ([i915#1099]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-snb7/igt@gem_ctx_persistence@hostile.html
    - shard-mtlp:         NOTRUN -> [FAIL][69] ([i915#11980])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-7/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#280])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#280])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu:         NOTRUN -> [SKIP][72] ([i915#280])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-7/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@kms:
    - shard-dg2:          [PASS][73] -> [FAIL][74] ([i915#5784])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-6/igt@gem_eio@kms.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][75] -> [FAIL][76] ([i915#5784])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg1-12/igt@gem_eio@reset-stress.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-14/igt@gem_eio@reset-stress.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#6334]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-4/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_fair@basic-none-solo:
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#4473])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-7/igt@gem_exec_fair@basic-none-solo.html

  * igt@gem_exec_fair@basic-none-vip:
    - shard-tglu:         NOTRUN -> [FAIL][79] ([i915#2842]) +1 other test fail
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-5/igt@gem_exec_fair@basic-none-vip.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][80] ([i915#2842]) +1 other test fail
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-throttle:
    - shard-rkl:          [PASS][81] -> [FAIL][82] ([i915#2842]) +1 other test fail
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-rkl-2/igt@gem_exec_fair@basic-throttle.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@gem_exec_fair@basic-throttle.html

  * igt@gem_exec_fence@submit:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4812]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-17/igt@gem_exec_fence@submit.html
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#4812]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-4/igt@gem_exec_fence@submit.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4812]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-5/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#3539] / [i915#4852]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-10/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#3539] / [i915#4852]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-15/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_reloc@basic-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#3281]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-5/igt@gem_exec_reloc@basic-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#3281]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-19/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-wc-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#3281]) +12 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-2/igt@gem_exec_reloc@basic-wc-read-noreloc.html

  * igt@gem_exec_reloc@basic-write-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#3281]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@gem_exec_reloc@basic-write-gtt-noreloc.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4860])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@gem_fence_thrash@bo-write-verify-x.html
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#4860])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-12/igt@gem_fence_thrash@bo-write-verify-x.html
    - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#4860])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-3/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#2190])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#4613]) +5 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@random:
    - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#4613]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-7/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#4613]) +4 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-7/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#12193]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4565]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_madvise@dontneed-before-exec:
    - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#3282])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-4/igt@gem_madvise@dontneed-before-exec.html
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#3282])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-11/igt@gem_madvise@dontneed-before-exec.html
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#3282]) +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-3/igt@gem_madvise@dontneed-before-exec.html
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#3282])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-14/igt@gem_madvise@dontneed-before-exec.html

  * igt@gem_media_vme:
    - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#284])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-5/igt@gem_media_vme.html
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#284])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@gem_media_vme.html
    - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#284])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@gem_media_vme.html
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#284])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-15/igt@gem_media_vme.html
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#284])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@gem_media_vme.html

  * igt@gem_mmap@pf-nonblock:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#4083]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-3/igt@gem_mmap@pf-nonblock.html

  * igt@gem_mmap_gtt@hang:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#4077]) +5 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-3/igt@gem_mmap_gtt@hang.html

  * igt@gem_mmap_wc@bad-offset:
    - shard-mtlp:         NOTRUN -> [SKIP][112] ([i915#4083]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-4/igt@gem_mmap_wc@bad-offset.html

  * igt@gem_mmap_wc@bad-size:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#4083]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-16/igt@gem_mmap_wc@bad-size.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-tglu:         NOTRUN -> [SKIP][114] ([i915#4270]) +4 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-mtlp:         NOTRUN -> [SKIP][115] ([i915#4270]) +4 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-7/igt@gem_pxp@create-valid-protected-context.html
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#4270]) +4 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#4270]) +6 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#4270]) +3 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-12/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#8428]) +4 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-8/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#5190] / [i915#8428]) +4 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-1/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#4885]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-13/igt@gem_softpin@evict-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][122] ([i915#4885]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-6/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#4885]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#4077]) +9 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-15/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html
    - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#4077]) +7 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-3/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_tiled_pread_basic:
    - shard-mtlp:         NOTRUN -> [SKIP][126] ([i915#4079])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-4/igt@gem_tiled_pread_basic.html
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#4079])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-10/igt@gem_tiled_pread_basic.html
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#4079])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-17/igt@gem_tiled_pread_basic.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#3297]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#3297]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#3297]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#3297]) +2 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-15/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#3297] / [i915#4880])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#3297] / [i915#4958])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-4/igt@gem_userptr_blits@sd-probe.html
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#3297] / [i915#4958])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-16/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#3297]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-6/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#2527]) +5 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@gen9_exec_parse@bb-chained.html
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#2527]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-17/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#2856]) +4 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-4/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][140] ([i915#2527] / [i915#2856]) +5 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-4/igt@gen9_exec_parse@cmd-crossing-page.html
    - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#2856]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-2/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          NOTRUN -> [ABORT][142] ([i915#9820])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#8399]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#7984])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#6245])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@i915_query@hwconfig_table.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#5723])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-16/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][147] ([i915#4817])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#4212]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#4212]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#4212]) +3 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-17/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#8709]) +11 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html

  * igt@kms_atomic_interruptible@atomic-setmode:
    - shard-dg2:          [PASS][152] -> [SKIP][153] ([i915#9197]) +49 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-4/igt@kms_atomic_interruptible@atomic-setmode.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_atomic_interruptible@atomic-setmode.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#1769] / [i915#3555])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-snb:          [PASS][155] -> [FAIL][156] ([i915#5956]) +5 other tests fail
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-snb6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-snb2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#4538] / [i915#5286]) +4 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-19/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#5286]) +6 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-4/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#5286]) +7 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][160] +11 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#3638]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-15/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-mtlp:         NOTRUN -> [SKIP][162] +10 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-3/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#3638]) +2 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#5190] / [i915#9197]) +3 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#6187])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#4538] / [i915#5190]) +6 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-11/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#4538]) +3 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-d-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#10307] / [i915#6095]) +165 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-11/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-d-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#6095]) +152 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-14/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#6095]) +114 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-3/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][171] ([i915#6095]) +54 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#6095]) +79 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#7828]) +9 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#7828]) +10 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-18/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#7828]) +10 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#7828]) +8 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-11/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#7828]) +7 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#7118] / [i915#9424])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#9424])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-16/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#3299])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-17/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#3299])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#3116]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@kms_content_protection@dp-mst-type-0.html
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#3116] / [i915#3299]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#9424])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@type1:
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-6/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#6944] / [i915#9424])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-3/igt@kms_content_protection@uevent.html
    - shard-dg1:          NOTRUN -> [SKIP][188] ([i915#7116] / [i915#9424])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-12/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#8814]) +3 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#3359])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#11453] / [i915#3359])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#11453])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-17/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#3555]) +4 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-18/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#9197]) +13 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#11453]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#3555]) +3 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
    - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#3555] / [i915#8814])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#11453]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#4103]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#4103])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][201] +41 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#9809]) +2 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#9067])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#4103] / [i915#4213])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-18/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#1769] / [i915#3555] / [i915#3804])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][206] ([i915#3804])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#1257])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-2/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#3555] / [i915#3840]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-4/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#3555] / [i915#3840])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-1/igt@kms_dsc@dsc-with-output-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#3555] / [i915#3840])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@kms_dsc@dsc-with-output-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#3555] / [i915#3840])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#3840] / [i915#9053])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#3840] / [i915#9053])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-12/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#3469])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-10/igt@kms_fbcon_fbt@psr.html
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#3955])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@kms_fbcon_fbt@psr.html
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#3469])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-17/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-2x:
    - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#1839])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-5/igt@kms_feature_discovery@display-2x.html
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#1839])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-1/igt@kms_feature_discovery@display-2x.html
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#1839])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@kms_feature_discovery@display-2x.html
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#1839])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-13/igt@kms_feature_discovery@display-2x.html
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#1839])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-5/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#658])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-12/igt@kms_feature_discovery@psr2.html
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#658])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#4881])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#3637]) +7 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#3637]) +5 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-8/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][227] -> [FAIL][228] ([i915#2122]) +1 other test fail
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-snb6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-snb1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][229] ([i915#3637] / [i915#3966])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-6/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-tglu:         [PASS][230] -> [SKIP][231] ([i915#3637])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-5/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#2672]) +6 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#2672] / [i915#3555]) +2 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#2672]) +6 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][235] ([i915#2672] / [i915#3555]) +2 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#2587] / [i915#2672]) +4 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#2672] / [i915#3555] / [i915#8813]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#2587] / [i915#2672]) +4 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#2672]) +2 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#2587] / [i915#2672] / [i915#3555])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#2672] / [i915#3555]) +3 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#2672] / [i915#3555]) +6 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2:          [PASS][244] -> [SKIP][245] ([i915#5354]) +12 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][246] -> [FAIL][247] ([i915#6880])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-tglu:         [PASS][248] -> [SKIP][249] ([i915#1849]) +4 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#1825]) +23 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-snb:          [PASS][251] -> [SKIP][252] +10 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#3458]) +11 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#10433] / [i915#3458])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#1849]) +4 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][256] +47 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][257] +86 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#5354]) +35 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#3023]) +32 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][260] +115 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-snb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#1825]) +41 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#3458]) +15 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#3555] / [i915#8228]) +2 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-18/igt@kms_hdr@bpc-switch.html
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#3555] / [i915#8228]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-2/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#3555] / [i915#8228]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-11/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#3555] / [i915#8228]) +2 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-2/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@uint-max-clock:
    - shard-dg2:          [PASS][267] -> [SKIP][268] ([i915#3555]) +3 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-7/igt@kms_invalid_mode@uint-max-clock.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_invalid_mode@uint-max-clock.html

  * igt@kms_invalid_mode@zero-vdisplay:
    - shard-tglu:         [PASS][269] -> [SKIP][270] ([i915#3555]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-9/igt@kms_invalid_mode@zero-vdisplay.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_invalid_mode@zero-vdisplay.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][271] ([i915#6301])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-4/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-tglu:         [PASS][272] -> [SKIP][273] ([i915#8825])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-6/igt@kms_plane@pixel-format-source-clamping.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@plane-position-hole-dpms:
    - shard-dg2:          [PASS][274] -> [SKIP][275] ([i915#8825]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-11/igt@kms_plane@plane-position-hole-dpms.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_plane@plane-position-hole-dpms.html

  * igt@kms_plane_alpha_blend@constant-alpha-mid:
    - shard-tglu:         [PASS][276] -> [SKIP][277] ([i915#7294])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-4/igt@kms_plane_alpha_blend@constant-alpha-mid.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_plane_alpha_blend@constant-alpha-mid.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][278] ([i915#3555]) +6 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-7/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#3555]) +8 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#5354] / [i915#9423])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-10/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [FAIL][281] ([i915#8292])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-3.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][282] ([i915#8292])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [FAIL][283] ([i915#8292])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-14/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-dg2:          [PASS][284] -> [SKIP][285] ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9423]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-6/igt@kms_plane_scaling@invalid-num-scalers.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#12247]) +10 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#12247]) +14 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#12247]) +27 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:
    - shard-dg2:          [PASS][289] -> [SKIP][290] ([i915#8152] / [i915#9423])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-d:
    - shard-dg2:          [PASS][291] -> [SKIP][292] ([i915#8152])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-d.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-tglu:         [PASS][293] -> [SKIP][294] ([i915#12247] / [i915#3555] / [i915#6953] / [i915#8152])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-tglu:         [PASS][295] -> [SKIP][296] ([i915#12247]) +2 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d:
    - shard-tglu:         [PASS][297] -> [SKIP][298] ([i915#12247] / [i915#8152])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][299] ([i915#6953])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a:
    - shard-dg2:          [PASS][300] -> [SKIP][301] ([i915#12247]) +5 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d:
    - shard-dg2:          [PASS][302] -> [SKIP][303] ([i915#12247] / [i915#8152])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-mtlp:         NOTRUN -> [SKIP][304] ([i915#12247] / [i915#6953])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:
    - shard-mtlp:         NOTRUN -> [SKIP][305] ([i915#12247]) +7 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-tglu:         NOTRUN -> [SKIP][306] ([i915#12247] / [i915#6953])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu:         NOTRUN -> [SKIP][307] ([i915#9812])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-9/igt@kms_pm_backlight@fade.html
    - shard-dg1:          NOTRUN -> [SKIP][308] ([i915#5354])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-12/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][309] ([i915#5354])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-2/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-tglu:         NOTRUN -> [SKIP][310] ([i915#9685])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-2/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg1:          NOTRUN -> [SKIP][311] ([i915#9685])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-14/igt@kms_pm_dc@dc5-psr.html
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#9685])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-10/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][313] ([i915#3361])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-19/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#9519]) +2 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [PASS][315] -> [SKIP][316] ([i915#9519])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-10/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-dg1:          [PASS][317] -> [DMESG-WARN][318] ([i915#4423]) +2 other tests dmesg-warn
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg1-13/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-18/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#6524] / [i915#6805])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-10/igt@kms_prime@basic-crc-hybrid.html
    - shard-dg1:          NOTRUN -> [SKIP][320] ([i915#6524])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-17/igt@kms_prime@basic-crc-hybrid.html
    - shard-mtlp:         NOTRUN -> [SKIP][321] ([i915#6524])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-4/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][322] ([i915#6524]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@kms_prime@basic-modeset-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][323] ([i915#6524])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-4/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#9683])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-5/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-cursor-blt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][325] ([i915#9688]) +12 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-2/igt@kms_psr@fbc-psr-cursor-blt@edp-1.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][326] ([i915#9732]) +25 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-6/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#1072] / [i915#9732]) +12 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_psr@fbc-psr-primary-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][328] ([i915#1072] / [i915#9732]) +25 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-2/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#1072] / [i915#9732]) +14 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-19/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#9685]) +2 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-mtlp:         NOTRUN -> [SKIP][331] ([i915#4235]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#5190])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-rkl:          NOTRUN -> [SKIP][333] ([i915#5289])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][334] ([i915#5289])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu:         NOTRUN -> [SKIP][335] ([i915#5289])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg1:          NOTRUN -> [SKIP][336] ([i915#5289]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-18/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-mtlp:         NOTRUN -> [SKIP][337] ([i915#3555] / [i915#5030] / [i915#9041])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-5/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][338] ([i915#5030]) +2 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-5/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][339] ([i915#5030] / [i915#9041])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-5/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][340] ([i915#5465]) +2 other tests fail
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-snb7/igt@kms_setmode@basic.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][341] ([i915#8623])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][342] ([i915#9906])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-6/igt@kms_vrr@flip-basic-fastset.html
    - shard-mtlp:         NOTRUN -> [SKIP][343] ([i915#8808] / [i915#9906])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-7/igt@kms_vrr@flip-basic-fastset.html
    - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#9906])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-6/igt@kms_vrr@flip-basic-fastset.html
    - shard-rkl:          NOTRUN -> [SKIP][345] ([i915#9906]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-2/igt@kms_vrr@flip-basic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][346] ([i915#9906])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-15/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][347] ([i915#11920])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@kms_vrr@lobf.html
    - shard-rkl:          NOTRUN -> [SKIP][348] ([i915#11920])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@kms_vrr@lobf.html
    - shard-dg1:          NOTRUN -> [SKIP][349] ([i915#11920])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-15/igt@kms_vrr@lobf.html
    - shard-tglu:         NOTRUN -> [SKIP][350] ([i915#11920])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@kms_vrr@lobf.html
    - shard-mtlp:         NOTRUN -> [SKIP][351] ([i915#11920])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-5/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-check-output:
    - shard-rkl:          NOTRUN -> [SKIP][352] ([i915#2437]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@kms_writeback@writeback-check-output.html
    - shard-tglu:         NOTRUN -> [SKIP][353] ([i915#2437])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-7/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][354] ([i915#2437] / [i915#9412])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-rkl:          NOTRUN -> [SKIP][355] ([i915#2437] / [i915#9412]) +1 other test skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-dg1:          NOTRUN -> [SKIP][356] ([i915#2437] / [i915#9412])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-17/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-tglu:         NOTRUN -> [SKIP][357] ([i915#2437] / [i915#9412])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-mtlp:         NOTRUN -> [SKIP][358] ([i915#2437] / [i915#9412])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2:          NOTRUN -> [SKIP][359] ([i915#2437])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-8/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf_pmu@busy-idle@ccs0:
    - shard-mtlp:         [PASS][360] -> [FAIL][361] ([i915#4349]) +1 other test fail
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-mtlp-5/igt@perf_pmu@busy-idle@ccs0.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-3/igt@perf_pmu@busy-idle@ccs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-mtlp:         NOTRUN -> [SKIP][362] ([i915#8850])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-3/igt@perf_pmu@cpu-hotplug.html
    - shard-dg2:          NOTRUN -> [SKIP][363] ([i915#8850])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-3/igt@perf_pmu@cpu-hotplug.html
    - shard-rkl:          NOTRUN -> [SKIP][364] ([i915#8850])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-7/igt@perf_pmu@cpu-hotplug.html
    - shard-dg1:          NOTRUN -> [SKIP][365] ([i915#8850])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-15/igt@perf_pmu@cpu-hotplug.html
    - shard-tglu:         NOTRUN -> [SKIP][366] ([i915#8850])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-3/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][367] ([i915#8516])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-11/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-dg1:          NOTRUN -> [SKIP][368] ([i915#8516])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-12/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@basic-fence-read:
    - shard-mtlp:         NOTRUN -> [SKIP][369] ([i915#3708])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-8/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][370] ([i915#3291] / [i915#3708]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-1/igt@prime_vgem@basic-write.html
    - shard-rkl:          NOTRUN -> [SKIP][371] ([i915#3291] / [i915#3708]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@prime_vgem@basic-write.html
    - shard-dg1:          NOTRUN -> [SKIP][372] ([i915#3708]) +1 other test skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-13/igt@prime_vgem@basic-write.html
    - shard-mtlp:         NOTRUN -> [SKIP][373] ([i915#10216] / [i915#3708])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-6/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][374] ([i915#3708] / [i915#4077])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@prime_vgem@coherency-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][375] ([i915#3708]) +1 other test skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-2/igt@prime_vgem@coherency-gtt.html

  * igt@syncobj_wait@invalid-wait-zero-handles:
    - shard-tglu:         NOTRUN -> [FAIL][376] ([i915#9781])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-4/igt@syncobj_wait@invalid-wait-zero-handles.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg1:          NOTRUN -> [SKIP][377] ([i915#4818])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-15/igt@tools_test@sysfs_l3_parity.html
    - shard-mtlp:         NOTRUN -> [SKIP][378] ([i915#4818])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-7/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@most-busy-check-all:
    - shard-rkl:          [FAIL][379] ([i915#12179]) -> [PASS][380]
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@drm_fdinfo@most-busy-check-all.html

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          [FAIL][381] ([i915#7742]) -> [PASS][382]
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-rkl:          [FAIL][383] ([i915#2842]) -> [PASS][384]
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-rkl-4/igt@gem_exec_fair@basic-pace@bcs0.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-2/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [TIMEOUT][385] ([i915#5493]) -> [PASS][386] +1 other test pass
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_mmap_wc@set-cache-level:
    - shard-tglu:         [SKIP][387] ([i915#1850]) -> [PASS][388]
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-8/igt@gem_mmap_wc@set-cache-level.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@gem_mmap_wc@set-cache-level.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [ABORT][389] ([i915#9820]) -> [PASS][390]
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg1:          [ABORT][391] ([i915#9820]) -> [PASS][392]
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg1-15/igt@i915_module_load@reload-with-fault-injection.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-19/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_atomic_interruptible@legacy-pageflip:
    - shard-tglu:         [SKIP][393] -> [PASS][394] +29 other tests pass
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-8/igt@kms_atomic_interruptible@legacy-pageflip.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@kms_atomic_interruptible@legacy-pageflip.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-dg2:          [SKIP][395] ([i915#9197]) -> [PASS][396] +35 other tests pass
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-5/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_dirtyfb@default-dirtyfb-ioctl:
    - shard-dg1:          [DMESG-WARN][397] ([i915#4423]) -> [PASS][398]
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg1-19/igt@kms_dirtyfb@default-dirtyfb-ioctl.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-17/igt@kms_dirtyfb@default-dirtyfb-ioctl.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-snb:          [FAIL][399] ([i915#2122]) -> [PASS][400] +8 other tests pass
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-snb2/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-snb2/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-dg2:          [SKIP][401] ([i915#5354]) -> [PASS][402] +16 other tests pass
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-11/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset:
    - shard-tglu:         [SKIP][403] ([i915#3637]) -> [PASS][404] +5 other tests pass
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-8/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-6/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@plain-flip-ts-check@b-edp1:
    - shard-mtlp:         [FAIL][405] -> [PASS][406] +1 other test pass
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-mtlp-7/igt@kms_flip@plain-flip-ts-check@b-edp1.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-7/igt@kms_flip@plain-flip-ts-check@b-edp1.html

  * igt@kms_flip@plain-flip-ts-check@b-hdmi-a4:
    - shard-dg1:          [FAIL][407] ([i915#2122]) -> [PASS][408] +3 other tests pass
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg1-14/igt@kms_flip@plain-flip-ts-check@b-hdmi-a4.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-15/igt@kms_flip@plain-flip-ts-check@b-hdmi-a4.html

  * igt@kms_flip@plain-flip-ts-check@c-edp1:
    - shard-mtlp:         [FAIL][409] ([i915#2122]) -> [PASS][410] +2 other tests pass
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-mtlp-7/igt@kms_flip@plain-flip-ts-check@c-edp1.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-7/igt@kms_flip@plain-flip-ts-check@c-edp1.html

  * igt@kms_flip@plain-flip-ts-check@d-hdmi-a1:
    - shard-tglu:         [FAIL][411] ([i915#2122]) -> [PASS][412] +1 other test pass
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-9/igt@kms_flip@plain-flip-ts-check@d-hdmi-a1.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-6/igt@kms_flip@plain-flip-ts-check@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-tglu:         [SKIP][413] ([i915#3555]) -> [PASS][414]
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          [FAIL][415] ([i915#6880]) -> [PASS][416]
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-rkl:          [SKIP][417] ([i915#433]) -> [PASS][418]
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-rkl-2/igt@kms_hdmi_inject@inject-audio.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          [SKIP][419] ([i915#3555] / [i915#8228]) -> [PASS][420]
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-3/igt@kms_hdr@static-toggle.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-10/igt@kms_hdr@static-toggle.html

  * igt@kms_invalid_mode@zero-hdisplay:
    - shard-dg2:          [SKIP][421] ([i915#3555]) -> [PASS][422] +3 other tests pass
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_invalid_mode@zero-hdisplay.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-1/igt@kms_invalid_mode@zero-hdisplay.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-dg2:          [SKIP][423] ([i915#8825]) -> [PASS][424]
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-4/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@constant-alpha-min:
    - shard-dg2:          [SKIP][425] ([i915#7294]) -> [PASS][426] +1 other test pass
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_plane_alpha_blend@constant-alpha-min.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-10/igt@kms_plane_alpha_blend@constant-alpha-min.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
    - shard-dg2:          [SKIP][427] ([i915#12247] / [i915#8152] / [i915#9423]) -> [PASS][428] +2 other tests pass
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-11/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d:
    - shard-dg2:          [SKIP][429] ([i915#12247] / [i915#8152]) -> [PASS][430] +5 other tests pass
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-11/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-dg2:          [SKIP][431] ([i915#12247] / [i915#3555] / [i915#6953] / [i915#8152] / [i915#9423]) -> [PASS][432]
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:
    - shard-tglu:         [SKIP][433] ([i915#12247] / [i915#3558] / [i915#8152]) -> [PASS][434]
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-a:
    - shard-tglu:         [SKIP][435] ([i915#12247]) -> [PASS][436] +2 other tests pass
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-a.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-d:
    - shard-tglu:         [SKIP][437] ([i915#12247] / [i915#8152]) -> [PASS][438]
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-d.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-dg2:          [SKIP][439] ([i915#6953] / [i915#8152] / [i915#9423]) -> [PASS][440]
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a:
    - shard-dg2:          [SKIP][441] ([i915#12247]) -> [PASS][442] +17 other tests pass
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-dg2:          [SKIP][443] ([i915#12247] / [i915#6953] / [i915#8152] / [i915#9423]) -> [PASS][444]
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [FAIL][445] ([i915#9295]) -> [PASS][446]
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-tglu:         [SKIP][447] ([i915#1849]) -> [PASS][448] +4 other tests pass
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-8/igt@kms_pm_rpm@cursor-dpms.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-9/igt@kms_pm_rpm@cursor-dpms.html
    - shard-dg2:          [SKIP][449] ([i915#1849]) -> [PASS][450]
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_pm_rpm@cursor-dpms.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-4/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          [SKIP][451] ([i915#9519]) -> [PASS][452]
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/index.html

--===============0200729762078939328==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/3] igt: Fix printf formats on x86-32</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139232/">https://patchwork.freedesktop.org/series/139232/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15453_full -&gt; IGTPW_11831_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11831_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11831_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/index.html</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): shard-glk </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11831_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1.html">SKIP</a> +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-3/igt@kms_vblank@query-busy-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_vblank@query-busy-hang.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-5/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> ([i915#5286]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> ([i915#6095]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-4/igt@kms_content_protection@lic-type-0.html">SKIP</a> ([i915#6944] / [i915#9424]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_content_protection@lic-type-0.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-3/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#11453]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> ([i915#9723]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> ([i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-9/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-9/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> ([i915#9906]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>{shard-tglu-1}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-1/igt@i915_suspend@fence-restore-tiled2untiled.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>{shard-tglu-1}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_15453_full and IGTPW_11831_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_lease@lease-again@pipe-d-hdmi-a-2:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11831_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-7/igt@debugfs_test@basic-hwmon.html">SKIP</a> ([i915#9318])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@drm_fdinfo@virtual-busy-hang.html">SKIP</a> ([i915#8414]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-16/igt@drm_fdinfo@virtual-busy-hang.html">SKIP</a> ([i915#8414]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-idle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-5/igt@drm_fdinfo@virtual-busy-idle.html">SKIP</a> ([i915#8414]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-4/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@fbdev@read.html">SKIP</a> ([i915#2582])</li>
</ul>
</li>
<li>
<p>igt@gem_busy@close-race:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-4/igt@gem_busy@close-race.html">FAIL</a> ([i915#12297])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@gem_busy@close-race.html">FAIL</a> ([i915#12297])</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-snb6/igt@gem_busy@close-race.html">FAIL</a> ([i915#12297])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-13/igt@gem_busy@close-race.html">FAIL</a> ([i915#12297])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-7/igt@gem_busy@close-race.html">FAIL</a> ([i915#12297])</li>
</ul>
</li>
<li>
<p>igt@gem_caching@read-writes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-6/igt@gem_caching@read-writes.html">SKIP</a> ([i915#4873])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-6/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-1/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-14/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-4/igt@gem_ccs@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-5/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> ([i915#7297]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_compute@compute-square:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-8/igt@gem_compute@compute-square.html">SKIP</a> ([i915#9310])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-7/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> ([i915#6335])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-4/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> ([i915#6335])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-1/igt@gem_create@create-ext-cpu-access-big.html">ABORT</a> ([i915#9846])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> ([i915#6335])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-8/igt@gem_ctx_engines@invalid-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-4/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12027])</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-mtlp-8/igt@gem_ctx_engines@invalid-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-6/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12031])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_freq@sysfs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-10/igt@gem_ctx_freq@sysfs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-4/igt@gem_ctx_freq@sysfs.html">FAIL</a> ([i915#9561]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-4/igt@gem_ctx_persistence@hang.html">SKIP</a> ([i915#8555]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-10/igt@gem_ctx_persistence@hang.html">SKIP</a> ([i915#8555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-close.html">SKIP</a> ([i915#8555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-10/igt@gem_ctx_persistence@hostile.html">FAIL</a> ([i915#11980])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-7/igt@gem_ctx_persistence@hostile.html">FAIL</a> ([i915#11980])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-16/igt@gem_ctx_persistence@hostile.html">FAIL</a> ([i915#11980])</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-snb7/igt@gem_ctx_persistence@hostile.html">SKIP</a> ([i915#1099]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-7/igt@gem_ctx_persistence@hostile.html">FAIL</a> ([i915#11980])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-7/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-6/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@gem_eio@kms.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg1-12/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-14/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-4/igt@gem_exec_capture@capture-invisible.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-7/igt@gem_exec_fair@basic-none-solo.html">SKIP</a> ([i915#4473])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-5/igt@gem_exec_fair@basic-none-vip.html">FAIL</a> ([i915#2842]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-rkl-2/igt@gem_exec_fair@basic-throttle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@gem_exec_fair@basic-throttle.html">FAIL</a> ([i915#2842]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-17/igt@gem_exec_fence@submit.html">SKIP</a> ([i915#4812]) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-4/igt@gem_exec_fence@submit.html">SKIP</a> ([i915#4812]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-5/igt@gem_exec_fence@submit3.html">SKIP</a> ([i915#4812]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-before-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-10/igt@gem_exec_flush@basic-wb-ro-before-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-before-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-15/igt@gem_exec_flush@basic-wb-rw-before-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-5/igt@gem_exec_reloc@basic-cpu-noreloc.html">SKIP</a> ([i915#3281]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-19/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> ([i915#3281]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-2/igt@gem_exec_reloc@basic-wc-read-noreloc.html">SKIP</a> ([i915#3281]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@gem_exec_reloc@basic-write-gtt-noreloc.html">SKIP</a> ([i915#3281]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> ([i915#4860])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-12/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> ([i915#4860])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-3/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([i915#4613]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-7/igt@gem_lmem_swapping@random.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-7/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> ([i915#4613]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> ([i915#12193]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html">SKIP</a> ([i915#4565]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-exec:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-4/igt@gem_madvise@dontneed-before-exec.html">SKIP</a> ([i915#3282])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-11/igt@gem_madvise@dontneed-before-exec.html">SKIP</a> ([i915#3282])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-3/igt@gem_madvise@dontneed-before-exec.html">SKIP</a> ([i915#3282]) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-14/igt@gem_madvise@dontneed-before-exec.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-5/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-15/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@pf-nonblock:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-3/igt@gem_mmap@pf-nonblock.html">SKIP</a> ([i915#4083]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-3/igt@gem_mmap_gtt@hang.html">SKIP</a> ([i915#4077]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-offset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-4/igt@gem_mmap_wc@bad-offset.html">SKIP</a> ([i915#4083]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-16/igt@gem_mmap_wc@bad-size.html">SKIP</a> ([i915#4083]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@gem_pxp@create-regular-context-2.html">SKIP</a> ([i915#4270]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-7/igt@gem_pxp@create-valid-protected-context.html">SKIP</a> ([i915#4270]) +4 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@gem_pxp@create-valid-protected-context.html">SKIP</a> ([i915#4270]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-on.html">SKIP</a> ([i915#4270]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-12/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> ([i915#4270]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-8/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html">SKIP</a> ([i915#8428]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-1/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> ([i915#5190] / [i915#8428]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-13/igt@gem_softpin@evict-snoop.html">SKIP</a> ([i915#4885]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-6/igt@gem_softpin@evict-snoop.html">SKIP</a> ([i915#4885]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-15/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html">SKIP</a> ([i915#4077]) +9 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-3/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html">SKIP</a> ([i915#4077]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-4/igt@gem_tiled_pread_basic.html">SKIP</a> ([i915#4079])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-10/igt@gem_tiled_pread_basic.html">SKIP</a> ([i915#4079])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-17/igt@gem_tiled_pread_basic.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-15/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-4/igt@gem_userptr_blits@sd-probe.html">SKIP</a> ([i915#3297] / [i915#4958])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-16/igt@gem_userptr_blits@sd-probe.html">SKIP</a> ([i915#3297] / [i915#4958])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-6/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@gen9_exec_parse@bb-chained.html">SKIP</a> ([i915#2527]) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-17/igt@gen9_exec_parse@bb-chained.html">SKIP</a> ([i915#2527]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-4/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> ([i915#2856]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-4/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> ([i915#2527] / [i915#2856]) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-2/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> ([i915#2856]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> ([i915#8399]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@i915_power@sanity.html">SKIP</a> ([i915#7984])</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@i915_query@hwconfig_table.html">SKIP</a> ([i915#6245])</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-16/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> ([i915#5723])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> ([i915#4817])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> ([i915#4212]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> ([i915#4212]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-17/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> ([i915#4212]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html">SKIP</a> ([i915#8709]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@atomic-setmode:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-4/igt@kms_atomic_interruptible@atomic-setmode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_atomic_interruptible@atomic-setmode.html">SKIP</a> ([i915#9197]) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-snb6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-snb2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> ([i915#5956]) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-19/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> ([i915#4538] / [i915#5286]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-4/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5286]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([i915#5286]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> +11 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-15/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([i915#3638]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-3/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> ([i915#3638]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> ([i915#5190] / [i915#9197]) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> ([i915#6187])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-11/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> ([i915#4538]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-11/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-d-hdmi-a-2.html">SKIP</a> ([i915#10307] / [i915#6095]) +165 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-14/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4.html">SKIP</a> ([i915#6095]) +152 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-3/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#6095]) +114 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-edp-1.html">SKIP</a> ([i915#6095]) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#6095]) +79 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> ([i915#7828]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-18/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> ([i915#7828]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> ([i915#7828]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-11/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> ([i915#7828]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-1/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-16/igt@kms_content_protection@content-type-change.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-17/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3116]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3116] / [i915#3299]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-6/igt@kms_content_protection@lic-type-0.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-6/igt@kms_content_protection@type1.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-3/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#6944] / [i915#9424])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-12/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#7116] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> ([i915#8814]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> ([i915#3359])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> ([i915#11453] / [i915#3359])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-17/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> ([i915#11453])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-18/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> ([i915#3555]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#9197]) +13 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#11453]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555] / [i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> ([i915#11453]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#4103]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> ([i915#9809]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> ([i915#9067])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-18/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> ([i915#1769] / [i915#3555] / [i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-2/igt@kms_dp_aux_dev.html">SKIP</a> ([i915#1257])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-4/igt@kms_dsc@dsc-with-formats.html">SKIP</a> ([i915#3555] / [i915#3840]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-1/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> ([i915#3840] / [i915#9053])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-12/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> ([i915#3840] / [i915#9053])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-10/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([i915#3469])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([i915#3955])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-17/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([i915#3469])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-5/igt@kms_feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-1/igt@kms_feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@kms_feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-13/igt@kms_feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-5/igt@kms_feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-12/igt@kms_feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@kms_fence_pin_leak.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> ([i915#3637]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-8/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> ([i915#3637]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-snb6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-snb1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">FAIL</a> ([i915#2122]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-6/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> ([i915#3637] / [i915#3966])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-5/igt@kms_flip@flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_flip@flip-vs-rmfb-interruptible.html">SKIP</a> ([i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#8813]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> ([i915#5354]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html">FAIL</a> ([i915#6880])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#1849]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html">SKIP</a> ([i915#1825]) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html">SKIP</a> ([i915#3458]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#10433] / [i915#3458])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#1849]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html">SKIP</a> +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> +86 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> ([i915#5354]) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> ([i915#3023]) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-snb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> +115 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> ([i915#1825]) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html">SKIP</a> ([i915#3458]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-18/igt@kms_hdr@bpc-switch.html">SKIP</a> ([i915#3555] / [i915#8228]) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-2/igt@kms_hdr@bpc-switch.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-11/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-2/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555] / [i915#8228]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-7/igt@kms_invalid_mode@uint-max-clock.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_invalid_mode@uint-max-clock.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-9/igt@kms_invalid_mode@zero-vdisplay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_invalid_mode@zero-vdisplay.html">SKIP</a> ([i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-4/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-6/igt@kms_plane@pixel-format-source-clamping.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_plane@pixel-format-source-clamping.html">SKIP</a> ([i915#8825])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-11/igt@kms_plane@plane-position-hole-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_plane@plane-position-hole-dpms.html">SKIP</a> ([i915#8825]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-4/igt@kms_plane_alpha_blend@constant-alpha-mid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_plane_alpha_blend@constant-alpha-mid.html">SKIP</a> ([i915#7294])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-7/igt@kms_plane_lowres@tiling-4.html">SKIP</a> ([i915#3555]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> ([i915#3555]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-10/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> ([i915#5354] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-3.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-14/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-6/igt@kms_plane_scaling@invalid-num-scalers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_plane_scaling@invalid-num-scalers.html">SKIP</a> ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9423]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html">SKIP</a> ([i915#12247]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> ([i915#12247]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c.html">SKIP</a> ([i915#12247]) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html">SKIP</a> ([i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-d.html">SKIP</a> ([i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> ([i915#12247] / [i915#3555] / [i915#6953] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html">SKIP</a> ([i915#12247]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> ([i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a.html">SKIP</a> ([i915#12247]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d.html">SKIP</a> ([i915#12247]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-9/igt@kms_pm_backlight@fade.html">SKIP</a> ([i915#9812])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-12/igt@kms_pm_backlight@fade.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-2/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-2/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-14/igt@kms_pm_dc@dc5-psr.html">SKIP</a> ([i915#9685])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-10/igt@kms_pm_dc@dc5-psr.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-19/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> ([i915#3361])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#9519]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-10/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#9519])</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg1-13/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-18/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">DMESG-WARN</a> ([i915#4423]) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-10/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524] / [i915#6805])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-17/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-4/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-4/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-2/igt@kms_psr@fbc-psr-cursor-blt@edp-1.html">SKIP</a> ([i915#9688]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-6/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> ([i915#9732]) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_psr@fbc-psr-primary-mmap-gtt.html">SKIP</a> ([i915#1072] / [i915#9732]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-2/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> ([i915#1072] / [i915#9732]) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-19/igt@kms_psr@psr2-cursor-mmap-gtt.html">SKIP</a> ([i915#1072] / [i915#9732]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([i915#9685]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> ([i915#4235]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> ([i915#5190])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> ([i915#5289])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-18/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> ([i915#5289]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-5/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> ([i915#3555] / [i915#5030] / [i915#9041])</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-5/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html">SKIP</a> ([i915#5030]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-5/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html">SKIP</a> ([i915#5030] / [i915#9041])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-snb7/igt@kms_setmode@basic.html">FAIL</a> ([i915#5465]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> ([i915#9906])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-7/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> ([i915#8808] / [i915#9906])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> ([i915#9906])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-2/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> ([i915#9906]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-15/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@kms_vrr@lobf.html">SKIP</a> ([i915#11920])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@kms_vrr@lobf.html">SKIP</a> ([i915#11920])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-15/igt@kms_vrr@lobf.html">SKIP</a> ([i915#11920])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@kms_vrr@lobf.html">SKIP</a> ([i915#11920])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-5/igt@kms_vrr@lobf.html">SKIP</a> ([i915#11920])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-4/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-7/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> ([i915#2437] / [i915#9412]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-17/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-8/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-mtlp-5/igt@perf_pmu@busy-idle@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-3/igt@perf_pmu@busy-idle@ccs0.html">FAIL</a> ([i915#4349]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-3/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-3/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-7/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-15/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-3/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-11/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> ([i915#8516])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-12/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-8/igt@prime_vgem@basic-fence-read.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-1/igt@prime_vgem@basic-write.html">SKIP</a> ([i915#3291] / [i915#3708]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@prime_vgem@basic-write.html">SKIP</a> ([i915#3291] / [i915#3708]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-13/igt@prime_vgem@basic-write.html">SKIP</a> ([i915#3708]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-6/igt@prime_vgem@basic-write.html">SKIP</a> ([i915#10216] / [i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-2/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@invalid-wait-zero-handles:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-4/igt@syncobj_wait@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781])</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-15/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([i915#4818])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-7/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([i915#4818])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-check-all:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all.html">FAIL</a> ([i915#12179]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@drm_fdinfo@most-busy-check-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> ([i915#7742]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-5/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-rkl-4/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-2/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> ([i915#5493]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@set-cache-level:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-8/igt@gem_mmap_wc@set-cache-level.html">SKIP</a> ([i915#1850]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@gem_mmap_wc@set-cache-level.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg1-15/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-19/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-pageflip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-8/igt@kms_atomic_interruptible@legacy-pageflip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@kms_atomic_interruptible@legacy-pageflip.html">PASS</a> +29 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-5/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> +35 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@default-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg1-19/igt@kms_dirtyfb@default-dirtyfb-ioctl.html">DMESG-WARN</a> ([i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-17/igt@kms_dirtyfb@default-dirtyfb-ioctl.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-snb2/igt@kms_flip@2x-plain-flip-fb-recreate.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-snb2/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_flip@absolute-wf_vblank-interruptible.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-11/igt@kms_flip@absolute-wf_vblank-interruptible.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-8/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">SKIP</a> ([i915#3637]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-6/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-mtlp-7/igt@kms_flip@plain-flip-ts-check@b-edp1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-7/igt@kms_flip@plain-flip-ts-check@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-hdmi-a4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg1-14/igt@kms_flip@plain-flip-ts-check@b-hdmi-a4.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg1-15/igt@kms_flip@plain-flip-ts-check@b-hdmi-a4.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-mtlp-7/igt@kms_flip@plain-flip-ts-check@c-edp1.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-mtlp-7/igt@kms_flip@plain-flip-ts-check@c-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@d-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-9/igt@kms_flip@plain-flip-ts-check@d-hdmi-a1.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-6/igt@kms_flip@plain-flip-ts-check@d-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">FAIL</a> ([i915#6880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-rkl-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-rkl-7/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-3/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#3555] / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-10/igt@kms_hdr@static-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_invalid_mode@zero-hdisplay.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-1/igt@kms_invalid_mode@zero-hdisplay.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_plane@plane-panning-bottom-right-suspend.html">SKIP</a> ([i915#8825]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-4/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_plane_alpha_blend@constant-alpha-min.html">SKIP</a> ([i915#7294]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-10/igt@kms_plane_alpha_blend@constant-alpha-min.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html">SKIP</a> ([i915#12247] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-11/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-11/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> ([i915#12247] / [i915#3555] / [i915#6953] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">SKIP</a> ([i915#12247] / [i915#3558] / [i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-a:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-a.html">SKIP</a> ([i915#12247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-a.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-d:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">SKIP</a> ([i915#6953] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a.html">SKIP</a> ([i915#12247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> ([i915#12247] / [i915#6953] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> ([i915#9295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-10/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-tglu-8/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> ([i915#1849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-tglu-9/igt@kms_pm_rpm@cursor-dpms.html">PASS</a> +4 other tests pass</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-2/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> ([i915#1849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-4/igt@kms_pm_rpm@cursor-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15453/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11831/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          [</li>
</ul>
</li>
</ul>

</body>
</html>

--===============0200729762078939328==--
