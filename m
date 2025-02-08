Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156FFC02199
	for <igt-dev@archiver.kernel.org>; Sat,  8 Feb 2025 01:06:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A307D10E17E;
	Sat,  8 Feb 2025 01:06:34 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF2410EBB5;
 Sat,  8 Feb 2025 01:04:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2203667340705423425=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_lib/pciids=3A_Sync_pci_i?=
 =?utf-8?q?d_changes_for_DG2/MTL/BMG/PTL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 08 Feb 2025 01:04:06 -0000
Message-ID: <173897664610.2933703.686196516152741177@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250207001432.48524-1-matthew.s.atwood@intel.com>
In-Reply-To: <20250207001432.48524-1-matthew.s.atwood@intel.com>
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

--===============2203667340705423425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/pciids: Sync pci id changes for DG2/MTL/BMG/PTL (rev2)
URL   : https://patchwork.freedesktop.org/series/144333/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_16082_full -> IGTPW_12558_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12558_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12558_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/index.html

Participating hosts (12 -> 10)
------------------------------

  Missing    (2): shard-snb-0 shard-dg2-set2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12558_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@engines-mixed-process@vecs0:
    - shard-mtlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-mtlp-2/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-7/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-glk2/igt@gem_softpin@noreloc-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk7/igt@gem_softpin@noreloc-s3.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-3:
    - shard-dg1:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-dg1-12/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-3.html

  * igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-a:
    - shard-snb:          [PASS][7] -> [INCOMPLETE][8] +1 other test incomplete
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-snb5/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-a.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-snb5/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-a.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-edp-1:
    - shard-mtlp:         [PASS][9] -> [FAIL][10] +9 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-mtlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-edp-1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-edp-1.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-rkl:          [PASS][11] -> [SKIP][12] +37 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-4/igt@kms_draw_crc@draw-method-mmap-gtt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_vblank@query-forked-busy:
    - shard-rkl:          NOTRUN -> [SKIP][13] +23 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_vblank@query-forked-busy.html

  * igt@perf_pmu@invalid-init:
    - shard-glk:          NOTRUN -> [FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk7/igt@perf_pmu@invalid-init.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          [SKIP][15] ([i915#5286]) -> [SKIP][16] +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-rkl:          [SKIP][17] ([i915#3638]) -> [SKIP][18] +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-1/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-rkl:          [SKIP][19] ([i915#6095]) -> [SKIP][20] +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][21] ([i915#12313]) -> [SKIP][22] +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          [SKIP][23] ([i915#3116]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-rkl:          [SKIP][25] ([i915#7118] / [i915#9424]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-2/igt@kms_content_protection@legacy.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          [SKIP][27] ([i915#3555]) -> [SKIP][28] +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-rkl:          [SKIP][29] ([i915#13049]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-rkl:          [SKIP][31] ([i915#4103]) -> [SKIP][32] +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-legacy:
    - shard-rkl:          [DMESG-WARN][33] ([i915#12964]) -> [SKIP][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-2/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          [SKIP][35] ([i915#3555] / [i915#3840]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-5/igt@kms_dsc@dsc-basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_dsc@dsc-basic.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-rkl:          [SKIP][37] ([i915#3555] / [i915#8228]) -> [SKIP][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-4/igt@kms_hdr@bpc-switch-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          [SKIP][39] ([i915#6301]) -> [SKIP][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-5/igt@kms_panel_fitting@atomic-fastset.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-rkl:          [SKIP][41] ([i915#5289]) -> [SKIP][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          [SKIP][43] ([i915#8623]) -> [SKIP][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@max-min:
    - shard-rkl:          [SKIP][45] ([i915#9906]) -> [SKIP][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-2/igt@kms_vrr@max-min.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_vrr@max-min.html

  
New tests
---------

  New tests have been introduced between CI_DRM_16082_full and IGTPW_12558_full:

### New IGT tests (1) ###

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.18] s

  

Known issues
------------

  Here are the changes found in IGTPW_12558_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#6230])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-4/igt@api_intel_bb@crc32.html
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#6230])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@api_intel_bb@crc32.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg2-9:        NOTRUN -> [SKIP][49] ([i915#11078])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          NOTRUN -> [ABORT][50] ([i915#11814] / [i915#11815] / [i915#9413])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@all-busy-check-all:
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#8414]) +15 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-6/igt@drm_fdinfo@all-busy-check-all.html

  * igt@drm_fdinfo@busy-idle-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#8414]) +16 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@drm_fdinfo@busy-idle-check-all@vcs1.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#8414]) +9 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@drm_fdinfo@virtual-busy-idle:
    - shard-dg2-9:        NOTRUN -> [SKIP][54] ([i915#8414])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@drm_fdinfo@virtual-busy-idle.html

  * igt@fbdev@pan:
    - shard-rkl:          [PASS][55] -> [SKIP][56] ([i915#2582]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-5/igt@fbdev@pan.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@fbdev@pan.html

  * igt@fbdev@write:
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#2582])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@fbdev@write.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#3555] / [i915#9323])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@gem_ccs@block-copy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#3555] / [i915#9323])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-1/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][60] ([i915#3555] / [i915#9323]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-8/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#9323])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#9323])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][63] ([i915#12392] / [i915#13356])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#7697])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2-9:        NOTRUN -> [ABORT][65] ([i915#13427])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu-1:       NOTRUN -> [SKIP][66] ([i915#8562])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][67] ([i915#12353]) +1 other test incomplete
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk8/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@engines-mixed-process@vcs0:
    - shard-mtlp:         [PASS][68] -> [ABORT][69] ([i915#13193]) +1 other test abort
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-mtlp-2/igt@gem_ctx_persistence@engines-mixed-process@vcs0.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-7/igt@gem_ctx_persistence@engines-mixed-process@vcs0.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2-9:        NOTRUN -> [SKIP][70] ([i915#8555])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#5882]) +6 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#280])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-1/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu:         NOTRUN -> [SKIP][73] ([i915#280])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-2/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu-1:       NOTRUN -> [SKIP][74] ([i915#280])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg2-9:        NOTRUN -> [ABORT][75] ([i915#7975])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-dg2:          [PASS][76] -> [FAIL][77] ([i915#5784])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-dg2-5/igt@gem_eio@kms.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-6/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [PASS][78] -> [FAIL][79] ([i915#12714] / [i915#5784])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-dg1-14/igt@gem_eio@unwedge-stress.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-17/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#4812]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-8/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4771])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg2-9:        NOTRUN -> [SKIP][82] ([i915#4812])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4771]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4036])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-17/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#8555])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-1/igt@gem_exec_balancer@noheartbeat.html
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#8555])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@gem_exec_balancer@noheartbeat.html
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#8555]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-5/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#4525])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-6/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-tglu-1:       NOTRUN -> [SKIP][89] ([i915#4525]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#4525]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-4/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@capture:
    - shard-mtlp:         NOTRUN -> [FAIL][91] ([i915#11965]) +1 other test fail
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-4/igt@gem_exec_capture@capture.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#6344])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-4/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][93] ([i915#11965]) +4 other tests fail
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-11/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg2-9:        NOTRUN -> [SKIP][94] ([i915#3539] / [i915#4852])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#3539] / [i915#4852]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-1/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#3539])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#3539] / [i915#4852])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#3281]) +14 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#3281]) +8 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-2/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-range:
    - shard-dg2-9:        NOTRUN -> [SKIP][100] ([i915#3281])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@gem_exec_reloc@basic-range.html

  * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#3281]) +11 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-17/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#3281]) +11 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#4812]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@gem_exec_schedule@preempt-queue-contexts.html
    - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#4537] / [i915#4812])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-2/igt@gem_exec_schedule@preempt-queue-contexts.html
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#4537] / [i915#4812])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#7276])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          NOTRUN -> [ABORT][107] ([i915#7975]) +1 other test abort
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-7/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2-9:        NOTRUN -> [SKIP][108] ([i915#4860])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#4860]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@gem_fenced_exec_thrash@no-spare-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#4860])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-10/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu:         NOTRUN -> [SKIP][111] ([i915#4613] / [i915#7582])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-4/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][112] ([i915#4613]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-4/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#12193])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#4565])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-glk:          NOTRUN -> [SKIP][115] ([i915#4613]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk9/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#4613]) +4 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-5/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#4613]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-9/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][118] ([i915#4613]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_media_fill@media-fill:
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#8289])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-4/igt@gem_media_fill@media-fill.html
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#8289])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-3/igt@gem_media_fill@media-fill.html

  * igt@gem_media_vme:
    - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#284])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@gem_media_vme.html
    - shard-tglu-1:       NOTRUN -> [SKIP][122] ([i915#284])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@gem_media_vme.html
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#284])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@gem_media_vme.html
    - shard-mtlp:         NOTRUN -> [SKIP][124] ([i915#284])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-6/igt@gem_media_vme.html

  * igt@gem_mmap@basic-small-bo:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#4083]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@gem_mmap@basic-small-bo.html

  * igt@gem_mmap_gtt@basic-write-cpu-read-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][126] ([i915#4077]) +6 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-2/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html

  * igt@gem_mmap_gtt@basic-write-read:
    - shard-dg2-9:        NOTRUN -> [SKIP][127] ([i915#4077]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@gem_mmap_gtt@basic-write-read.html

  * igt@gem_mmap_gtt@cpuset-big-copy-xy:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#4077]) +4 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-5/igt@gem_mmap_gtt@cpuset-big-copy-xy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#4077]) +9 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-17/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_mmap_wc@write:
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#4083]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-3/igt@gem_mmap_wc@write.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#4083]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#3282]) +2 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-2/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#3282]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@gem_partial_pwrite_pread@writes-after-reads.html
    - shard-mtlp:         NOTRUN -> [SKIP][134] ([i915#3282]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-1/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][135] ([i915#12964])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#4270]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-5/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][137] ([i915#12917] / [i915#12964]) +1 other test timeout
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-5/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#4270]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-rkl:          [PASS][139] -> [TIMEOUT][140] ([i915#12917] / [i915#12964])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-8/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-5/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_readwrite@read-write:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#3282]) +4 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@gem_readwrite@read-write.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#8428]) +4 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][143] +267 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk6/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#5190] / [i915#8428]) +8 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
    - shard-dg2-9:        NOTRUN -> [SKIP][145] ([i915#5190] / [i915#8428])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#8411]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-2/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][147] ([i915#4079])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-1/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#4079])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@gem_set_tiling_vs_pwrite.html
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#4079])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-6/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg2-9:        NOTRUN -> [SKIP][150] ([i915#4885])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglu:         [PASS][151] -> [FAIL][152] ([i915#12941])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-tglu-8/igt@gem_tiled_swapping@non-threaded.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-5/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#4879])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglu:         NOTRUN -> [SKIP][154] ([i915#3297])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-8/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#3297])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@gem_userptr_blits@coherency-unsync.html
    - shard-tglu-1:       NOTRUN -> [SKIP][156] ([i915#3297])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#3297]) +2 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-8/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#3297]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#3297] / [i915#3323])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-8/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#3297] / [i915#4880]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-8/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#3297] / [i915#4880])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#3281] / [i915#3297])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-11/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#3297] / [i915#4958])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@gem_userptr_blits@sd-probe.html

  * igt@gen3_render_linear_blits:
    - shard-dg2:          NOTRUN -> [SKIP][164] +10 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-7/igt@gen3_render_linear_blits.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#2527]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#2527]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-5/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#2856]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-1/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][168] ([i915#2527] / [i915#2856]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-10/igt@gen9_exec_parse@cmd-crossing-page.html
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#2856]) +3 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-3/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-tglu-1:       NOTRUN -> [SKIP][170] ([i915#2527] / [i915#2856]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         [PASS][171] -> [DMESG-WARN][172] ([i915#13029])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-tglu-3/igt@i915_module_load@reload-no-display.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-7/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#6590]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - shard-dg1:          [PASS][174] -> [FAIL][175] ([i915#12739] / [i915#3591])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk:          [PASS][176] -> [INCOMPLETE][177] ([i915#12797])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-glk7/igt@i915_pm_rpm@system-suspend.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk8/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#11681] / [i915#6621])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-14/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#11681])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-17/igt@i915_pm_rps@thresholds.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#11681])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-6/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#7984])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-5/igt@i915_power@sanity.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#6188])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-3/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [PASS][183] -> [DMESG-FAIL][184] ([i915#12061]) +1 other test dmesg-fail
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-mtlp-8/igt@i915_selftest@live@workarounds.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-2/igt@i915_selftest@live@workarounds.html

  * igt@i915_selftest@mock@memory_region:
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][185] ([i915#9311]) +1 other test dmesg-warn
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@i915_selftest@mock@memory_region.html

  * igt@i915_selftest@mock@sanitycheck:
    - shard-snb:          [PASS][186] -> [ABORT][187] ([i915#11703])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-snb5/igt@i915_selftest@mock@sanitycheck.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-snb5/igt@i915_selftest@mock@sanitycheck.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          NOTRUN -> [INCOMPLETE][188] ([i915#4817])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk2/igt@i915_suspend@debugfs-reader.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#7707]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@intel_hwmon@hwmon-read.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#7707])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-4/igt@intel_hwmon@hwmon-write.html
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#7707])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-2/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#4212]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-14/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2-9:        NOTRUN -> [SKIP][193] ([i915#4212])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-dg1:          [PASS][194] -> [FAIL][195] ([i915#13320])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-dg1-12/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
    - shard-tglu:         [PASS][196] -> [FAIL][197] ([i915#10991] / [i915#13320])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-tglu-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][198] -> [FAIL][199] ([i915#10991])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-tglu-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][200] ([i915#12761] / [i915#1982]) +1 other test incomplete
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk4/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-y-rc-ccs-cc:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#8709]) +3 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-tglu-1:       NOTRUN -> [SKIP][202] ([i915#8709]) +3 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#8709]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#8709]) +15 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][205] ([i915#1769])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#1769] / [i915#3555])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#1769] / [i915#3555])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#1769] / [i915#3555])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-2:
    - shard-rkl:          [PASS][209] -> [DMESG-WARN][210] ([i915#12964]) +24 other tests dmesg-warn
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-2.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-2.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#4538] / [i915#5286]) +6 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-14/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#5286]) +2 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-10/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#5286]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
    - shard-tglu-1:       NOTRUN -> [SKIP][214] ([i915#5286]) +4 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][215] +11 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-6/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#5286])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - shard-mtlp:         [PASS][217] -> [FAIL][218] ([i915#5138]) +1 other test fail
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-mtlp-6/igt@kms_big_fb@linear-16bpp-rotate-0.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-4/igt@kms_big_fb@linear-16bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#3638]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-4/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#3638]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#4538] / [i915#5190]) +7 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#6187])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-8/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][223] +16 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg2-9:        NOTRUN -> [SKIP][224] ([i915#4538] / [i915#5190])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#5190]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#4538]) +8 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#6095]) +165 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
    - shard-dg2-9:        NOTRUN -> [SKIP][228] ([i915#10307] / [i915#6095]) +14 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-snb:          NOTRUN -> [SKIP][229] +54 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-snb2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][230] ([i915#6095]) +79 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#12313]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-tglu-1:       NOTRUN -> [SKIP][232] ([i915#12313])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#10307] / [i915#6095]) +181 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-11/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-3.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#12313]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-14/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#6095]) +70 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#12805])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][237] ([i915#12805])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#6095]) +16 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][239] -> [INCOMPLETE][240] ([i915#12796])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-glk1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#6095]) +39 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#10307] / [i915#10434] / [i915#6095]) +7 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu-1:       NOTRUN -> [SKIP][243] ([i915#6095]) +29 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#3742]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-17/igt@kms_cdclk@mode-transition.html
    - shard-dg2-9:        NOTRUN -> [SKIP][245] ([i915#11616] / [i915#7213])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#3742])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-2:
    - shard-dg2-9:        NOTRUN -> [SKIP][247] ([i915#7213]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-2.html

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#4087]) +3 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-tglu-1:       NOTRUN -> [SKIP][249] ([i915#11151] / [i915#7828]) +4 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#11151] / [i915#4423] / [i915#7828])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-14/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#11151] / [i915#7828]) +9 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#11151] / [i915#7828]) +4 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-9:        NOTRUN -> [SKIP][253] ([i915#11151] / [i915#7828]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#11151] / [i915#7828]) +3 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-5/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#11151] / [i915#7828]) +4 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-8/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][256] ([i915#11151] / [i915#7828]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#9424])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-14/igt@kms_content_protection@content-type-change.html
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#6944] / [i915#9424])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-7/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-9:        NOTRUN -> [SKIP][259] ([i915#7118] / [i915#9424])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][260] ([i915#7173])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-10/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#9424])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-2/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-tglu-1:       NOTRUN -> [SKIP][262] ([i915#6944] / [i915#7116] / [i915#7118])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#7118] / [i915#9424])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-2/igt@kms_content_protection@uevent.html

  * igt@kms_content_protection@uevent@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [FAIL][264] ([i915#1339] / [i915#7173])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-11/igt@kms_content_protection@uevent@pipe-a-dp-3.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][265] ([i915#13049]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#13049]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-tglu-1:       NOTRUN -> [SKIP][267] ([i915#13049]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu-1:       NOTRUN -> [FAIL][268] ([i915#13566]) +1 other test fail
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html
    - shard-rkl:          [PASS][269] -> [FAIL][270] ([i915#13566])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][271] ([i915#13566]) +3 other tests fail
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#13049])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-3/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-64x64@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][273] ([i915#12964]) +22 other tests dmesg-warn
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-5/igt@kms_cursor_crc@cursor-random-64x64@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#3555]) +9 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#3555]) +8 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-tglu:         NOTRUN -> [SKIP][276] ([i915#3555]) +5 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#3555] / [i915#8814]) +2 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#3555]) +6 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-5/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-9:        NOTRUN -> [SKIP][279] ([i915#13049])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][280] -> [FAIL][281] ([i915#13566]) +3 other tests fail
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-9:        NOTRUN -> [SKIP][282] ([i915#13046] / [i915#5354]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#4103]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][284] ([i915#9809]) +4 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#13046] / [i915#5354]) +5 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#9067])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu-1:       NOTRUN -> [SKIP][287] ([i915#9723])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#8588])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-11/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#3804])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#1257])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-7/igt@kms_dp_aux_dev.html
    - shard-dg2-9:        NOTRUN -> [SKIP][291] ([i915#1257])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][292] ([i915#3555] / [i915#8812])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-5/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#3840])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#3555] / [i915#3840])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-1/igt@kms_dsc@dsc-with-output-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#3555] / [i915#3840])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@kms_dsc@dsc-with-output-formats.html
    - shard-tglu:         NOTRUN -> [SKIP][296] ([i915#3555] / [i915#3840]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-7/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#3840] / [i915#9053])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#3840] / [i915#9053])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#3840] / [i915#9053])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#3840] / [i915#9053])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#3955])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#3469])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-11/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][303] ([i915#4854])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-5/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg1:          NOTRUN -> [SKIP][304] ([i915#9337])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu-1:       NOTRUN -> [SKIP][305] ([i915#658])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_feature_discovery@psr2.html
    - shard-rkl:          NOTRUN -> [SKIP][306] ([i915#658])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#4881])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-5/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][308] ([i915#9934]) +3 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-5/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#9934]) +7 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-tglu:         NOTRUN -> [SKIP][310] ([i915#3637]) +4 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-mtlp:         NOTRUN -> [SKIP][311] ([i915#3637]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-6/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][312] ([i915#4839])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk3/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][313] ([i915#3637]) +4 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][314] -> [FAIL][315] ([i915#11989]) +3 other tests fail
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-snb6/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-snb2/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#9934]) +10 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-dg2-9:        NOTRUN -> [SKIP][317] ([i915#9934]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][318] -> [FAIL][319] ([i915#10826]) +1 other test fail
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-snb2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-snb5/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-mtlp:         [PASS][320] -> [FAIL][321] ([i915#11989]) +1 other test fail
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-mtlp-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][322] ([i915#12745] / [i915#4839]) +1 other test incomplete
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][323] ([i915#12745])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][324] ([i915#2587] / [i915#2672]) +4 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#2672] / [i915#3555])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#2587] / [i915#2672]) +2 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][327] ([i915#2672] / [i915#3555]) +3 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][328] ([i915#2672] / [i915#3555] / [i915#8813]) +2 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][329] ([i915#2672] / [i915#8813]) +2 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#2672]) +3 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][331] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][332] ([i915#2587] / [i915#2672] / [i915#3555])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][333] ([i915#2672]) +6 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-rkl:          [PASS][334] -> [SKIP][335] ([i915#3555]) +3 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][336] ([i915#2672] / [i915#3555]) +2 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
    - shard-tglu-1:       NOTRUN -> [SKIP][337] ([i915#2672] / [i915#3555]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][338] ([i915#2587] / [i915#2672]) +1 other test skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][339] ([i915#2672] / [i915#3555]) +2 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][340] ([i915#2672] / [i915#3555] / [i915#5190]) +3 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-9:        NOTRUN -> [SKIP][341] ([i915#2672] / [i915#3555]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [FAIL][342] ([i915#6880])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-rkl:          [PASS][343] -> [SKIP][344] ([i915#1849] / [i915#5354]) +5 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2:          [PASS][345] -> [FAIL][346] ([i915#6880]) +1 other test fail
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#1849] / [i915#5354]) +18 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][348] ([i915#8708]) +4 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-dg2:          NOTRUN -> [SKIP][349] ([i915#5354]) +35 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-snb:          [PASS][350] -> [SKIP][351] +2 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][352] +47 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][353] ([i915#10056] / [i915#13353])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk9/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][354] ([i915#5439]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#3458]) +13 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][356] ([i915#8708]) +20 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][357] ([i915#4423])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][358] ([i915#8708]) +15 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][359] +50 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][360] ([i915#1825]) +26 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][361] ([i915#3458]) +19 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][362] ([i915#9766])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:
    - shard-dg2-9:        NOTRUN -> [SKIP][363] ([i915#3458]) +2 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][364] ([i915#3023]) +17 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2-9:        NOTRUN -> [SKIP][365] ([i915#8708]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-dg2-9:        NOTRUN -> [SKIP][366] ([i915#5354]) +3 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][367] ([i915#1825]) +21 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][368] +71 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][369] ([i915#6118])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-7/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][370] ([i915#3555] / [i915#8228])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-8/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         NOTRUN -> [SKIP][371] ([i915#12713])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-8/igt@kms_hdr@brightness-with-hdr.html
    - shard-dg2:          NOTRUN -> [SKIP][372] ([i915#12713])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-2/igt@kms_hdr@brightness-with-hdr.html
    - shard-rkl:          NOTRUN -> [SKIP][373] ([i915#12713])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-2/igt@kms_hdr@brightness-with-hdr.html
    - shard-dg1:          NOTRUN -> [SKIP][374] ([i915#1187] / [i915#12713])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu:         NOTRUN -> [SKIP][375] ([i915#12713])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-tglu-1:       NOTRUN -> [SKIP][376] ([i915#3555] / [i915#8228]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][377] ([i915#3555] / [i915#8228])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-14/igt@kms_hdr@static-toggle-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][378] ([i915#3555] / [i915#8228])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-7/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][379] ([i915#10656])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-17/igt@kms_joiner@basic-big-joiner.html
    - shard-dg2-9:        NOTRUN -> [SKIP][380] ([i915#10656])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][381] ([i915#12339])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-6/igt@kms_joiner@basic-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][382] ([i915#12339])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-3/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][383] ([i915#12339])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu:         NOTRUN -> [SKIP][384] ([i915#1839])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-9/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          NOTRUN -> [SKIP][385] ([i915#6301])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-4/igt@kms_panel_fitting@legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][386] ([i915#6301])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@plane-position-hole:
    - shard-rkl:          [PASS][387] -> [SKIP][388] ([i915#8825])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-2/igt@kms_plane@plane-position-hole.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-rkl:          [PASS][389] -> [SKIP][390] ([i915#7294]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-5/igt@kms_plane_alpha_blend@alpha-basic.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-tglu-1:       NOTRUN -> [SKIP][391] ([i915#3555]) +3 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][392] ([i915#8806])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-10/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          NOTRUN -> [SKIP][393] ([i915#6953])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-dg1:          NOTRUN -> [SKIP][394] ([i915#6953])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][395] ([i915#6953])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-1/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][396] ([i915#12247]) +7 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][397] ([i915#12247]) +8 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:
    - shard-rkl:          [PASS][398] -> [SKIP][399] ([i915#8152])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][400] ([i915#12247] / [i915#6953])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-mtlp:         NOTRUN -> [SKIP][401] ([i915#12247] / [i915#6953])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][402] ([i915#12247]) +15 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:
    - shard-rkl:          [PASS][403] -> [SKIP][404] ([i915#12247] / [i915#8152]) +1 other test skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][405] ([i915#12247] / [i915#6953])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - shard-rkl:          [PASS][406] -> [SKIP][407] ([i915#6953] / [i915#8152])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-20x20.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][408] ([i915#12247] / [i915#3555])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - shard-dg1:          NOTRUN -> [SKIP][409] ([i915#12247]) +3 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-c:
    - shard-rkl:          NOTRUN -> [SKIP][410] ([i915#12247] / [i915#8152]) +4 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-20x20@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-rkl:          [PASS][411] -> [SKIP][412] ([i915#3555] / [i915#6953] / [i915#8152])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-3/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][413] ([i915#12247] / [i915#6953])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][414] ([i915#12247]) +3 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b:
    - shard-rkl:          [PASS][415] -> [SKIP][416] ([i915#12247]) +9 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-3/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu:         NOTRUN -> [SKIP][417] ([i915#9812])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-5/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][418] ([i915#5354])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][419] ([i915#5354]) +1 other test skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-14/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][420] ([i915#5978])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-8/igt@kms_pm_dc@dc6-dpms.html
    - shard-tglu-1:       NOTRUN -> [FAIL][421] ([i915#9295])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_pm_dc@dc6-dpms.html
    - shard-mtlp:         NOTRUN -> [FAIL][422] ([i915#12913])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2:          NOTRUN -> [SKIP][423] ([i915#9685]) +1 other test skip
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@kms_pm_dc@dc6-psr.html
    - shard-rkl:          NOTRUN -> [SKIP][424] ([i915#9685])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@kms_pm_dc@dc6-psr.html
    - shard-tglu-1:       NOTRUN -> [SKIP][425] ([i915#9685])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_pm_dc@dc6-psr.html
    - shard-mtlp:         NOTRUN -> [FAIL][426] ([i915#12912])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-8/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][427] ([i915#3361])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-4/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          [PASS][428] -> [SKIP][429] ([i915#9340])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-3/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg2:          NOTRUN -> [SKIP][430] ([i915#8430])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-1/igt@kms_pm_lpsp@screens-disabled.html
    - shard-tglu:         NOTRUN -> [SKIP][431] (

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/index.html

--===============2203667340705423425==
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
<tr><td><b>Series:</b></td><td>lib/pciids: Sync pci id changes for DG2/MTL/BMG/PTL (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144333/">https://patchwork.freedesktop.org/series/144333/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_16082_full -&gt; IGTPW_12558_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12558_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12558_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/index.html</p>
<h2>Participating hosts (12 -&gt; 10)</h2>
<p>Missing    (2): shard-snb-0 shard-dg2-set2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12558_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-mixed-process@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-mtlp-2/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-7/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-glk2/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk7/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-dg1-12/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-3.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-a:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-snb5/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-snb5/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-a.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-mtlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-edp-1.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-4/igt@kms_draw_crc@draw-method-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_vblank@query-forked-busy.html">SKIP</a> +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@invalid-init:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk7/igt@perf_pmu@invalid-init.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> ([i915#5286]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-1/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#3638]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> ([i915#6095]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-2/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#7118] / [i915#9424]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_content_protection@legacy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> ([i915#13049]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-2/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html">DMESG-WARN</a> ([i915#12964]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-5/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-4/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> ([i915#3555] / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-5/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> ([i915#6301]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> ([i915#5289]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-2/igt@kms_vrr@max-min.html">SKIP</a> ([i915#9906]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_vrr@max-min.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_16082_full and IGTPW_12558_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-dp-3:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.18] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12558_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-4/igt@api_intel_bb@crc32.html">SKIP</a> ([i915#6230])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@api_intel_bb@crc32.html">SKIP</a> ([i915#6230])</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@device_reset@cold-reset-bound.html">SKIP</a> ([i915#11078])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@device_reset@unbind-reset-rebind.html">ABORT</a> ([i915#11814] / [i915#11815] / [i915#9413])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-6/igt@drm_fdinfo@all-busy-check-all.html">SKIP</a> ([i915#8414]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@vcs1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@drm_fdinfo@busy-idle-check-all@vcs1.html">SKIP</a> ([i915#8414]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html">SKIP</a> ([i915#8414]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-idle:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@drm_fdinfo@virtual-busy-idle.html">SKIP</a> ([i915#8414])</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-5/igt@fbdev@pan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@fbdev@pan.html">SKIP</a> ([i915#2582]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@fbdev@write.html">SKIP</a> ([i915#2582])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-1/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-8/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#3555] / [i915#9323]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#9323])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> ([i915#12392] / [i915#13356])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@gem_create@create-ext-cpu-access-big.html">ABORT</a> ([i915#13427])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk8/igt@gem_ctx_isolation@preservation-s3@bcs0.html">INCOMPLETE</a> ([i915#12353]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-mixed-process@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-mtlp-2/igt@gem_ctx_persistence@engines-mixed-process@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-7/igt@gem_ctx_persistence@engines-mixed-process@vcs0.html">ABORT</a> ([i915#13193]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html">SKIP</a> ([i915#5882]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-1/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-2/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-dg2-5/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-6/igt@gem_eio@kms.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-dg1-14/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-17/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#12714] / [i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-8/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> ([i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-semaphore:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> ([i915#4771]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-17/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#4036])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-1/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> ([i915#8555])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> ([i915#8555])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-5/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> ([i915#8555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-6/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> ([i915#4525]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-4/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> ([i915#4525]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-4/igt@gem_exec_capture@capture.html">FAIL</a> ([i915#11965]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-4/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> ([i915#6344])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-11/igt@gem_exec_capture@capture@vecs0-lmem0.html">FAIL</a> ([i915#11965]) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@gem_exec_flush@basic-batch-kernel-default-wb.html">SKIP</a> ([i915#3539] / [i915#4852])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-1/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@gem_exec_flush@basic-wb-rw-default.html">SKIP</a> ([i915#3539] / [i915#4852])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</a> ([i915#3281]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-2/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html">SKIP</a> ([i915#3281]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-range:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@gem_exec_reloc@basic-range.html">SKIP</a> ([i915#3281])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-17/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html">SKIP</a> ([i915#3281]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#3281]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> ([i915#4812]) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-2/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> ([i915#7276])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-7/igt@gem_exec_suspend@basic-s4-devices.html">ABORT</a> ([i915#7975]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@gem_fenced_exec_thrash@no-spare-fences.html">SKIP</a> ([i915#4860]) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-10/igt@gem_fenced_exec_thrash@no-spare-fences.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-4/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> ([i915#4613] / [i915#7582])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-4/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> ([i915#4613]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> ([i915#12193])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html">SKIP</a> ([i915#4565])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk9/igt@gem_lmem_swapping@massive-random.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-5/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([i915#4613]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-9/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-4/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-3/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-6/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic-small-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@gem_mmap@basic-small-bo.html">SKIP</a> ([i915#4083]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-write-cpu-read-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-2/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html">SKIP</a> ([i915#4077]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-write-read:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@gem_mmap_gtt@basic-write-read.html">SKIP</a> ([i915#4077]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-xy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-5/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">SKIP</a> ([i915#4077]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-17/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">SKIP</a> ([i915#4077]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-3/igt@gem_mmap_wc@write.html">SKIP</a> ([i915#4083]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@gem_mmap_wc@write-read.html">SKIP</a> ([i915#4083]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-snoop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-2/igt@gem_partial_pwrite_pread@reads-snoop.html">SKIP</a> ([i915#3282]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> ([i915#3282]) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-1/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@gem_pxp@create-protected-buffer.html">TIMEOUT</a> ([i915#12964])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-5/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-5/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">TIMEOUT</a> ([i915#12917] / [i915#12964]) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-8/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-5/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">TIMEOUT</a> ([i915#12917] / [i915#12964])</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@gem_readwrite@read-write.html">SKIP</a> ([i915#3282]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([i915#8428]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk6/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html">SKIP</a> +267 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#5190] / [i915#8428]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">SKIP</a> ([i915#5190] / [i915#8428])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-2/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-1/igt@gem_set_tiling_vs_gtt.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> ([i915#4079])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-6/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@gem_softpin@evict-snoop.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-tglu-8/igt@gem_tiled_swapping@non-threaded.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-5/igt@gem_tiled_swapping@non-threaded.html">FAIL</a> ([i915#12941])</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#4879])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-8/igt@gem_userptr_blits@access-control.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> ([i915#3297])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-8/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-8/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3297] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-8/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> ([i915#3297] / [i915#4880]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-11/igt@gem_userptr_blits@relocations.html">SKIP</a> ([i915#3281] / [i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@gem_userptr_blits@sd-probe.html">SKIP</a> ([i915#3297] / [i915#4958])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-7/igt@gen3_render_linear_blits.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@gen9_exec_parse@allowed-single.html">SKIP</a> ([i915#2527]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-5/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2527]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-1/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> ([i915#2856]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-10/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> ([i915#2527] / [i915#2856]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-3/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> ([i915#2856]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2527] / [i915#2856]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-tglu-3/igt@i915_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-7/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> ([i915#13029])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> ([i915#6590]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html">FAIL</a> ([i915#12739] / [i915#3591])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-glk7/igt@i915_pm_rpm@system-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk8/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> ([i915#12797])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-14/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> ([i915#11681] / [i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-17/igt@i915_pm_rps@thresholds.html">SKIP</a> ([i915#11681])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-6/igt@i915_pm_rps@thresholds-idle.html">SKIP</a> ([i915#11681])</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-5/igt@i915_power@sanity.html">SKIP</a> ([i915#7984])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-3/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#6188])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-mtlp-8/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-2/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> ([i915#12061]) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@sanitycheck:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-snb5/igt@i915_selftest@mock@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-snb5/igt@i915_selftest@mock@sanitycheck.html">ABORT</a> ([i915#11703])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk2/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> ([i915#4817])</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@intel_hwmon@hwmon-read.html">SKIP</a> ([i915#7707]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-4/igt@intel_hwmon@hwmon-write.html">SKIP</a> ([i915#7707])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-2/igt@intel_hwmon@hwmon-write.html">SKIP</a> ([i915#7707])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-14/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> ([i915#4212]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-dg1-12/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> ([i915#13320])</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-tglu-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> ([i915#10991] / [i915#13320])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-tglu-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#10991])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk4/igt@kms_async_flips@async-flip-suspend-resume.html">INCOMPLETE</a> ([i915#12761] / [i915#1982]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-y-rc-ccs-cc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-y-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs.html">SKIP</a> ([i915#8709]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-2.html">DMESG-WARN</a> ([i915#12964]) +24 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-14/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> ([i915#4538] / [i915#5286]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-10/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> ([i915#5286]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">SKIP</a> ([i915#5286]) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">SKIP</a> ([i915#5286]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-6/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-mtlp-6/igt@kms_big_fb@linear-16bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-4/igt@kms_big_fb@linear-16bpp-rotate-0.html">FAIL</a> ([i915#5138]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-4/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([i915#3638]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> ([i915#3638]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> ([i915#4538] / [i915#5190]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-8/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> ([i915#6187])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> ([i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> ([i915#4538]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html">SKIP</a> ([i915#6095]) +165 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> ([i915#10307] / [i915#6095]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-snb2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#6095]) +79 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-11/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-3.html">SKIP</a> ([i915#10307] / [i915#6095]) +181 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-14/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#6095]) +70 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12805])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12805])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> ([i915#6095]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-glk1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> ([i915#12796])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-edp-1.html">SKIP</a> ([i915#6095]) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / [i915#6095]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> ([i915#6095]) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-17/igt@kms_cdclk@mode-transition.html">SKIP</a> ([i915#3742]) +1 other test skip</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_cdclk@mode-transition.html">SKIP</a> ([i915#11616] / [i915#7213])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#7213]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html">SKIP</a> ([i915#4087]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> ([i915#11151] / [i915#7828]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-14/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> ([i915#11151] / [i915#4423] / [i915#7828])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> ([i915#11151] / [i915#7828]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> ([i915#11151] / [i915#7828]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> ([i915#11151] / [i915#7828]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-5/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html">SKIP</a> ([i915#11151] / [i915#7828]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-8/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> ([i915#11151] / [i915#7828]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> ([i915#11151] / [i915#7828]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-14/igt@kms_content_protection@content-type-change.html">SKIP</a> ([i915#9424])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-7/igt@kms_content_protection@content-type-change.html">SKIP</a> ([i915#6944] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-10/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">FAIL</a> ([i915#7173])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-2/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_content_protection@srm.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-2/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-11/igt@kms_content_protection@uevent@pipe-a-dp-3.html">FAIL</a> ([i915#1339] / [i915#7173])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL</a> ([i915#13566]) +1 other test fail</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL</a> ([i915#13566])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html">FAIL</a> ([i915#13566]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-3/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> ([i915#13049])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x64@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-5/igt@kms_cursor_crc@cursor-random-64x64@pipe-a-hdmi-a-2.html">DMESG-WARN</a> ([i915#12964]) +22 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#3555]) +9 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#3555]) +8 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#3555]) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#3555] / [i915#8814]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-5/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> ([i915#13049])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#13566]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> ([i915#13046] / [i915#5354]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#4103]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> ([i915#9809]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> ([i915#13046] / [i915#5354]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> ([i915#9067])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> ([i915#9723])</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-11/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-7/igt@kms_dp_aux_dev.html">SKIP</a> ([i915#1257])</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_dp_aux_dev.html">SKIP</a> ([i915#1257])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-5/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#3555] / [i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-1/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-7/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> ([i915#3840] / [i915#9053])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> ([i915#3840] / [i915#9053])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> ([i915#3840] / [i915#9053])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> ([i915#3840] / [i915#9053])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([i915#3955])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-11/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([i915#3469])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-5/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([i915#4854])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@kms_feature_discovery@dp-mst.html">SKIP</a> ([i915#9337])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@kms_feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-5/igt@kms_fence_pin_leak.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-5/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> ([i915#9934]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> ([i915#9934]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> ([i915#3637]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-6/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> ([i915#3637]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk3/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> ([i915#4839])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> ([i915#3637]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-snb6/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-snb2/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html">FAIL</a> ([i915#11989]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> ([i915#9934]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> ([i915#9934]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-snb2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-snb5/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html">FAIL</a> ([i915#10826]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-mtlp-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> ([i915#11989]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk2/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> ([i915#12745] / [i915#4839]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">INCOMPLETE</a> ([i915#12745])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#8813]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672] / [i915#8813]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +2 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#5190]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html">FAIL</a> ([i915#6880])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> ([i915#1849] / [i915#5354]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">FAIL</a> ([i915#6880]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([i915#1849] / [i915#5354]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#8708]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> ([i915#5354]) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-glk9/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> ([i915#10056] / [i915#13353])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> ([i915#5439]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#3458]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#4423])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([i915#1825]) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> ([i915#3458]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> ([i915#9766])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html">SKIP</a> ([i915#3458]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> ([i915#3023]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> ([i915#5354]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> ([i915#1825]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html">SKIP</a> +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-7/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> ([i915#6118])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-8/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> ([i915#12713])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> ([i915#12713])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> ([i915#12713])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> ([i915#1187] / [i915#12713])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> ([i915#12713])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-14/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-7/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-17/igt@kms_joiner@basic-big-joiner.html">SKIP</a> ([i915#10656])</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-9/igt@kms_joiner@basic-big-joiner.html">SKIP</a> ([i915#10656])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-6/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> ([i915#12339])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-3/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> ([i915#12339])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> ([i915#12339])</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-9/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-4/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-18/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-2/igt@kms_plane@plane-position-hole.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_plane@plane-position-hole.html">SKIP</a> ([i915#8825])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-5/igt@kms_plane_alpha_blend@alpha-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_plane_alpha_blend@alpha-basic.html">SKIP</a> ([i915#7294]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-10/igt@kms_plane_multiple@tiling-y.html">SKIP</a> ([i915#8806])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> ([i915#6953])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-12/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> ([i915#6953])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-1/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> ([i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html">SKIP</a> ([i915#12247]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html">SKIP</a> ([i915#12247]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html">SKIP</a> ([i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b.html">SKIP</a> ([i915#12247]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html">SKIP</a> ([i915#12247] / [i915#8152]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-20x20.html">SKIP</a> ([i915#6953] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html">SKIP</a> ([i915#12247]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-c:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-20x20@pipe-c.html">SKIP</a> ([i915#12247] / [i915#8152]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-3/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">SKIP</a> ([i915#3555] / [i915#6953] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> ([i915#12247]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-rkl-3/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b.html">SKIP</a> ([i915#12247]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-5/igt@kms_pm_backlight@fade.html">SKIP</a> ([i915#9812])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-8/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> ([i915#5354])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg1-14/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> ([i915#5354]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-8/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> ([i915#5978])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> ([i915#9295])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> ([i915#12913])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-4/igt@kms_pm_dc@dc6-psr.html">SKIP</a> ([i915#9685]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-3/igt@kms_pm_dc@dc6-psr.html">SKIP</a> ([i915#9685])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-tglu-1/igt@kms_pm_dc@dc6-psr.html">SKIP</a> ([i915#9685])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-mtlp-8/igt@kms_pm_dc@dc6-psr.html">FAIL</a> ([i915#12912])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-rkl-4/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> ([i915#3361])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16082/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-3/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> ([i915#9340])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12558/shard-dg2-1/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#8430])</li>
<li>shard-tglu:         NOTRUN -&gt; [SKIP][431] (</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2203667340705423425==--
