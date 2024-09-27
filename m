Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1083CEBF76
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 06:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8988010EC1F;
	Fri, 27 Sep 2024 06:28:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F8110EC1F;
 Fri, 27 Sep 2024 06:28:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2127974799441698082=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests/intel/kms=5Fpm=5Fback?=
 =?utf-8?q?light=3A_Remove_eDP_check_for_backlight?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 27 Sep 2024 06:28:00 -0000
Message-ID: <172741848059.1109838.2497546690392775097@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240926194507.701146-1-mohammed.thasleem@intel.com>
In-Reply-To: <20240926194507.701146-1-mohammed.thasleem@intel.com>
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

--===============2127974799441698082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_pm_backlight: Remove eDP check for backlight
URL   : https://patchwork.freedesktop.org/series/139172/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15451_full -> IGTPW_11818_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11818_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11818_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/index.html

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): shard-glk 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11818_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_joiner@invalid-modeset-force-joiner:
    - shard-dg2:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-10/igt@kms_big_joiner@invalid-modeset-force-joiner.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-5/igt@kms_big_joiner@invalid-modeset-force-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][3] +7 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@kms_big_joiner@invalid-modeset-force-joiner.html

  * igt@kms_cursor_crc@cursor-dpms:
    - shard-tglu:         [PASS][4] -> [SKIP][5] +38 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-4/igt@kms_cursor_crc@cursor-dpms.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_cursor_crc@cursor-dpms.html

  * igt@kms_cursor_crc@cursor-random-256x256@pipe-d-edp-1:
    - shard-mtlp:         [PASS][6] -> [FAIL][7] +3 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-mtlp-4/igt@kms_cursor_crc@cursor-random-256x256@pipe-d-edp-1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-8/igt@kms_cursor_crc@cursor-random-256x256@pipe-d-edp-1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][9] +11 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][10] +7 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-15/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][11] +12 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-6/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@perf@non-zero-reason:
    - shard-dg2:          NOTRUN -> [FAIL][12] +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-6/igt@perf@non-zero-reason.html

  * igt@perf_pmu@busy-idle-check-all:
    - shard-dg1:          [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg1-13/igt@perf_pmu@busy-idle-check-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-12/igt@perf_pmu@busy-idle-check-all.html

  * igt@perf_pmu@busy-idle-check-all@vecs1:
    - shard-dg2:          [PASS][15] -> [FAIL][16] +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-11/igt@perf_pmu@busy-idle-check-all@vecs1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@perf_pmu@busy-idle-check-all@vecs1.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-tglu:         [SKIP][17] ([i915#5286]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-4/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-tglu:         [SKIP][19] ([i915#6095]) -> [SKIP][20] +6 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-10/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-tglu:         [SKIP][21] ([i915#12042]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu:         [SKIP][23] ([i915#3116] / [i915#3299]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-7/igt@kms_content_protection@dp-mst-type-1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-tglu:         [SKIP][25] ([i915#3555]) -> [SKIP][26] +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-3/igt@kms_cursor_crc@cursor-random-32x32.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-tglu:         [SKIP][27] ([i915#11453]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-tglu:         [SKIP][29] ([i915#9067]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu:         [SKIP][31] ([i915#4103]) -> [SKIP][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-tglu:         [SKIP][33] ([i915#3555] / [i915#3840]) -> [SKIP][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-9/igt@kms_dsc@dsc-with-output-formats.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][35] ([i915#5354]) -> [SKIP][36] +13 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu:         [SKIP][37] ([i915#1849]) -> [SKIP][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglu:         [SKIP][39] ([i915#3555] / [i915#8228]) -> [SKIP][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-9/igt@kms_hdr@static-toggle-dpms.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
    - shard-dg1:          [SKIP][41] ([i915#4423]) -> [SKIP][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg1-12/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-19/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
    - {shard-tglu-1}:     NOTRUN -> [SKIP][43] +105 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15451_full and IGTPW_11818_full:

### New IGT tests (28) ###

  * igt@kms_cursor_crc@cursor-rapid-movement-64x64@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-d-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_lease@cursor-implicit-plane@pipe-d-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_lease@lease-again@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@lease-again@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@lease-again@pipe-d-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@lease-get@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@lease-get@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@lease-get@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@lease-get@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_lease@lease-invalid-crtc@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-crtc@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-crtc@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-invalid-crtc@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-unleased-connector@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_lease@lease-unleased-connector@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@kms_lease@lease-unleased-connector@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@kms_lease@lease-unleased-connector@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_lease@lease-unleased-connector@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@kms_lease@lease-unleased-connector@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@kms_lease@lease-unleased-connector@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_lease@lease-unleased-connector@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@kms_lease@lease-unleased-connector@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@kms_lease@lease-unleased-connector@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_lease@lease-unleased-connector@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@kms_lease@lease-unleased-connector@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@kms_lease@lease-unleased-crtc@pipe-d-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@lessee-list@pipe-d-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_11818_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#8411])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-7/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@drm_fdinfo@most-busy-idle-check-all:
    - shard-rkl:          [PASS][45] -> [FAIL][46] ([i915#12179])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-1/igt@drm_fdinfo@most-busy-idle-check-all.html

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [PASS][47] -> [FAIL][48] ([i915#7742])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-1/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@drm_fdinfo@virtual-busy-hang-all:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#8414])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-7/igt@drm_fdinfo@virtual-busy-hang-all.html

  * igt@drm_fdinfo@virtual-busy-idle:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#8414]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@drm_fdinfo@virtual-busy-idle.html
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#8414]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-19/igt@drm_fdinfo@virtual-busy-idle.html

  * igt@fbdev@pan:
    - shard-tglu:         [PASS][52] -> [SKIP][53] ([i915#2582])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-2/igt@fbdev@pan.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@fbdev@pan.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][54] ([i915#9323])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-10/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#3555] / [i915#9323]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#9323])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#7697])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#8562])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#8555])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-5/igt@gem_ctx_persistence@hang.html
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#8555])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-12/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#280])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#280])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-18/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#280])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-1/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-rkl:          NOTRUN -> [ABORT][64] ([i915#7975] / [i915#8213])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-1/igt@gem_eio@hibernate.html

  * igt@gem_eio@reset-stress:
    - shard-dg2:          [PASS][65] -> [FAIL][66] ([i915#5784])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-5/igt@gem_eio@reset-stress.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4771])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-4/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@hog:
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4812])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-4/igt@gem_exec_balancer@hog.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#4525]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_big@single:
    - shard-tglu:         NOTRUN -> [ABORT][70] ([i915#11713])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-2/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#6334]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@gem_exec_capture@capture-invisible.html
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#6334]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-19/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_fair@basic-none-share:
    - shard-rkl:          NOTRUN -> [FAIL][73] ([i915#2842]) +3 other tests fail
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-5/igt@gem_exec_fair@basic-none-share.html

  * igt@gem_exec_fair@basic-pace-share:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#3539] / [i915#4852]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-4/igt@gem_exec_fair@basic-pace-share.html
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#3539] / [i915#4852]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-14/igt@gem_exec_fair@basic-pace-share.html
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4473] / [i915#4771])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-4/igt@gem_exec_fair@basic-pace-share.html

  * igt@gem_exec_fair@basic-pace-solo:
    - shard-tglu:         NOTRUN -> [FAIL][77] ([i915#2842]) +1 other test fail
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-5/igt@gem_exec_fair@basic-pace-solo.html

  * igt@gem_exec_fence@concurrent:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4812]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_reloc@basic-gtt-read-active:
    - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#3281]) +11 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-read-active.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#3281]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-14/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_reloc@basic-write-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#3281]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@gem_exec_reloc@basic-write-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-write-wc-active:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#3281])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-3/igt@gem_exec_reloc@basic-write-wc-active.html

  * igt@gem_exec_schedule@pi-ringfull@vecs0:
    - shard-rkl:          NOTRUN -> [FAIL][83] ([i915#12296]) +9 other tests fail
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-6/igt@gem_exec_schedule@pi-ringfull@vecs0.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4812]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-12/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4537] / [i915#4812]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#4860]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-1/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#2190])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-5/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#4613]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#4613]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          NOTRUN -> [TIMEOUT][90] ([i915#5493]) +1 other test timeout
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#12193])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-16/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#4565])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-16/igt@gem_lmem_swapping@verify-ccs@lmem0.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#3282])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-1/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#284])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-7/igt@gem_media_vme.html

  * igt@gem_mmap@big-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#4083]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-4/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@close-race:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4077]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-13/igt@gem_mmap_gtt@close-race.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#4077]) +5 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-7/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@coherency:
    - shard-snb:          [PASS][98] -> [INCOMPLETE][99] ([i915#2295])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-snb6/igt@gem_mmap_wc@coherency.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-snb1/igt@gem_mmap_wc@coherency.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#4083]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@gem_mmap_wc@copy.html
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#4083]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-13/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@set-cache-level:
    - shard-tglu:         [PASS][102] -> [SKIP][103] ([i915#1850])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-7/igt@gem_mmap_wc@set-cache-level.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@gem_mmap_wc@set-cache-level.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#3282]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-6/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_pwrite_snooped:
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#3282]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-13/igt@gem_pwrite_snooped.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#4270])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-3/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#4270]) +4 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#4270]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-6/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#4270]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-3/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#4270]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-14/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_render_copy@y-tiled-ccs-to-linear:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#5190] / [i915#8428]) +4 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-4/igt@gem_render_copy@y-tiled-ccs-to-linear.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#8411]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#3282]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-2/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#3297]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-4/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#3282] / [i915#3297])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#3297])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-14/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#3297]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#3281] / [i915#3297])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglu:         NOTRUN -> [SKIP][119] ([i915#3297])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-9/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-rkl:          NOTRUN -> [SKIP][120] +33 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#2527])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-18/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#2527] / [i915#2856])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-2/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#2527]) +6 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#2856]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-6/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [PASS][125] -> [ABORT][126] ([i915#9820])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-rkl-7/igt@i915_module_load@reload-with-fault-injection.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          NOTRUN -> [ABORT][127] ([i915#9820])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#8399])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-10/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-mtlp:         NOTRUN -> [SKIP][129] +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#6621])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-5/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#4387])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-1/igt@i915_pm_sseu@full-enable.html
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#4387])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-15/igt@i915_pm_sseu@full-enable.html
    - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#4387])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@i915_pm_sseu@full-enable.html
    - shard-mtlp:         NOTRUN -> [SKIP][134] ([i915#8437])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-5/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#5723])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-9/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [PASS][136] -> [ABORT][137] ([i915#12216]) +1 other test abort
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-mtlp-4/igt@i915_selftest@live@workarounds.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-1/igt@i915_selftest@live@workarounds.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#4212]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-8/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#5190])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][140] ([i915#8709]) +7 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#8709]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#8709]) +11 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-dg1:          [PASS][143] -> [DMESG-WARN][144] ([i915#1982] / [i915#4423])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg1-17/igt@kms_async_flips@test-time-stamp.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-19/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_async_flips@test-time-stamp@pipe-a-hdmi-a-4:
    - shard-dg1:          [PASS][145] -> [DMESG-WARN][146] ([i915#4423]) +1 other test dmesg-warn
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg1-17/igt@kms_async_flips@test-time-stamp@pipe-a-hdmi-a-4.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-19/igt@kms_async_flips@test-time-stamp@pipe-a-hdmi-a-4.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-mtlp:         NOTRUN -> [SKIP][147] ([i915#3555])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#9531])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#9531])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-12/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-snb:          [PASS][150] -> [FAIL][151] ([i915#5956]) +1 other test fail
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-snb5/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-snb7/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-dg2:          [PASS][152] -> [SKIP][153] ([i915#9197]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-8/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#4538] / [i915#5286]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-19/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#5286]) +6 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#5286]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#3638]) +3 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#4538] / [i915#5190]) +6 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#4538]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][160] +44 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#6095]) +62 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-7/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#6095]) +106 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#10307] / [i915#6095]) +197 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#12042])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#6095]) +9 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#6095]) +122 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#7213]) +3 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#4087]) +3 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-5/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#7828]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-4/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#7828]) +5 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-17/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#7828]) +13 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#7828]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#7828]) +6 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-8/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_content_protection@atomic:
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#7116] / [i915#9424])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-13/igt@kms_content_protection@atomic.html
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#7118] / [i915#9424])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-4/igt@kms_content_protection@atomic.html
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#7118] / [i915#9424])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#3116]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@kms_content_protection@dp-mst-type-0.html
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#3299])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-1/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#9424])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#7118])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-5/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#11453]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#11453] / [i915#3359])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-10/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#11453])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-13/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#3555]) +12 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-snb:          NOTRUN -> [SKIP][186] +120 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-snb5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#11453])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#3555]) +2 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglu:         NOTRUN -> [SKIP][189] ([i915#4103])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#9809])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#4213])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#4103] / [i915#4213])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#4103] / [i915#4213])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-12/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#4103])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#3555])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#3804])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev:
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#1257])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-2/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#3555] / [i915#3840])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-16/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#3840] / [i915#9688])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-11/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#3840])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#3555] / [i915#3840])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#3555] / [i915#3840])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#3469])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-1/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#3955])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#3637]) +6 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-5/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][206] +13 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][207] ([i915#3637])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-3/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@basic-plain-flip:
    - shard-tglu:         [PASS][208] -> [SKIP][209] ([i915#3637]) +3 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-7/igt@kms_flip@basic-plain-flip.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_flip@basic-plain-flip.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#8381])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-6/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-vga1:
    - shard-snb:          [PASS][211] -> [FAIL][212] ([i915#2122]) +4 other tests fail
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-snb4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-vga1.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-snb7/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-vga1.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-mtlp:         [PASS][213] -> [FAIL][214] ([i915#2122]) +3 other tests fail
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-mtlp-6/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-8/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][215] ([i915#2122])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a2.html

  * igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][216] ([i915#11989])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a2.html

  * igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1:
    - shard-tglu:         [PASS][217] -> [FAIL][218] ([i915#2122]) +9 other tests fail
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-2/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-7/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#2672] / [i915#3555]) +6 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#2672]) +6 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#2587] / [i915#2672]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#2672] / [i915#3555]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][223] ([i915#2587] / [i915#2672] / [i915#3555])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#2672]) +3 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#2672] / [i915#3555]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-19/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][226] ([i915#2587] / [i915#2672]) +5 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][228] ([i915#2672] / [i915#3555] / [i915#8813])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#2672])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#2672] / [i915#3555]) +2 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-tglu:         [PASS][231] -> [SKIP][232] ([i915#1849]) +4 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg1:          NOTRUN -> [SKIP][233] +22 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-snb:          [PASS][234] -> [SKIP][235] +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#3458]) +10 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#10433] / [i915#3458])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#5354]) +22 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#3458]) +8 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#3023]) +32 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#1825]) +54 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
    - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#1825]) +2 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#1849]) +5 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#3555] / [i915#8228])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-3/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#3555] / [i915#8228])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#3555] / [i915#8228]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#3555] / [i915#8228])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-13/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_invalid_mode@zero-hdisplay:
    - shard-tglu:         [PASS][248] -> [SKIP][249] ([i915#3555]) +2 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-4/igt@kms_invalid_mode@zero-hdisplay.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_invalid_mode@zero-hdisplay.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#6301])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-panning-bottom-right:
    - shard-tglu:         [PASS][251] -> [SKIP][252] ([i915#8825])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-9/igt@kms_plane@plane-panning-bottom-right.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_plane@plane-panning-bottom-right.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#7294])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-tglu:         [PASS][254] -> [SKIP][255] ([i915#7294]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-4/igt@kms_plane_alpha_blend@alpha-transparent-fb.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          [PASS][256] -> [SKIP][257] ([i915#6953] / [i915#9423])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-5/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#12247]) +12 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - shard-tglu:         [PASS][259] -> [SKIP][260] ([i915#8152]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:
    - shard-tglu:         [PASS][261] -> [SKIP][262] ([i915#12247]) +5 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-5/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#12247]) +2 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#12247] / [i915#8152]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#12247] / [i915#3555] / [i915#9423])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#12247] / [i915#3555])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#12247]) +3 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#12247] / [i915#6953])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#12247] / [i915#6953]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-19/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
    - shard-mtlp:         NOTRUN -> [SKIP][270] ([i915#12247] / [i915#6953])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#12247]) +7 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-19/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html
    - shard-mtlp:         NOTRUN -> [SKIP][272] ([i915#12247]) +3 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][273] ([i915#9812]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#5354])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-18/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#9293])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-2/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#9685]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-2/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#8430])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#8430])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-18/igt@kms_pm_lpsp@screens-disabled.html
    - shard-mtlp:         NOTRUN -> [SKIP][279] ([i915#8430])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-1/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#8430])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-11/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          [PASS][281] -> [SKIP][282] ([i915#9519])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#9519])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#9519])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg1:          NOTRUN -> [SKIP][285] ([i915#9519])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#6524]) +2 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-2/igt@kms_prime@basic-modeset-hybrid.html
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#6524])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-13/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#9683])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#1072] / [i915#9732]) +25 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-1/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][290] ([i915#9688])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-4/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_psr@fbc-psr-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#1072] / [i915#9732]) +8 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-4/igt@kms_psr@fbc-psr-primary-mmap-gtt.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][292] ([i915#9732]) +12 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-5/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#1072] / [i915#9732]) +8 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-17/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][294] ([i915#9685])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#9685]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-14/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][296] ([i915#5289]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#5289])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#5289])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_vrr@flip-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#3555])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-19/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@max-min:
    - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#9906])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][301] ([i915#9906])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-9/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-check-output:
    - shard-rkl:          NOTRUN -> [SKIP][302] ([i915#2437])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-5/igt@kms_writeback@writeback-check-output.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#2436])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-accuracy-98@vcs0:
    - shard-rkl:          [PASS][304] -> [FAIL][305] ([i915#4349]) +1 other test fail
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-rkl-3/igt@perf_pmu@busy-accuracy-98@vcs0.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@perf_pmu@busy-accuracy-98@vcs0.html

  * igt@perf_pmu@busy-idle-check-all@ccs0:
    - shard-mtlp:         [PASS][306] -> [FAIL][307] ([i915#4349]) +3 other tests fail
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-mtlp-3/igt@perf_pmu@busy-idle-check-all@ccs0.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-3/igt@perf_pmu@busy-idle-check-all@ccs0.html

  * igt@perf_pmu@busy-idle-check-all@vcs0:
    - shard-dg2:          [PASS][308] -> [FAIL][309] ([i915#4349]) +3 other tests fail
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-11/igt@perf_pmu@busy-idle-check-all@vcs0.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@perf_pmu@busy-idle-check-all@vcs0.html

  * igt@perf_pmu@busy-idle-check-all@vecs0:
    - shard-dg1:          [PASS][310] -> [FAIL][311] ([i915#4349]) +2 other tests fail
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg1-13/igt@perf_pmu@busy-idle-check-all@vecs0.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-12/igt@perf_pmu@busy-idle-check-all@vecs0.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#8516])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-5/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_mmap_kms@buffer-sharing:
    - shard-tglu:         [PASS][313] -> [SKIP][314]
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-6/igt@prime_mmap_kms@buffer-sharing.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@prime_mmap_kms@buffer-sharing.html

  * igt@prime_vgem@coherency-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#3708])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-5/igt@prime_vgem@coherency-gtt.html

  * igt@syncobj_wait@invalid-wait-zero-handles:
    - shard-rkl:          NOTRUN -> [FAIL][316] ([i915#9781])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@syncobj_wait@invalid-wait-zero-handles.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@most-busy-check-all:
    - shard-rkl:          [FAIL][317] ([i915#12179]) -> [PASS][318]
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@drm_fdinfo@most-busy-check-all.html

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          [FAIL][319] ([i915#7742]) -> [PASS][320]
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@gem_ctx_engines@invalid-engines:
    - shard-tglu:         [FAIL][321] ([i915#12027]) -> [PASS][322]
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-6/igt@gem_ctx_engines@invalid-engines.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-7/igt@gem_ctx_engines@invalid-engines.html
    - shard-mtlp:         [FAIL][323] ([i915#12031]) -> [PASS][324]
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-mtlp-3/igt@gem_ctx_engines@invalid-engines.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-8/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][325] ([i915#5784]) -> [PASS][326]
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg1-19/igt@gem_eio@unwedge-stress.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-19/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-rkl:          [FAIL][327] ([i915#2842]) -> [PASS][328]
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-rkl-4/igt@gem_exec_fair@basic-pace@vcs0.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [ABORT][329] ([i915#9820]) -> [PASS][330]
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         [ABORT][331] ([i915#9820]) -> [PASS][332]
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          [FAIL][333] ([i915#3591]) -> [PASS][334] +1 other test pass
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [INCOMPLETE][335] ([i915#7790]) -> [PASS][336]
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-snb1/igt@i915_pm_rps@reset.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-snb4/igt@i915_pm_rps@reset.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-snb:          [ABORT][337] -> [PASS][338]
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-snb6/igt@i915_suspend@basic-s2idle-without-i915.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-snb4/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-rkl:          [ABORT][339] ([i915#10354]) -> [PASS][340]
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-rkl-2/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-tglu:         [SKIP][341] -> [PASS][342] +31 other tests pass
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg1:          [INCOMPLETE][343] ([i915#9878]) -> [PASS][344]
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg1-19/igt@kms_fbcon_fbt@fbc-suspend.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-13/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-snb:          [INCOMPLETE][345] ([i915#9878]) -> [PASS][346]
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-snb5/igt@kms_fbcon_fbt@fbc-suspend.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-snb4/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-dg2:          [SKIP][347] ([i915#1849]) -> [PASS][348]
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_fbcon_fbt@fbc-suspend.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-10/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [FAIL][349] ([i915#2122]) -> [PASS][350] +1 other test pass
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-snb7/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-snb4/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg1:          [INCOMPLETE][351] ([i915#4839] / [i915#6113]) -> [PASS][352]
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg1-12/igt@kms_flip@flip-vs-suspend-interruptible.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-17/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-dg2:          [INCOMPLETE][353] ([i915#4839] / [i915#6113]) -> [PASS][354] +1 other test pass
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-5/igt@kms_flip@flip-vs-suspend-interruptible.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-tglu:         [SKIP][355] ([i915#3637]) -> [PASS][356] +1 other test pass
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_flip@plain-flip-ts-check.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - shard-dg2:          [SKIP][357] ([i915#3555]) -> [PASS][358] +1 other test pass
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite:
    - shard-tglu:         [SKIP][359] ([i915#1849]) -> [PASS][360] +16 other tests pass
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][361] ([i915#5354]) -> [PASS][362] +9 other tests pass
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-dg2:          [FAIL][363] ([i915#6880]) -> [PASS][364] +1 other test pass
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-snb:          [SKIP][365] -> [PASS][366] +1 other test pass
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          [SKIP][367] ([i915#3555] / [i915#8228]) -> [PASS][368]
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-8/igt@kms_hdr@static-toggle.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-10/igt@kms_hdr@static-toggle.html

  * igt@kms_invalid_mode@bad-vsync-start:
    - shard-tglu:         [SKIP][369] ([i915#3555]) -> [PASS][370] +3 other tests pass
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_invalid_mode@bad-vsync-start.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-9/igt@kms_invalid_mode@bad-vsync-start.html

  * igt@kms_plane@planar-pixel-format-settings:
    - shard-dg2:          [SKIP][371] ([i915#9581]) -> [PASS][372]
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_plane@planar-pixel-format-settings.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-10/igt@kms_plane@planar-pixel-format-settings.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
    - shard-dg2:          [SKIP][373] ([i915#3555] / [i915#8152] / [i915#9423]) -> [PASS][374]
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b:
    - shard-dg2:          [SKIP][375] ([i915#12247]) -> [PASS][376] +5 other tests pass
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d:
    - shard-dg2:          [SKIP][377] ([i915#8152]) -> [PASS][378]
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - shard-tglu:         [SKIP][379] ([i915#8152]) -> [PASS][380] +2 other tests pass
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-b:
    - shard-tglu:         [SKIP][381] ([i915#12247]) -> [PASS][382] +2 other tests pass
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-b.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:
    - shard-dg2:          [SKIP][383] ([i915#12247] / [i915#3558] / [i915#8152] / [i915#9423]) -> [PASS][384]
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-d:
    - shard-dg2:          [SKIP][385] ([i915#12247] / [i915#8152]) -> [PASS][386]
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-d.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-d.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [SKIP][387] ([i915#9519]) -> [PASS][388]
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_pm_rpm@dpms-lpsp.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [SKIP][389] ([i915#9519]) -> [PASS][390] +2 other tests pass
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_properties@plane-properties-atomic:
    - shard-dg2:          [SKIP][391] ([i915#11521]) -> [PASS][392]
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_properties@plane-properties-atomic.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-1/igt@kms_properties@plane-properties-atomic.html

  * igt@kms_setmode@basic:
    - shard-dg1:          [FAIL][393] ([i915#5465]) -> [PASS][394] +2 other tests pass
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg1-15/igt@kms_setmode@basic.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-19/igt@kms_setmode@basic.html
    - shard-dg2:          [FAIL][395] ([i915#5465]) -> [PASS][396]
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-8/igt@kms_setmode@basic.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-1/igt@kms_setmode@basic.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2:          [SKIP][397] ([i915#9197]) -> [PASS][398] +28 other tests pass
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          [FAIL][399] ([i915#11943]) -> [PASS][400]
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@perf_pmu@all-busy-idle-check-all.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@perf_pmu@all-busy-idle-check-all.html
    - shard-dg1:          [FAIL][401] ([i915#11943]) -> [PASS][402]
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg1-15/igt@perf_pmu@all-busy-idle-check-all.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-13/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@rc6:
    - shard-dg1:          [DMESG-WARN][403] ([i915#4423]) -> [PASS][404] +2 other tests pass
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg1-13/igt@perf_pmu@rc6.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-17/igt@perf_pmu@rc6.html

  * igt@prime_mmap_kms@buffer-sharing:
    - shard-dg2:          [SKIP][405] -> [PASS][406] +1 other test pass
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@prime_mmap_kms@buffer-sharing.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-1/igt@prime_mmap_kms@buffer-sharing.html

  
#### Warnings ####

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [ABORT][407] ([i915#10131] / [i915#10887] / [i915#9820]) -> [ABORT][408] ([i915#10131] / [i915#9820])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglu:         [FAIL][409] ([i915#3591]) -> [WARN][410] ([i915#2681]) +1 other test warn
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_selftest@mock:
    - shard-dg2:          [DMESG-WARN][411] ([i915#9311]) -> [DMESG-WARN][412] ([i915#1982] / [i915#9311])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-1/igt@i915_selftest@mock.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-4/igt@i915_selftest@mock.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu:         [SKIP][413] -> [SKIP][414] ([i915#1769] / [i915#3555])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg2:          [SKIP][415] ([i915#1769] / [i915#3555]) -> [SKIP][416] ([i915#9197])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-tglu:         [SKIP][417] -> [SKIP][418] ([i915#5286]) +1 other test skip
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2:          [SKIP][419] ([i915#9197]) -> [SKIP][420]
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-10/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg2:          [SKIP][421] ([i915#5190] / [i915#9197]) -> [SKIP][422] ([i915#4538] / [i915#5190]) +4 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2:          [SKIP][423] ([i915#9197]) -> [SKIP][424] ([i915#12042])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-7/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-tglu:         [SKIP][425] -> [SKIP][426] ([i915#6095]) +6 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2:          [SKIP][427] ([i915#9197]) -> [SKIP][428] ([i915#10307] / [i915#6095]) +2 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-tglu:         [SKIP][429] -> [SKIP][430] ([i915#12042])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          [SKIP][431] ([i915#9197]) -> [SKIP][432] ([i915#11616] / [i915#7213])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_cdclk@mode-transition-all-outputs.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_color@deep-color:
    - shard-tglu:         [SKIP][433] -> [SKIP][434] ([i915#3555] / [i915#9979])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_color@deep-color.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-5/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu:         [SKIP][435] -> [SKIP][436] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_content_protection@atomic-dpms.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          [SKIP][437] ([i915#9197]) -> [SKIP][438] ([i915#7118] / [i915#9424])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_content_protection@legacy.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-1:
    - shard-tglu:         [SKIP][439] -> [SKIP][440] ([i915#6944] / [i915#9424])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_content_protection@lic-type-1.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-9/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          [SKIP][441] ([i915#9197]) -> [SKIP][442] ([i915#9424])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_content_protection@mei-interface.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          [SKIP][443] ([i915#9197]) -> [SKIP][444] ([i915#11453]) +2 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_cursor_crc@cursor-random-512x170.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/index.html

--===============2127974799441698082==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_pm_backlight: Remove eDP check for backlight</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139172/">https://patchwork.freedesktop.org/series/139172/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15451_full -&gt; IGTPW_11818_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11818_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11818_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/index.html</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): shard-glk </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11818_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_joiner@invalid-modeset-force-joiner:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-10/igt@kms_big_joiner@invalid-modeset-force-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-5/igt@kms_big_joiner@invalid-modeset-force-joiner.html">SKIP</a></li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@kms_big_joiner@invalid-modeset-force-joiner.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-4/igt@kms_cursor_crc@cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_cursor_crc@cursor-dpms.html">SKIP</a> +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x256@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-mtlp-4/igt@kms_cursor_crc@cursor-random-256x256@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-8/igt@kms_cursor_crc@cursor-random-256x256@pipe-d-edp-1.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-15/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-6/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-6/igt@perf@non-zero-reason.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg1-13/igt@perf_pmu@busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-12/igt@perf_pmu@busy-idle-check-all.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vecs1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-11/igt@perf_pmu@busy-idle-check-all@vecs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@perf_pmu@busy-idle-check-all@vecs1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-4/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> ([i915#5286]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-10/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html">SKIP</a> ([i915#6095]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12042]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-7/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3116] / [i915#3299]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-3/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> ([i915#11453]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> ([i915#9067]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> ([i915#4103]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-9/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> ([i915#1849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-9/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#3555] / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_hdr@static-toggle-dpms.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg1-12/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html">SKIP</a> ([i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-19/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:<ul>
<li>{shard-tglu-1}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html">SKIP</a> +105 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_15451_full and IGTPW_11818_full:</p>
<h3>New IGT tests (28)</h3>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x64@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11818_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-7/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-1/igt@drm_fdinfo@most-busy-idle-check-all.html">FAIL</a> ([i915#12179])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-1/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">FAIL</a> ([i915#7742])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-hang-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-7/igt@drm_fdinfo@virtual-busy-hang-all.html">SKIP</a> ([i915#8414])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@drm_fdinfo@virtual-busy-idle.html">SKIP</a> ([i915#8414]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-19/igt@drm_fdinfo@virtual-busy-idle.html">SKIP</a> ([i915#8414]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-2/igt@fbdev@pan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@fbdev@pan.html">SKIP</a> ([i915#2582])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-10/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> ([i915#3555] / [i915#9323]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-5/igt@gem_ctx_persistence@hang.html">SKIP</a> ([i915#8555])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-12/igt@gem_ctx_persistence@hang.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-18/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-1/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-1/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-5/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-4/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@hog:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-4/igt@gem_exec_balancer@hog.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> ([i915#4525]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-2/igt@gem_exec_big@single.html">ABORT</a> ([i915#11713])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@gem_exec_capture@capture-invisible.html">SKIP</a> ([i915#6334]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-19/igt@gem_exec_capture@capture-invisible.html">SKIP</a> ([i915#6334]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-5/igt@gem_exec_fair@basic-none-share.html">FAIL</a> ([i915#2842]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-4/igt@gem_exec_fair@basic-pace-share.html">SKIP</a> ([i915#3539] / [i915#4852]) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-14/igt@gem_exec_fair@basic-pace-share.html">SKIP</a> ([i915#3539] / [i915#4852]) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-4/igt@gem_exec_fair@basic-pace-share.html">SKIP</a> ([i915#4473] / [i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-5/igt@gem_exec_fair@basic-pace-solo.html">FAIL</a> ([i915#2842]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@concurrent:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@gem_exec_fence@concurrent.html">SKIP</a> ([i915#4812]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read-active:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-read-active.html">SKIP</a> ([i915#3281]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-14/igt@gem_exec_reloc@basic-wc-read.html">SKIP</a> ([i915#3281]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@gem_exec_reloc@basic-write-gtt-noreloc.html">SKIP</a> ([i915#3281]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-active:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-3/igt@gem_exec_reloc@basic-write-wc-active.html">SKIP</a> ([i915#3281])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@pi-ringfull@vecs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-6/igt@gem_exec_schedule@pi-ringfull@vecs0.html">FAIL</a> ([i915#12296]) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-12/igt@gem_exec_schedule@preempt-queue.html">SKIP</a> ([i915#4812]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> ([i915#4537] / [i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-1/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-5/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> ([i915#4613]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([i915#4613]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> ([i915#5493]) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-16/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> ([i915#12193])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-16/igt@gem_lmem_swapping@verify-ccs@lmem0.html">SKIP</a> ([i915#4565])</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-1/igt@gem_madvise@dontneed-before-pwrite.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-7/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@big-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-4/igt@gem_mmap@big-bo.html">SKIP</a> ([i915#4083]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@close-race:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-13/igt@gem_mmap_gtt@close-race.html">SKIP</a> ([i915#4077]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-7/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</a> ([i915#4077]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@coherency:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-snb6/igt@gem_mmap_wc@coherency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-snb1/igt@gem_mmap_wc@coherency.html">INCOMPLETE</a> ([i915#2295])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@gem_mmap_wc@copy.html">SKIP</a> ([i915#4083]) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-13/igt@gem_mmap_wc@copy.html">SKIP</a> ([i915#4083]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@set-cache-level:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-7/igt@gem_mmap_wc@set-cache-level.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@gem_mmap_wc@set-cache-level.html">SKIP</a> ([i915#1850])</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-6/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#3282]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite_snooped:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-13/igt@gem_pwrite_snooped.html">SKIP</a> ([i915#3282]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-3/igt@gem_pxp@create-regular-context-1.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-6/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> ([i915#4270]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-3/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-14/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-linear:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-4/igt@gem_render_copy@y-tiled-ccs-to-linear.html">SKIP</a> ([i915#5190] / [i915#8428]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> ([i915#8411]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-2/igt@gem_tiled_partial_pwrite_pread@writes.html">SKIP</a> ([i915#3282]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-4/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> ([i915#3282] / [i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-14/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@gem_userptr_blits@relocations.html">SKIP</a> ([i915#3281] / [i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-9/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@gen7_exec_parse@chained-batch.html">SKIP</a> +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-18/igt@gen9_exec_parse@bb-chained.html">SKIP</a> ([i915#2527])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-2/igt@gen9_exec_parse@bb-large.html">SKIP</a> ([i915#2527] / [i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> ([i915#2527]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-6/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-rkl-7/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-10/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-5/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> ([i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-1/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-15/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-5/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#8437])</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-9/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> ([i915#5723])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-mtlp-4/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-1/igt@i915_selftest@live@workarounds.html">ABORT</a> ([i915#12216]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-8/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> ([i915#4212]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> ([i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs.html">SKIP</a> ([i915#8709]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs.html">SKIP</a> ([i915#8709]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg1-17/igt@kms_async_flips@test-time-stamp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-19/igt@kms_async_flips@test-time-stamp.html">DMESG-WARN</a> ([i915#1982] / [i915#4423])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg1-17/igt@kms_async_flips@test-time-stamp@pipe-a-hdmi-a-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-19/igt@kms_async_flips@test-time-stamp@pipe-a-hdmi-a-4.html">DMESG-WARN</a> ([i915#4423]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#3555])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-12/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-snb5/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-snb7/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> ([i915#5956]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-8/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> ([i915#9197]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-19/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">SKIP</a> ([i915#4538] / [i915#5286]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#5286]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> ([i915#5286]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> ([i915#3638]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> ([i915#4538] / [i915#5190]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([i915#4538]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-7/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#6095]) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#6095]) +106 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#6095]) +197 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12042])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1.html">SKIP</a> ([i915#6095]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3.html">SKIP</a> ([i915#6095]) +122 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#7213]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-5/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html">SKIP</a> ([i915#4087]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-4/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> ([i915#7828]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-17/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> ([i915#7828]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> ([i915#7828]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> ([i915#7828]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-8/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html">SKIP</a> ([i915#7828]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-13/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#7116] / [i915#9424])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-4/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-1/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3116]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-1/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@kms_content_protection@lic-type-0.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-5/igt@kms_content_protection@srm.html">SKIP</a> ([i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([i915#11453]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-10/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#11453] / [i915#3359])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-13/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#11453])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#3555]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-snb5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> +120 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> ([i915#11453])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> ([i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> ([i915#9809])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4213])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-12/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-2/igt@kms_dp_aux_dev.html">SKIP</a> ([i915#1257])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-16/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-11/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> ([i915#3840] / [i915#9688])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_dsc@dsc-with-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-1/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([i915#3469])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([i915#3955])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-5/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> ([i915#3637]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-3/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> ([i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-7/igt@kms_flip@basic-plain-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_flip@basic-plain-flip.html">SKIP</a> ([i915#3637]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-6/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-snb4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-snb7/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-vga1.html">FAIL</a> ([i915#2122]) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-mtlp-6/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-8/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">FAIL</a> ([i915#2122]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a2.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a2.html">FAIL</a> ([i915#11989])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-2/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-7/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1.html">FAIL</a> ([i915#2122]) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-19/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#8813])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">SKIP</a> ([i915#1849]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#3458]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> ([i915#10433] / [i915#3458])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a> ([i915#5354]) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> ([i915#3458]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> ([i915#3023]) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> ([i915#1825]) +54 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> ([i915#1825]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#1849]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-3/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-13/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-4/igt@kms_invalid_mode@zero-hdisplay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_invalid_mode@zero-hdisplay.html">SKIP</a> ([i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-1/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-9/igt@kms_plane@plane-panning-bottom-right.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_plane@plane-panning-bottom-right.html">SKIP</a> ([i915#8825])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_plane_alpha_blend@alpha-opaque-fb.html">SKIP</a> ([i915#7294])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-4/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">SKIP</a> ([i915#7294]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-5/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> ([i915#6953] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html">SKIP</a> ([i915#12247]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">SKIP</a> ([i915#8152]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-5/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html">SKIP</a> ([i915#12247]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html">SKIP</a> ([i915#12247]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555] / [i915#9423])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d.html">SKIP</a> ([i915#12247]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-19/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-19/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> ([i915#12247]) +7 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> ([i915#12247]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> ([i915#9812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-18/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-2/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> ([i915#9293])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-2/igt@kms_pm_dc@dc5-psr.html">SKIP</a> ([i915#9685]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#8430])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-18/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#8430])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-1/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#8430])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-11/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#8430])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-4/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-2/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-13/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-1/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> ([i915#1072] / [i915#9732]) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-4/igt@kms_psr@fbc-pr-primary-page-flip.html">SKIP</a> ([i915#9688])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-4/igt@kms_psr@fbc-psr-primary-mmap-gtt.html">SKIP</a> ([i915#1072] / [i915#9732]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-5/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> ([i915#9732]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-17/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> ([i915#1072] / [i915#9732]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-14/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> ([i915#9685]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> ([i915#5289]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-19/igt@kms_vrr@flip-suspend.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@kms_vrr@max-min.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-9/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-5/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2436])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-98@vcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-rkl-3/igt@perf_pmu@busy-accuracy-98@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@perf_pmu@busy-accuracy-98@vcs0.html">FAIL</a> ([i915#4349]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-mtlp-3/igt@perf_pmu@busy-idle-check-all@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-3/igt@perf_pmu@busy-idle-check-all@ccs0.html">FAIL</a> ([i915#4349]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-11/igt@perf_pmu@busy-idle-check-all@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@perf_pmu@busy-idle-check-all@vcs0.html">FAIL</a> ([i915#4349]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vecs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg1-13/igt@perf_pmu@busy-idle-check-all@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-12/igt@perf_pmu@busy-idle-check-all@vecs0.html">FAIL</a> ([i915#4349]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-5/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@prime_mmap_kms@buffer-sharing:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-6/igt@prime_mmap_kms@buffer-sharing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-8/igt@prime_mmap_kms@buffer-sharing.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-5/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@invalid-wait-zero-handles:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@syncobj_wait@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-check-all:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all.html">FAIL</a> ([i915#12179]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@drm_fdinfo@most-busy-check-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> ([i915#7742]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-6/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12027]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-7/igt@gem_ctx_engines@invalid-engines.html">PASS</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-mtlp-3/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12031]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-8/igt@gem_ctx_engines@invalid-engines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg1-19/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-19/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-rkl-4/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-7/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">FAIL</a> ([i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-snb1/igt@i915_pm_rps@reset.html">INCOMPLETE</a> ([i915#7790]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-snb4/igt@i915_pm_rps@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-snb6/igt@i915_suspend@basic-s2idle-without-i915.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-snb4/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-rkl-2/igt@kms_big_fb@linear-8bpp-rotate-180.html">ABORT</a> ([i915#10354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-3/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-128x42.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-128x42.html">PASS</a> +31 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg1-19/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#9878]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-13/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-snb5/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#9878]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-snb4/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> ([i915#1849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-10/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-snb7/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-snb4/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg1-12/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> ([i915#4839] / [i915#6113]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-17/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a></li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-5/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> ([i915#4839] / [i915#6113]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-5/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_flip@plain-flip-ts-check.html">SKIP</a> ([i915#3637]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_flip@plain-flip-ts-check.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html">SKIP</a> ([i915#1849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">FAIL</a> ([i915#6880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-8/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#3555] / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-10/igt@kms_hdr@static-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_invalid_mode@bad-vsync-start.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-9/igt@kms_invalid_mode@bad-vsync-start.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_plane@planar-pixel-format-settings.html">SKIP</a> ([i915#9581]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-10/igt@kms_plane@planar-pixel-format-settings.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html">SKIP</a> ([i915#3555] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html">SKIP</a> ([i915#12247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d.html">SKIP</a> ([i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">SKIP</a> ([i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-b:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-b.html">SKIP</a> ([i915#12247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-b.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">SKIP</a> ([i915#12247] / [i915#3558] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_properties@plane-properties-atomic.html">SKIP</a> ([i915#11521]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-1/igt@kms_properties@plane-properties-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg1-15/igt@kms_setmode@basic.html">FAIL</a> ([i915#5465]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-19/igt@kms_setmode@basic.html">PASS</a> +2 other tests pass</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-8/igt@kms_setmode@basic.html">FAIL</a> ([i915#5465]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-1/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_vblank@ts-continuation-dpms-suspend.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> +28 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> ([i915#11943]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a></li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg1-15/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> ([i915#11943]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-13/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg1-13/igt@perf_pmu@rc6.html">DMESG-WARN</a> ([i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg1-17/igt@perf_pmu@rc6.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@prime_mmap_kms@buffer-sharing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@prime_mmap_kms@buffer-sharing.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-1/igt@prime_mmap_kms@buffer-sharing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#10131] / [i915#10887] / [i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#10131] / [i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> ([i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2681]) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-1/igt@i915_selftest@mock.html">DMESG-WARN</a> ([i915#9311]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-4/igt@i915_selftest@mock.html">DMESG-WARN</a> ([i915#1982] / [i915#9311])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> ([i915#5286]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-10/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> ([i915#5190] / [i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> ([i915#4538] / [i915#5190]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-7/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12042])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> ([i915#6095]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> ([i915#10307] / [i915#6095]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12042])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-8/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#11616] / [i915#7213])</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_color@deep-color.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-5/igt@kms_color@deep-color.html">SKIP</a> ([i915#3555] / [i915#9979])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_content_protection@atomic-dpms.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-4/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-tglu-8/igt@kms_content_protection@lic-type-1.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-tglu-9/igt@kms_content_protection@lic-type-1.html">SKIP</a> ([i915#6944] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818/shard-dg2-3/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15451/shard-dg2-2/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11818">SKIP</a> ([i915#11453]) +2 other tests skip</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2127974799441698082==--
