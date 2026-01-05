Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE7DC2A072
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 07:32:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9CA10E2AF;
	Mon,  5 Jan 2026 07:32:27 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7549310E2AF;
 Mon,  5 Jan 2026 07:32:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3148571645346739425=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Madvise_feature_in_SVM_for?=
 =?utf-8?q?_Multi-GPU_configs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 05 Jan 2026 07:32:26 -0000
Message-ID: <176759834647.124997.5269686652004988832@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260105040000.181183-1-nishit.sharma@intel.com>
In-Reply-To: <20260105040000.181183-1-nishit.sharma@intel.com>
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

--===============3148571645346739425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Madvise feature in SVM for Multi-GPU configs
URL   : https://patchwork.freedesktop.org/series/159617/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8681_FULL -> XEIGTPW_14282_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14282_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14282_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14282_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_multigpu_svm@mgpu-atomic-op-conflict (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][1] +19 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-7/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][2] +16 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html

  
New tests
---------

  New tests have been introduced between XEIGT_8681_FULL and XEIGTPW_14282_FULL:

### New IGT tests (21) ###

  * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_multigpu_svm@mgpu-coherency-basic:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_multigpu_svm@mgpu-coherency-conflict:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_multigpu_svm@mgpu-coherency-prefetch:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_multigpu_svm@mgpu-concurrent-access-basic:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_multigpu_svm@mgpu-latency-basic:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_multigpu_svm@mgpu-latency-copy-basic:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_multigpu_svm@mgpu-latency-prefetch:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_multigpu_svm@mgpu-migration-basic:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_multigpu_svm@mgpu-migration-prefetch:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_multigpu_svm@mgpu-pagefault-basic:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_multigpu_svm@mgpu-pagefault-conflict:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_multigpu_svm@mgpu-xgpu-access-basic:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14282_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#3157])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [PASS][4] -> [FAIL][5] ([Intel XE#6054]) +3 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2370])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1407])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2327]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +17 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1428])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#610])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2328])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2314] / [Intel XE#2894]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#367]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2887]) +20 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2652] / [Intel XE#787]) +34 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#3432]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2325]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@gamma:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#306])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-4/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2252]) +16 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#373])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-5/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#6507])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#307])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-7/igt@kms_content_protection@dp-mst-type-1.html
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2390]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2341])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][27] ([Intel XE#1178]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-2/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#3278])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2320]) +4 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#2321])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-4/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1424]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2321]) +4 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#309])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][34] -> [FAIL][35] ([Intel XE#5299])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2286])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#1508])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#4354])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-3/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2244]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#4422])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#4156])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-3/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1421])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-3/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2293]) +5 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#4141]) +20 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#656]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2311]) +53 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2352])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2313]) +44 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#3374] / [Intel XE#3544])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle@pipe-a-dp-2:
    - shard-bmg:          [PASS][51] -> [ABORT][52] ([Intel XE#6740]) +1 other test abort
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-8/igt@kms_hdr@static-toggle@pipe-a-dp-2.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@kms_hdr@static-toggle@pipe-a-dp-2.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2501])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#4329] / [Intel XE#6912])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2393]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-8/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#5021]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2938])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#870]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-2/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2392])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#6814])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#1406] / [Intel XE#1489]) +9 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#1406] / [Intel XE#2387]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1128] / [Intel XE#1406])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +22 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-8/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1406])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-5/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#1406] / [Intel XE#2234])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#1406] / [Intel XE#2414]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [PASS][69] -> [SKIP][70] ([Intel XE#1406] / [Intel XE#4692])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2330])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2413])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#1435])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#6503]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2509])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#1499]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@kms_vrr@max-min.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#6599]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-2/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute_preempt@compute-preempt-many-vram:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#5191])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-3/igt@xe_compute_preempt@compute-preempt-many-vram.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2504])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#4837]) +13 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_online@pagefault-write-stress:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#6665])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-8/igt@xe_eudebug_online@pagefault-write-stress.html
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#6665] / [Intel XE#6681])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@xe_eudebug_online@pagefault-write-stress.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-4/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_eudebug_online@set-breakpoint-faultable:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#4837] / [Intel XE#6665]) +8 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-8/igt@xe_eudebug_online@set-breakpoint-faultable.html

  * igt@xe_evict@evict-beng-small-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#688])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-8/igt@xe_evict@evict-beng-small-external-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2322]) +12 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1392])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-3/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#6874]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#6874]) +44 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_system_allocator@many-64k-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#5007])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-3/igt@xe_exec_system_allocator@many-64k-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#4943]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#4943]) +27 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@twice-large-malloc-prefetch-madvise:
    - shard-lnl:          NOTRUN -> [WARN][94] ([Intel XE#5786])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-8/igt@xe_exec_system_allocator@twice-large-malloc-prefetch-madvise.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          NOTRUN -> [ABORT][95] ([Intel XE#5466])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2833])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2236])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2284]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-3/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0:
    - shard-lnl:          [PASS][99] -> [FAIL][100] ([Intel XE#6251])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#4733]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#944]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-8/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          NOTRUN -> [FAIL][103] ([Intel XE#6569])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-lnl:          [FAIL][104] ([Intel XE#5993]) -> [PASS][105] +3 other tests pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-bmg:          [INCOMPLETE][106] ([Intel XE#6819]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [DMESG-FAIL][108] ([Intel XE#5545]) -> [PASS][109] +1 other test pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
    - shard-bmg:          [INCOMPLETE][110] ([Intel XE#6891]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][112] ([Intel XE#301]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [ABORT][114] ([Intel XE#6740]) -> [PASS][115] +1 other test pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-9/igt@kms_hdr@static-swap.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_hdr@static-swap.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-bmg:          [SKIP][116] ([Intel XE#6703]) -> [PASS][117] +66 other tests pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][118] ([Intel XE#718]) -> [PASS][119] +1 other test pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][120] ([Intel XE#6361]) -> [PASS][121] +2 other tests pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@xe_exec_system_allocator@many-stride-mmap-prefetch:
    - shard-bmg:          [SKIP][122] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-mmap-prefetch.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-mmap-prefetch.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [FAIL][124] ([Intel XE#5625]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [SKIP][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151]) ([Intel XE#378]) -> ([PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-7/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-7/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-4/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-4/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-1/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-3/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-3/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-8/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-4/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-5/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-7/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-4/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-2/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-2/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-5/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-5/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-5/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-2/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-1/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-2/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-1/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-8/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-3/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-3/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-8/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-8/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-8/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-1/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-1/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-4/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-2/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-2/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-3/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-8/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-5/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-7/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-8/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-1/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-3/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-1/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-5/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-5/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-7/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-7/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-5/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-4/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-2/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-4/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-3/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-8/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-7/igt@xe_module_load@load.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:
    - shard-lnl:          [FAIL][177] ([Intel XE#6251]) -> [PASS][178] +1 other test pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][179] ([Intel XE#6703]) -> [SKIP][180] ([Intel XE#2652] / [Intel XE#787])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][181] ([Intel XE#6703]) -> [SKIP][182] ([Intel XE#2325]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][183] ([Intel XE#6703]) -> [SKIP][184] ([Intel XE#2341])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_content_protection@content-type-change.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@kms_content_protection@content-type-change.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][185] ([Intel XE#6703]) -> [SKIP][186] ([Intel XE#2374])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_feature_discovery@psr2.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-2/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][187] ([Intel XE#6703]) -> [SKIP][188] ([Intel XE#2293] / [Intel XE#2380])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][189] ([Intel XE#6703]) -> [SKIP][190] ([Intel XE#2311]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][191] ([Intel XE#6703]) -> [SKIP][192] ([Intel XE#2313]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][193] ([Intel XE#6703]) -> [SKIP][194] ([Intel XE#2350])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [ABORT][195] ([Intel XE#6740]) -> [SKIP][196] ([Intel XE#1503])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          [SKIP][197] ([Intel XE#6703]) -> [SKIP][198] ([Intel XE#6912])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][199] ([Intel XE#6693]) -> [SKIP][200] ([Intel XE#1439] / [Intel XE#836])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][201] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][202] ([Intel XE#1406] / [Intel XE#1489])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-bmg:          [SKIP][203] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][204] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][205] ([Intel XE#6703]) -> [SKIP][206] ([Intel XE#2330])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_sharpness_filter@filter-toggle:
    - shard-bmg:          [SKIP][207] ([Intel XE#6703]) -> [SKIP][208] ([Intel XE#6503])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_sharpness_filter@filter-toggle.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-8/igt@kms_sharpness_filter@filter-toggle.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][209] ([Intel XE#1729]) -> [SKIP][210] ([Intel XE#2426])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          [SKIP][211] ([Intel XE#6703]) -> [SKIP][212] ([Intel XE#4837])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@xe_eudebug@discovery-empty.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable:
    - shard-bmg:          [SKIP][213] ([Intel XE#6703]) -> [SKIP][214] ([Intel XE#4837] / [Intel XE#6665])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority:
    - shard-bmg:          [SKIP][215] ([Intel XE#6703]) -> [SKIP][216] ([Intel XE#6874]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          [SKIP][217] ([Intel XE#2427]) -> [SKIP][218] ([Intel XE#2427] / [Intel XE#6953])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-10/igt@xe_peer2peer@read.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-2/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          [SKIP][219] ([Intel XE#6953]) -> [SKIP][220] ([Intel XE#2427] / [Intel XE#6953])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@xe_peer2peer@write.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@xe_peer2peer@write.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          [SKIP][221] ([Intel XE#6703]) -> [SKIP][222] ([Intel XE#4733])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@xe_pxp@display-black-pxp-fb.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-3/igt@xe_pxp@display-black-pxp-fb.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
  [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6891]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6891
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8681 -> IGTPW_14282
  * Linux: xe-4315-633f3e5eab13c5bc2d760d1f3db65eb346d9babb -> xe-4326-5fc5192372599f11da8dee072fd8beb4414f8eca

  IGTPW_14282: 14282
  IGT_8681: c49f35440873244aa86e778007ed2dcbe5bf0ecb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4315-633f3e5eab13c5bc2d760d1f3db65eb346d9babb: 633f3e5eab13c5bc2d760d1f3db65eb346d9babb
  xe-4326-5fc5192372599f11da8dee072fd8beb4414f8eca: 5fc5192372599f11da8dee072fd8beb4414f8eca

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/index.html

--===============3148571645346739425==
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
<tr><td><b>Series:</b></td><td>Madvise feature in SVM for Multi-GPU configs=
</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/159617/">https://patchwork.freedesktop.org/series/159617/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14282/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14282/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8681_FULL -&gt; XEIGTPW_14282_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14282_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_14282_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14=
282_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-conflict (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-lnl-7/igt@xe_multigpu_svm@mgpu-atomic-op-c=
onflict.html">SKIP</a> +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@xe_multigpu_svm@mgpu-concurrent-=
access-prefetch.html">SKIP</a> +16 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8681_FULL and XEIGTPW_14282=
_FULL:</p>
<h3>New IGT tests (21)</h3>
<ul>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-conflict:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-basic:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-conflict:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-fail-basic:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-prefetch:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-basic:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-basic:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-basic:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-prefetch:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-basic:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-prefetch:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-basic:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-conflict:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-prefetch:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-basic:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14282_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-lnl-7/igt@kms_addfb_basic@invalid-smem-bo-=
on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear-atomic@pipe-c-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-3/igt@kms_async_flips@asyn=
c-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054">Intel XE#=
6054</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_atomic_transition@plane-all-=
modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_big_fb@x-tiled-32bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@kms_big_fb@y-tiled-64bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1428">Intel XE#1428</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
28">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_bw@connected-linear-tiling-=
3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@kms_bw@linear-tiling-2-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-=
dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-lnl-5/igt@kms_ccs@ccs-on-another-bo-y-tile=
d-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-yf-t=
iled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3432">Intel XE#3432</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@kms_chamelium_color@ctm-red-to-b=
lue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-lnl-4/igt@kms_chamelium_color@gamma.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
6">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-chang=
e-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-lnl-5/igt@kms_chamelium_frames@hdmi-frame-=
dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@kms_chamelium_sharpness_filter@f=
ilter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-lnl-7/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/307">Intel XE#307</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2390">Intel XE#2390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-2/igt@kms_content_protection@srm@pipe-=
a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-lnl-1/igt@kms_content_protection@uevent.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-2=
56x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-lnl-4/igt@kms_cursor_crc@cursor-random-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-move=
ment-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_142=
82/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel=
 XE#5299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-3/igt@kms_dp_link_training@uhbr-mst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_dsc@dsc-with-output-formats=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2244">Intel XE#2244</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-3/igt@kms_fbcon_fbt@fbc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Inte=
l XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-lnl-3/igt@kms_flip@2x-nonexisting-fb.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +4=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +20 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +53 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs=
-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +44 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-8/igt@kms_hdr@static-toggle@pipe-a-dp-2.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/sha=
rd-bmg-9/igt@kms_hdr@static-toggle@pipe-a-dp-2.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>=
) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888=
-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4329">Intel XE#4329</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6912">Intel XE#6912</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-8/igt@kms_plane_lowres@tiling-y.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
93">Intel XE#2393</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-yf=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5021">Intel XE#5021</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@kms_pm_backlight@brightness-with=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-2/igt@kms_pm_backlight@fade.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">I=
ntel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-8/igt@kms_pm_dc@dc5-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Inte=
l XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-n=
o-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_pm_rpm@package-g7.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814"=
>Intel XE#6814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@kms_psr2_sf@pr-primary-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +9 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-8/igt@kms_psr2_su@frontbuffer-xrgb8888=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2387">Intel XE#2387</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-lnl-1/igt@kms_psr2_su@page_flip-nv12.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
128">Intel XE#1128</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-8/igt@kms_psr@fbc-pr-primary-page-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +22 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-lnl-5/igt@kms_psr@fbc-pr-sprite-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_psr@psr2-primary-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_psr_stress_test@flip-primar=
y-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip-over=
lay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14282/shard-lnl-3/igt@kms_psr_stress_test@invalidate-primary-flip-=
overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4692">Intel XE#4692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-forma=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-c=
enter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@kms_sharpness_filter@invalid-fil=
ter-with-scaling-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_tiled_display@basic-test-pa=
ttern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@kms_vrr@max-min.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel =
XE#1499</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-2/igt@xe_compute@ccs-mode-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
99">Intel XE#6599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-lnl-3/igt@xe_compute_preempt@compute-preem=
pt-many-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5191">Intel XE#5191</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-3/igt@xe_create@multigpu-create-massiv=
e-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@xe_eudebug@basic-vm-bind-metada=
ta-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4837">Intel XE#4837</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write-stress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-lnl-8/igt@xe_eudebug_online@pagefault-writ=
e-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6665">Intel XE#6665</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@xe_eudebug_online@pagefault-writ=
e-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6665">Intel XE#6665</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6681">Intel XE#6681</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-lnl-4/igt@xe_eudebug_online@resume-dss.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6665">Intel XE#6665</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-faultable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-8/igt@xe_eudebug_online@set-breakpoint=
-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +8 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-lnl-8/igt@xe_evict@evict-beng-small-extern=
al-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-b=
indexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +12 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-lnl-3/igt@xe_exec_basic@multigpu-once-null=
-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-lnl-2/igt@xe_exec_multi_queue@one-queue-pr=
eempt-mode-fault-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-p=
reempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +44 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-3/igt@xe_exec_system_allocator@many-64=
k-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5007">Intel XE#5007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge=
-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-lnl-8/igt@xe_exec_system_allocator@threads=
-shared-vm-many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-=
huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@xe_exec_system_allocator@threads=
-shared-vm-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +27 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-prefetch-madvise:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-lnl-8/igt@xe_exec_system_allocator@twice-l=
arge-malloc-prefetch-madvise.html">WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5786">Intel XE#5786</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@xe_fault_injection@probe-fail-gu=
c-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@xe_live_ktest@xe_eudebug.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/283=
3">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@xe_pat@pat-index-xelpg.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236"=
>Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-3/igt@xe_pm@s4-d3cold-basic-exec.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_=
decode0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe=
_engine_class_video_decode0.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-3/igt@xe_pmu@engine-activi=
ty-accuracy-90@engine-drm_xe_engine_class_video_decode0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#=
6251</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-1/igt@xe_pxp@display-pxp-fb.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">=
Intel XE#4733</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-8/igt@xe_query@multigpu-query-invalid-=
extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@xe_sriov_flr@flr-vf1-clear.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
569">Intel XE#6569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5993">Intel XE#5993</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_14282/shard-lnl-2/igt@kms_async_flips@async-flip=
-with-page-flip-events-linear.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transiti=
on.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6819">Intel XE#6819</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_atomic_transition@pla=
ne-all-modeset-transition.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transiti=
on-fencing.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-10/igt@kms_atomic_trans=
ition@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pas=
s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transiti=
on@pipe-a-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6891">Intel XE#6891</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_atomic_tr=
ansition@plane-all-modeset-transition@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14282/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-9/igt@kms_hdr@static-swap.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/sh=
ard-bmg-10/igt@kms_hdr@static-swap.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-wit=
h-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@kms_plane_scaling@p=
lane-downscale-factor-0-5-with-pixel-format.html">PASS</a> +66 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-l=
nl-3/igt@kms_pm_dc@dc5-psr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel X=
E#6361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14282/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-mmap-prefet=
ch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6557">Intel XE#6557</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-2/igt@xe_exec_system_al=
locator@many-stride-mmap-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-i=
dx-uc-single-vma.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-5/igt@xe_exec_system_al=
locator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8681/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8681/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-4/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8681/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8681/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8681/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8681/shard-lnl-7/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-ln=
l-4/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8681/shard-lnl-2/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard=
-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-5/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/sh=
ard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-1/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
681/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8681/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-3/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8681/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8681/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282=
/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14282/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_14282/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14282/shard-lnl-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard=
-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
282/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14282/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14282/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_14282/shard-lnl-5/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/sh=
ard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-7/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14282/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14282/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14282/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-ln=
l-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-7/igt@xe_module_load@load.html"=
>PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_comput=
e0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe=
_engine_class_compute0.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-lnl-3/igt@xe_pmu@engi=
ne-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html">PASS</a> =
+1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14282/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-2/igt@kms_content_protection@content-type-change.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_14282/shard-bmg-9/igt@kms_content_protection@content-type-cha=
nge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-2/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#67=
03</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
282/shard-bmg-2/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4t=
iledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_flip_sca=
led_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-3/igt@kms_frontbuffe=
r_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#23=
11</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri=
-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-8/igt@kms_frontbuffer=
_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
>Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14282/shard-bmg-9/igt@kms_frontbuffer_tracking@plane-fbc-rte.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/sh=
ard-bmg-2/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14282/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-yftiled.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6912">Intel XE#6912</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel =
XE#6693</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14282/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE=
#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-ex=
ceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_ps=
r2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#=
1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-2/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14282/shard-bmg-9/igt@kms_psr@fbc-psr-sprite-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_14282/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-re=
flect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-2/igt@kms_sharpness_filter@filter-toggle.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Int=
el XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14282/shard-bmg-8/igt@kms_sharpness_filter@filter-toggle.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">In=
tel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">I=
ntel XE#1729</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14282/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426=
">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-2/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#67=
03</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
282/shard-bmg-9/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-2/igt@xe_eudebug_online@interrupt-all-set-breakpoint-f=
aultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-7/igt@xe_eudebug_online@interru=
pt-all-set-breakpoint-faultable.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-faul=
t-dyn-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shard-bmg-2/igt@xe_exec_multi_queue=
@many-execs-preempt-mode-fault-dyn-priority.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-10/igt@xe_peer2peer@read.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shar=
d-bmg-2/igt@xe_peer2peer@read.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-2/igt@xe_peer2peer@write.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14282/shar=
d-bmg-9/igt@xe_peer2peer@write.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8681/shard-bmg-2/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4282/shard-bmg-3/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a=
>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8681 -&gt; IGTPW_14282</li>
<li>Linux: xe-4315-633f3e5eab13c5bc2d760d1f3db65eb346d9babb -&gt; xe-4326-5=
fc5192372599f11da8dee072fd8beb4414f8eca</li>
</ul>
<p>IGTPW_14282: 14282<br />
  IGT_8681: c49f35440873244aa86e778007ed2dcbe5bf0ecb @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-4315-633f3e5eab13c5bc2d760d1f3db65eb346d9babb: 633f3e5eab13c5bc2d760d1=
f3db65eb346d9babb<br />
  xe-4326-5fc5192372599f11da8dee072fd8beb4414f8eca: 5fc5192372599f11da8dee0=
72fd8beb4414f8eca</p>

</body>
</html>

--===============3148571645346739425==--
