Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A5BC982E1
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 07:44:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A691010E46F;
	Mon, 21 Sep 2026 07:44:05 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70FC10E523;
 Mon, 21 Sep 2026 07:43:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1810091418800385497=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/kms=5Fcolor=3A_Add_s?=
 =?utf-8?q?upport_for_background_color_testing=2E_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 21 Sep 2026 07:43:17 -0000
Message-ID: <178997659779.185576.7362537075153823565@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260917191835.977425-1-swati2.sharma@intel.com>
In-Reply-To: <20260917191835.977425-1-swati2.sharma@intel.com>
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

--===============1810091418800385497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_color: Add support for background color testing. (rev6)
URL   : https://patchwork.freedesktop.org/series/167119/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9103_FULL -> XEIGTPW_15868_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15868_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15868_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15868_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@core_getversion@all-cards:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@core_getversion@all-cards.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@core_getversion@all-cards.html

  * igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][3] +9 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
    - shard-bmg:          [PASS][4] -> [DMESG-WARN][5] +150 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][6] -> [SKIP][7] +632 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_spin_batch@spin-basic-all:
    - shard-bmg:          NOTRUN -> [SKIP][8] +84 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_spin_batch@spin-basic-all.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-bmg:          [SKIP][9] ([Intel XE#2327]) -> [SKIP][10] +4 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][11] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][13] ([Intel XE#1124]) -> [SKIP][14] +10 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][15] ([Intel XE#7679]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][17] ([Intel XE#367]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][19] ([Intel XE#2652]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][21] ([Intel XE#2887]) -> [SKIP][22] +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][23] ([Intel XE#3432]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][25] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][26] +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@kms_chamelium_color@ctm-red-to-blue.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][27] ([Intel XE#2252]) -> [SKIP][28] +8 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][29] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_content_protection@dp-mst-type-1.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][31] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][32] +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_content_protection@legacy.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][33] ([Intel XE#7642]) -> [SKIP][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@kms_content_protection@mei-interface.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][35] ([Intel XE#6707] / [Intel XE#7439]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_content_protection@uevent.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][37] ([Intel XE#2320]) -> [SKIP][38] +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          [SKIP][39] ([Intel XE#4331] / [Intel XE#7227]) -> [SKIP][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-output-formats-ultrajoiner:
    - shard-bmg:          [SKIP][41] ([Intel XE#8265]) -> [SKIP][42] +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          [SKIP][43] ([Intel XE#4422] / [Intel XE#7442]) -> [SKIP][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][45] ([Intel XE#4156] / [Intel XE#7425]) -> [SKIP][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_fbcon_fbt@fbc-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][47] ([Intel XE#8680]) -> [SKIP][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][49] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][50] +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][51] ([Intel XE#7178] / [Intel XE#7349]) -> [SKIP][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-bmg:          [SKIP][53] ([Intel XE#7179]) -> [SKIP][54] +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          [SKIP][55] ([Intel XE#2311]) -> [SKIP][56] +46 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][57] ([Intel XE#9329]) -> [SKIP][58] +73 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][59] ([Intel XE#4141]) -> [SKIP][60] +16 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][61] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][62] +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][63] ([Intel XE#2352] / [Intel XE#7399]) -> [SKIP][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][65] ([Intel XE#7061]) -> [SKIP][66] +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-bmg:          [SKIP][67] ([Intel XE#7399]) -> [SKIP][68] +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][69] ([Intel XE#2313]) -> [SKIP][70] +57 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
    - shard-bmg:          [FAIL][71] ([Intel XE#9313]) -> [SKIP][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][73] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][75] ([Intel XE#6911] / [Intel XE#7378]) -> [SKIP][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@kms_joiner@basic-ultra-joiner.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-bmg:          [SKIP][77] ([Intel XE#8348]) -> [SKIP][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_mst@mst-suspend-read-crc.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - shard-bmg:          [SKIP][79] ([Intel XE#7283]) -> [SKIP][80] +5 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][81] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][82] +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][83] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) -> [SKIP][84] +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][85] ([Intel XE#1489]) -> [SKIP][86] +7 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][87] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][88] +15 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_psr@psr-primary-page-flip.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][89] ([Intel XE#2234]) -> [SKIP][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_psr@psr2-primary-render.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][91] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][92] +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_rotation_crc@sprite-rotation-90.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          [SKIP][93] ([Intel XE#6503]) -> [SKIP][94] +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][95] ([Intel XE#1499] / [Intel XE#9271]) -> [SKIP][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-drrs.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][97] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][98] +8 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:
    - shard-bmg:          [DMESG-WARN][99] ([Intel XE#9331]) -> [DMESG-WARN][100] +2 other tests dmesg-warn
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          [SKIP][101] ([Intel XE#8374]) -> [SKIP][102] +14 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:
    - shard-bmg:          [SKIP][103] ([Intel XE#8364]) -> [SKIP][104] +28 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html

  * igt@xe_exec_reset@multi-queue-cat-error:
    - shard-bmg:          [SKIP][105] ([Intel XE#8369]) -> [SKIP][106] +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@xe_exec_reset@multi-queue-cat-error.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_exec_reset@multi-queue-cat-error.html

  * igt@xe_exec_system_allocator@once-large-malloc-busy-nomemset:
    - shard-bmg:          [DMESG-WARN][107] ([Intel XE#9331]) -> [SKIP][108] +9 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@xe_exec_system_allocator@once-large-malloc-busy-nomemset.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_exec_system_allocator@once-large-malloc-busy-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-malloc-race:
    - shard-bmg:          [DMESG-WARN][109] -> [SKIP][110] +40 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-malloc-race.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-malloc-race.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset:
    - shard-bmg:          [SKIP][111] -> [DMESG-WARN][112] +64 other tests dmesg-warn
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
    - shard-bmg:          [SKIP][113] ([Intel XE#8378]) -> [SKIP][114] +10 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html

  * igt@xe_page_reclaim@binds-large-split:
    - shard-bmg:          [SKIP][115] ([Intel XE#7793]) -> [SKIP][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@xe_page_reclaim@binds-large-split.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_page_reclaim@binds-large-split.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][117] ([Intel XE#1420] / [Intel XE#7590]) -> [SKIP][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@xe_pat@pat-index-xehpc.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-bmg:          [FAIL][119] ([Intel XE#7695]) -> [SKIP][120] +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-2/igt@xe_pat@pat-sw-hw-suspend.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_pat@pat-sw-hw-suspend.html

  * igt@xe_pat@xa-app-transient-media-on:
    - shard-bmg:          [SKIP][121] ([Intel XE#7590]) -> [SKIP][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@xe_pat@xa-app-transient-media-on.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_pat@xa-app-transient-media-on.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][123] ([Intel XE#5694] / [Intel XE#7370]) -> [SKIP][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@xe_pm@d3cold-i2c.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][125] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@xe_pm@d3cold-multiple-execs.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          [SKIP][127] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][128] +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][129] ([Intel XE#8966]) -> [SKIP][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@xe_survivability@runtime-survivability.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_survivability@runtime-survivability.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@runner@aborted:
    - {shard-ptl}:        NOTRUN -> [FAIL][131]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-ptl-3/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between XEIGT_9103_FULL and XEIGTPW_15868_FULL:

### New IGT tests (5) ###

  * igt@kms_color@background-color:
    - Statuses : 3 pass(s)
    - Exec time: [5.83, 8.62] s

  * igt@kms_color@background-color@pipe-a-background-color:
    - Statuses : 3 pass(s)
    - Exec time: [1.40, 1.90] s

  * igt@kms_color@background-color@pipe-b-background-color:
    - Statuses : 3 pass(s)
    - Exec time: [2.00, 2.38] s

  * igt@kms_color@background-color@pipe-c-background-color:
    - Statuses : 3 pass(s)
    - Exec time: [1.94, 2.27] s

  * igt@kms_color@background-color@pipe-d-background-color:
    - Statuses : 2 pass(s)
    - Exec time: [1.99, 2.31] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_15868_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#8749])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@core_hotunplug@hotrebind.html

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [PASS][133] -> [SKIP][134] ([Intel XE#8749]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@core_hotunplug@hotunbind-rebind.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@core_hotunplug@hotunbind-rebind.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [PASS][135] -> [SKIP][136] ([Intel XE#2134]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@fbdev@nullptr.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@fbdev@nullptr.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][137] ([Intel XE#6078])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#7059] / [Intel XE#7085])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2327])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#1124]) +4 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#367])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#3432])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#2652]) +15 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#2887]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#9329]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2325] / [Intel XE#7358])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2252])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#6969]) +23 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#6974])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][150] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-10/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#1340] / [Intel XE#7435])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#8265])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#8680])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#7178] / [Intel XE#7351])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#7179])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-10/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#4141]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#7061] / [Intel XE#7356])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#2311]) +15 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#7061])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#2313]) +19 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#2393])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#2763] / [Intel XE#6886]) +7 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#8395] / [Intel XE#8396])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#8396]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-lnl:          [PASS][166] -> [FAIL][167] ([Intel XE#8399])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-3/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-lnl-1/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#8710]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [PASS][169] -> [SKIP][170] ([Intel XE#8710]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#1489]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-10/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#6503])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@kms_sharpness_filter@filter-basic.html

  * igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:
    - shard-bmg:          NOTRUN -> [ABORT][174] ([Intel XE#8868])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-9/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html

  * igt@xe_compute@eu-busy-10s:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#6599])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-9/igt@xe_compute@eu-busy-10s.html

  * igt@xe_evict@evict-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][176] ([Intel XE#8370])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@xe_evict@evict-small-multi-queue.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_fault_mode@atomic-many:
    - shard-bmg:          [PASS][178] -> [FAIL][179] ([Intel XE#8578])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-4/igt@xe_exec_fault_mode@atomic-many.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-imm:
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#8374]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-imm.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][181] ([Intel XE#8364]) +8 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html

  * igt@xe_exec_reset@multi-queue-cancel-on-secondary:
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#8369])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@xe_exec_reset@multi-queue-cancel-on-secondary.html

  * igt@xe_exec_system_allocator@evict-malloc:
    - shard-bmg:          [PASS][183] -> [DMESG-WARN][184] ([Intel XE#9309])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-4/igt@xe_exec_system_allocator@evict-malloc.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@xe_exec_system_allocator@evict-malloc.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][185] ([Intel XE#8378]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          NOTRUN -> [SKIP][186] ([Intel XE#6281] / [Intel XE#7426])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [PASS][187] -> [SKIP][188] ([Intel XE#2229])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213]) -> ([PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [SKIP][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239]) ([Intel XE#2457] / [Intel XE#7405])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-2/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-4/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-4/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-10/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-10/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-9/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-9/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-2/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-2/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-4/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-6/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-6/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][240] ([Intel XE#6964])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [SKIP][241] ([Intel XE#2284] / [Intel XE#7370])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          [PASS][242] -> [INCOMPLETE][243] ([Intel XE#8175])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-4/igt@xe_pm@s3-multiple-execs.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-6/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          [PASS][244] -> [FAIL][245] ([Intel XE#7992])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@xe_pmu@fn-engine-activity-load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_prefetch_fault@prefetch-fault:
    - shard-bmg:          NOTRUN -> [SKIP][246] ([Intel XE#7599])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@xe_prefetch_fault@prefetch-fault.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][247] ([Intel XE#4733] / [Intel XE#7417])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-2/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][248] ([Intel XE#944])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-9/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [PASS][249] -> [FAIL][250] ([Intel XE#6569])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [SKIP][251] ([Intel XE#8749]) -> [PASS][252] +1 other test pass
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@core_hotunplug@hotreplug.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@core_hotunplug@hotreplug.html

  * igt@fbdev@info:
    - shard-bmg:          [SKIP][253] ([Intel XE#2134]) -> [PASS][254] +2 other tests pass
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@fbdev@info.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-9/igt@fbdev@info.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][255] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][256]
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2:
    - shard-bmg:          [FAIL][257] ([Intel XE#6078]) -> [PASS][258]
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-lnl:          [FAIL][259] ([Intel XE#1231]) -> [PASS][260]
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_flip@blocking-wf_vblank@d-hdmi-a3:
    - shard-bmg:          [FAIL][261] ([Intel XE#3149] / [Intel XE#5408] / [Intel XE#6266]) -> [PASS][262] +1 other test pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@kms_flip@blocking-wf_vblank@d-hdmi-a3.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-2/igt@kms_flip@blocking-wf_vblank@d-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][263] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][264] +1 other test pass
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][265] ([Intel XE#9329]) -> [PASS][266] +34 other tests pass
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_hdmi_inject@inject-audio:
    - {shard-ptl}:        [SKIP][267] ([Intel XE#7308]) -> [PASS][268]
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-ptl-5/igt@kms_hdmi_inject@inject-audio.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-ptl-4/igt@kms_hdmi_inject@inject-audio.html
    - shard-bmg:          [SKIP][269] ([Intel XE#7308]) -> [PASS][270]
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_hdmi_inject@inject-audio.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-9/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-bmg:          [INCOMPLETE][271] ([Intel XE#2597]) -> [PASS][272] +1 other test pass
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-4/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][273] ([Intel XE#8399]) -> [PASS][274]
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-bmg:          [SKIP][275] ([Intel XE#8710]) -> [PASS][276] +1 other test pass
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_pm_rpm@legacy-planes-dpms.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][277] -> [PASS][278] +601 other tests pass
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-10/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-race:
    - shard-bmg:          [DMESG-WARN][279] -> [PASS][280] +124 other tests pass
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@xe_exec_system_allocator@many-large-execqueues-malloc-race.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-10/igt@xe_exec_system_allocator@many-large-execqueues-malloc-race.html

  * igt@xe_exec_system_allocator@partial-atomic-middle-munmap-no-cpu-fault:
    - shard-bmg:          [DMESG-WARN][281] ([Intel XE#9331]) -> [PASS][282] +16 other tests pass
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-2/igt@xe_exec_system_allocator@partial-atomic-middle-munmap-no-cpu-fault.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@xe_exec_system_allocator@partial-atomic-middle-munmap-no-cpu-fault.html

  * igt@xe_exec_system_allocator@processes-evict-malloc:
    - shard-bmg:          [DMESG-WARN][283] ([Intel XE#9309]) -> [PASS][284]
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@xe_exec_system_allocator@processes-evict-malloc.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@xe_exec_system_allocator@processes-evict-malloc.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-lnl:          [FAIL][285] ([Intel XE#9096]) -> [PASS][286]
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-lnl-3/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          [FAIL][287] -> [PASS][288] +1 other test pass
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_module_load@force-load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@xe_module_load@force-load.html

  * igt@xe_oa@non-zero-reason-all:
    - {shard-ptl}:        [FAIL][289] ([Intel XE#7334]) -> [PASS][290] +1 other test pass
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-ptl-5/igt@xe_oa@non-zero-reason-all.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-ptl-2/igt@xe_oa@non-zero-reason-all.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-bmg:          [INCOMPLETE][291] ([Intel XE#8175]) -> [PASS][292]
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@xe_pm@s3-vm-bind-prefetch.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@xe_pm@s3-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [SKIP][293] -> [FAIL][294] ([Intel XE#3718] / [Intel XE#6078])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][295] -> [SKIP][296] ([Intel XE#7059] / [Intel XE#7085]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][297] -> [SKIP][298] ([Intel XE#2327]) +2 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][299] -> [SKIP][300] ([Intel XE#1124]) +8 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][301] -> [SKIP][302] ([Intel XE#607] / [Intel XE#7361])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][303] -> [SKIP][304] ([Intel XE#610] / [Intel XE#7387])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][305] -> [SKIP][306] ([Intel XE#367]) +3 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][307] ([Intel XE#3432]) -> [SKIP][308] ([Intel XE#9329]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][309] ([Intel XE#9329]) -> [SKIP][310] ([Intel XE#3432]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][311] ([Intel XE#9329]) -> [SKIP][312] ([Intel XE#2887]) +13 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][313] ([Intel XE#9329]) -> [SKIP][314] ([Intel XE#2652]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][315] ([Intel XE#2887]) -> [SKIP][316] ([Intel XE#9329]) +11 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][317] -> [SKIP][318] ([Intel XE#2325] / [Intel XE#7358]) +2 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_chamelium_color@degamma.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-bmg:          [SKIP][319] -> [SKIP][320] ([Intel XE#7358]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][321] -> [SKIP][322] ([Intel XE#2252]) +5 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][323] -> [SKIP][324] ([Intel XE#6507])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_chamelium_sharpness_filter@filter-basic.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-bmg:          [SKIP][325] -> [SKIP][326] ([Intel XE#6974])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][327] -> [FAIL][328] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_content_protection@srm.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-10/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][329] -> [SKIP][330] ([Intel XE#7642])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_content_protection@type1.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-6/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          [SKIP][331] -> [SKIP][332] ([Intel XE#2320]) +3 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][333] -> [SKIP][334] ([Intel XE#2321] / [Intel XE#7355]) +2 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          [SKIP][335] -> [SKIP][336] ([Intel XE#2286] / [Intel XE#6035])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-bmg:          [SKIP][337] -> [SKIP][338] ([Intel XE#9009])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-9/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-with-bpc-bigjoiner:
    - shard-bmg:          [SKIP][339] -> [SKIP][340] ([Intel XE#8265]) +3 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-bigjoiner.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-bigjoiner.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][341] -> [SKIP][342] ([Intel XE#7178] / [Intel XE#7349])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][343] -> [SKIP][344] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][345] ([Intel XE#9329]) -> [SKIP][346] ([Intel XE#4141]) +12 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][347] ([Intel XE#9329]) -> [SKIP][348] ([Intel XE#2311]) +56 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][349] ([Intel XE#9329]) -> [SKIP][350] ([Intel XE#7061]) +2 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][351] ([Intel XE#9329]) -> [SKIP][352] ([Intel XE#2313]) +63 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][353] ([Intel XE#9329]) -> [SKIP][354] ([Intel XE#7061] / [Intel XE#7356]) +5 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-bmg:          [SKIP][355] -> [FAIL][356] ([Intel XE#9319])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-6/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][357] -> [SKIP][358] ([Intel XE#1503])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][359] -> [SKIP][360] ([Intel XE#6911] / [Intel XE#7378])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][361] -> [SKIP][362] ([Intel XE#7591])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][363] -> [SKIP][364] ([Intel XE#7283]) +5 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-4/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][365] -> [SKIP][366] ([Intel XE#5021] / [Intel XE#7377]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][367] -> [SKIP][368] ([Intel XE#2763] / [Intel XE#6886]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          [SKIP][369] -> [SKIP][370] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_pm_backlight@bad-brightness.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc3co-framedrop-check:
    - shard-bmg:          [SKIP][371] -> [SKIP][372] ([Intel XE#8395] / [Intel XE#8396])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_pm_dc@dc3co-framedrop-check.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_pm_dc@dc3co-framedrop-check.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][373] ([Intel XE#8710]) -> [SKIP][374] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][375] ([Intel XE#8710]) -> [SKIP][376] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          [SKIP][377] ([Intel XE#8710]) -> [SKIP][378] ([Intel XE#6814] / [Intel XE#7428])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_pm_rpm@package-g7.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-9/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          [SKIP][379] -> [SKIP][380] ([Intel XE#1489]) +8 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][381] -> [SKIP][382] ([Intel XE#2234] / [Intel XE#2850]) +15 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          [SKIP][383] -> [SKIP][384] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-270.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][385] -> [SKIP][386] ([Intel XE#2413])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - shard-bmg:          [SKIP][387] -> [SKIP][388] ([Intel XE#6503]) +3 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_sharpness_filter@filter-scaler-downscale.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@kms_sharpness_filter@filter-scaler-downscale.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][389] -> [SKIP][390] ([Intel XE#2509] / [Intel XE#7437])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][391] -> [SKIP][392] ([Intel XE#1499] / [Intel XE#9271]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_vrr@flip-suspend.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-6/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf-dc3co:
    - shard-bmg:          [SKIP][393] -> [SKIP][394] ([Intel XE#8397])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_vrr@lobf-dc3co.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_vrr@lobf-dc3co.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][395] -> [SKIP][396] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_evict@evict-small-multi-queue-priority:
    - shard-bmg:          [SKIP][397] -> [SKIP][398] ([Intel XE#8370]) +1 other test skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-10/igt@xe_evict@evict-small-multi-queue-priority.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][399] -> [SKIP][400] ([Intel XE#2322] / [Intel XE#7372]) +7 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch:
    - shard-bmg:          [SKIP][401] -> [SKIP][402] ([Intel XE#8374]) +17 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          [SKIP][403] -> [SKIP][404] ([Intel XE#8364]) +31 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-priority.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          [SKIP][405] -> [SKIP][406] ([Intel XE#8369]) +2 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-10/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:
    - shard-bmg:          [SKIP][407] -> [SKIP][408] ([Intel XE#8378]) +9 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][409] -> [SKIP][410] ([Intel XE#2248] / [Intel XE#7325] / [Intel XE#7393])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_page_reclaim@binds-1g-partial:
    - shard-bmg:          [SKIP][411] -> [SKIP][412] ([Intel XE#7793]) +2 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_page_reclaim@binds-1g-partial.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-10/igt@xe_page_reclaim@binds-1g-partial.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][413] -> [SKIP][414] ([Intel XE#2245] / [Intel XE#7590])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_pat@pat-index-xelp.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          [SKIP][415] -> [SKIP][416] ([Intel XE#2284] / [Intel XE#7370])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_pm@s3-d3cold-basic-exec.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][417] -> [SKIP][418] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7517])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-10/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_prefetch_fault@l2-prefetch-fault-svm:
    - shard-bmg:          [SKIP][419] -> [SKIP][420] ([Intel XE#8815]) +1 other test skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-9/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          [SKIP][421] -> [SKIP][422] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][423] -> [SKIP][424] ([Intel XE#944]) +4 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-4/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [SKIP][425] -> [FAIL][426] ([Intel XE#7992])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_sriov_flr@flr-vfs-parallel.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [SKIP][427] -> [DMESG-WARN][428] ([Intel XE#8963]) +1 other test dmesg-warn
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5946]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5946
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7325
  [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
  [Intel XE#7334]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7393
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8710]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710
  [Intel XE#8749]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749
  [Intel XE#8815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#8966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8966
  [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9309
  [Intel XE#9312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312
  [Intel XE#9313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313
  [Intel XE#9319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9319
  [Intel XE#9329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9329
  [Intel XE#9331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_9103 -> IGTPW_15868
  * Linux: xe-5781-2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c -> xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf

  IGTPW_15868: 9f7ec1b16076bea142f4b3bba6e5ba8222769023 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5781-2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c: 2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c
  xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf: 7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/index.html

--===============1810091418800385497==
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
<tr><td><b>Series:</b></td><td>tests/kms_color: Add support for background =
color testing. (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/167119/">https://patchwork.freedesktop.org/series/167119/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15868/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15868/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9103_FULL -&gt; XEIGTPW_15868_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15868_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_15868_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15=
868_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@core_getversion@all-cards.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-=
7/igt@core_getversion@all-cards.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@xe_exec_system_allocator@many-la=
rge-execqueues-new-race-nomemset.html">DMESG-WARN</a> +9 other tests dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-=
huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-=
execqueues-mmap-new-huge.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@xe_exec_system_allocato=
r@threads-shared-vm-many-execqueues-mmap-new-huge.html">DMESG-WARN</a> +150=
 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-=
xe_ggtt_init_early.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_fault_injection@inject-fau=
lt-probe-function-xe_ggtt_init_early.html">SKIP</a> +632 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-basic-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_spin_batch@spin-basic-all.htm=
l">SKIP</a> +84 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">In=
tel XE#2327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15868/shard-bmg-7/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP=
</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180=
-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7059">Intel XE#7059</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_big_fb@li=
near-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-1=
80-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_big_fb@y-tiled-m=
ax-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> +10 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-target=
-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7679">Intel XE#7679</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_bw@connected-linea=
r-tiling-4-displays-target-3840x2160p.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-target-3840x2160=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/367">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-ta=
rget-3840x2160p.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/26=
52">Intel XE#2652</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15868/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-cc=
s.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-1=
80-4-tiled-dg2-mc-ccs.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/343=
2">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15868/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.=
html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">In=
tel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7358">Intel XE#7358</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-b=
lue.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hiberna=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2252">Intel XE#2252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-chan=
ge-during-hibernate.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_content_protection@dp-mst-type-1.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">=
Intel XE#2390</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6974">Intel XE#6974</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_content_protection@dp-mst-=
type-1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_content_protection@legacy.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE=
#1178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3304">Intel XE#3304</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_content_protection@l=
egacy.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@kms_content_protection@mei-interface.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">I=
ntel XE#7642</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15868/shard-bmg-7/igt@kms_content_protection@mei-interface.html">SK=
IP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_content_protection@uevent.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE=
#6707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7439">Intel XE#7439</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_content_protection@uevent.html">SK=
IP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320=
">Intel XE#2320</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15868/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-256x85.htm=
l">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331"=
>Intel XE#4331</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7227">Intel XE#7227</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc=
-fallback.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-ultrajoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
8265">Intel XE#8265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-ultraj=
oiner.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visi=
ble-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4422">Intel XE#4422</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_fbc_dir=
ty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#41=
56</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/742=
5">Intel XE#7425</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15868/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">Intel XE#868=
0</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_158=
68/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-yt=
ileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@k=
ms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP<=
/a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4=
tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/i=
gt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.ht=
ml">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-lin=
ear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7179">Intel XE#7179</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_flip_scaled_crc@=
flip-p016-linear-to-p016-linear-reflect-x.html">SKIP</a> +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-ren=
der.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-=
rgb101010-draw-render.html">SKIP</a> +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur=
-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/9329">Intel XE#9329</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_frontbuffer=
_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> +73 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-sh=
rfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_frontbuffer_track=
ing@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> +16 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-bl=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7061">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_frontbuffer_tr=
acking@fbc-argb161616f-draw-blt.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
352">Intel XE#2352</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7399">Intel XE#7399</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_frontbuffer_tracking@=
fbcdrrs-tiling-y.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_frontbuffer_tracki=
ng@fbcdrrshdr-argb161616f-draw-render.html">SKIP</a> +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7399">Intel XE#7399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-=
tiling-y.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-=
shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_frontbuffer_=
tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> +57 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank160:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313">I=
ntel XE#9313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15868/shard-bmg-7/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">SK=
IP</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3=
374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/35=
44">Intel XE#3544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15868/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE=
#6911</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7378">Intel XE#7378</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html">SK=
IP</a></li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348">Intel XE#=
8348</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15868/shard-bmg-7/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifi=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7283">Intel XE#7283</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-=
dg2-rc-ccs-modifier.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscal=
e-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_pl=
ane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel =
XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_pm_backlight@fade-wi=
th-dpms.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg=
-area.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel X=
E#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2850">Intel XE#2850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.html">S=
KIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#=
2234</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15868/shard-bmg-7/igt@kms_psr@psr2-primary-render.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">I=
ntel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7342">Intel XE#7342</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_rotation_crc@sprite-rotatio=
n-90.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-scaling=
-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6503">Intel XE#6503</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_sharpness_filter@invalid=
-filter-with-scaling-mode.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel =
XE#1499</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/9271">Intel XE#9271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html=
">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-b=
indexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt=
@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html"=
>SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-invalid-userp=
tr-fault.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@xe_exec_fault_mode@=
many-execqueues-invalid-userptr-fault.html">DMESG-WARN</a> +2 other tests d=
mesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-im=
m:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-multi-queue-u=
serptr-invalidate-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_exec_faul=
t_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> +1=
4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-6/igt@xe_exec_multi_queue@max-queues-preempt-mode-clos=
e-fd-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_exec_multi_queue@max-=
queues-preempt-mode-close-fd-smem.html">SKIP</a> +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@xe_exec_reset@multi-queue-cat-error.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">I=
ntel XE#8369</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15868/shard-bmg-7/igt@xe_exec_reset@multi-queue-cat-error.html">SKI=
P</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc-busy-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-5/igt@xe_exec_system_allocator@once-large-malloc-busy-=
nomemset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_exec_system_allo=
cator@once-large-malloc-busy-nomemset.html">SKIP</a> +9 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-mall=
oc-race.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_exec_system_allocator@process-m=
any-large-malloc-race.html">SKIP</a> +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-=
stride-free-nomemset.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@xe_exec_system_allocator@th=
reads-shared-vm-many-stride-free-nomemset.html">DMESG-WARN</a> +64 other te=
sts dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-userp=
tr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_exec_threads=
@threads-multi-queue-mixed-userptr-invalidate-race.html">SKIP</a> +10 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-large-split:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@xe_page_reclaim@binds-large-split.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Inte=
l XE#7793</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15868/shard-bmg-7/igt@xe_page_reclaim@binds-large-split.html">SKIP</a>=
</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-6/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590"=
>Intel XE#7590</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15868/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-2/igt@xe_pat@pat-sw-hw-suspend.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1586=
8/shard-bmg-7/igt@xe_pat@pat-sw-hw-suspend.html">SKIP</a> +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-on:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel=
 XE#7590</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15868/shard-bmg-7/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a></=
li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel X=
E#7370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15868/shard-bmg-7/igt@xe_pm@d3cold-i2c.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#=
2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
370">Intel XE#7370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15868/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html">SKIP<=
/a></li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bi=
nd-post-termination-irq.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@xe_survivability@runtime-survivability.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8966">Intel XE#8966</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_survivability@runtime-survivabilit=
y.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>igt@runner@aborted:<ul>
<li>{shard-ptl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-ptl-3/igt@runner@aborted.html">FAIL</a></l=
i>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_9103_FULL and XEIGTPW_15868=
_FULL:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@kms_color@background-color:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [5.83, 8.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@background-color@pipe-a-background-color:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.40, 1.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@background-color@pipe-b-background-color:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.00, 2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@background-color@pipe-c-background-color:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.94, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@background-color@pipe-d-background-color:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.99, 2.31] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15868_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@core_hotunplug@hotrebind.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/874=
9">Intel XE#8749</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard=
-bmg-7/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8749">Intel XE#8749</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@fbdev@n=
ullptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@kms_async_flips@alternate-sync-a=
sync-flip-atomic@pipe-c-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-=
32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@kms_big_fb@x-tiled-64bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-=
target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +15 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-=
y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_ccs@missing-ccs-buffer-y-til=
ed-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/9329">Intel XE#9329</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@kms_chamelium_color@ctm-0-50.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-cha=
nge-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_color_pipeline@plane-lut1d-p=
ost-ctm3x4@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +23 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-2/igt@kms_content_protection@dp-mst-ty=
pe-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-10/igt@kms_content_protection@srm@pipe=
-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1340">Intel XE#1340</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7435">Intel XE#7435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-=
bpc-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_fbcon_fbt@psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">Inte=
l XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-10/igt@kms_flip_scaled_crc@flip-nv12-l=
inear-to-nv12-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs=
-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs=
hdr-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@kms_frontbuffer_tracking@psrhdr-=
1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +19 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-4/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-75@pipe-c.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#=
6886</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_pm_backlight@fade.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">=
Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_pm_dc@dc3co-framedrop-check@=
pr-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_pm_dc@dc3co-framedrop-check@=
psr2-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-lnl-3/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/sha=
rd-lnl-1/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_pm_rpm@basic-pci-d3-state.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8710">Intel XE#8710</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/=
shard-bmg-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710">Intel XE#871=
0</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@kms_psr2_sf@psr2-cursor-plane-mo=
ve-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-10/igt@kms_psr@fbc-psr-primary-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@kms_sharpness_filter@filter-basi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-9/igt@sriov_basic@pf-unbind-with-vfs-e=
nabled-numvfs-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8868">Intel XE#8868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-9/igt@xe_compute@eu-busy-10s.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599"=
>Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@xe_evict@evict-small-multi-queue=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-4/igt@xe_exec_fault_mode@atomic-many.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-=
bmg-6/igt@xe_exec_fault_mode@atomic-many.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8578">Intel XE#8578</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-qu=
eue-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@xe_exec_multi_queue@many-queues-=
preempt-mode-close-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cancel-on-secondary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@xe_exec_reset@multi-queue-cancel=
-on-secondary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@evict-malloc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-4/igt@xe_exec_system_allocator@evict-malloc.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868=
/shard-bmg-8/igt@xe_exec_system_allocator@evict-malloc.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9309">Inte=
l XE#9309</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-10/igt@xe_exec_threads@threads-multi-q=
ueue-mixed-shared-vm-userptr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-6/igt@xe_fault_injection@exec-queue-cr=
eate-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7426">Intel XE#7426</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15868/shard-bmg-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_9103/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_9103/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-2/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_9103/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_9103/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_9103/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-b=
mg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/=
shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_91=
03/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
_9103/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_9103/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_9103/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@xe_modul=
e_load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15868/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bm=
g-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-10/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_158=
68/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-9/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15868/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15868/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15868/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15868/shard-bmg-3/igt@xe_module_load@load.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15868/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bm=
g-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-6/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15868/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15868/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">=
Intel XE#2457</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7405">Intel XE#7405</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-7/igt@xe_multigpu_svm@mgpu-latency-cop=
y-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@xe_pm@d3cold-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Int=
el XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-4/igt@xe_pm@s3-multiple-execs.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-6/i=
gt@xe_pm@s3-multiple-execs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8175">Intel XE#8175</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-5/igt@xe_pmu@fn-engine-activity-load.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-=
bmg-3/igt@xe_pmu@fn-engine-activity-load.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@xe_prefetch_fault@prefetch-fault=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-2/igt@xe_pxp@display-black-pxp-fb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-9/igt@xe_query@multigpu-query-cs-cycle=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard=
-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749">Intel XE#8749=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1586=
8/shard-bmg-5/igt@core_hotunplug@hotreplug.html">PASS</a> +1 other test pas=
s</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@fbdev@info.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-9/=
igt@fbdev@info.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
18">Intel XE#3718</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6078">Intel XE#6078</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_15868/shard-bmg-2/igt@kms_async_flips@alternate-=
sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b=
-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6078">Intel XE#6078</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15868/shard-bmg-2/igt@kms_async_flips@alternate-sy=
nc-async-flip@pipe-b-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-18=
0-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15868/shard-lnl-3/igt@kms_big_fb@4-tiled-ma=
x-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@kms_flip@blocking-wf_vblank@d-hdmi-a3.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">=
Intel XE#3149</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5408">Intel XE#5408</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-2/igt@kms_flip@blockin=
g-wf_vblank@d-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-=
edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-lnl-2/igt@kms_flip@flip-vs-=
expired-vblank-interruptible@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/9329">Intel XE#9329</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@kms_frontbuffer_tracki=
ng@fbchdr-2p-primscrn-spr-indfb-onoff.html">PASS</a> +34 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>{shard-ptl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-ptl-5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#=
7308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15868/shard-ptl-4/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE=
#7308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15868/shard-bmg-9/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-6/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
97">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15868/shard-bmg-4/igt@kms_pipe_crc_basic@suspend-read-crc.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shar=
d-lnl-6/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710">Intel XE=
#8710</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15868/shard-bmg-5/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SK=
IP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_158=
68/shard-bmg-10/igt@xe_exec_basic@many-bindexecqueue-rebind.html">PASS</a> =
+601 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@xe_exec_system_allocator@many-large-execqueues-m=
alloc-race.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15868/shard-bmg-10/igt@xe_exec_system_allocator@many-=
large-execqueues-malloc-race.html">PASS</a> +124 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-atomic-middle-munmap-no-cpu-fault:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-2/igt@xe_exec_system_allocator@partial-atomic-middle-m=
unmap-no-cpu-fault.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@xe_exec_s=
ystem_allocator@partial-atomic-middle-munmap-no-cpu-fault.html">PASS</a> +1=
6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@processes-evict-malloc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@xe_exec_system_allocator@processes-evict-malloc.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9309">Intel XE#9309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@xe_exec_system_allocator@pro=
cesses-evict-malloc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-lnl-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-=
race.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9096">Intel XE#9096</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15868/shard-lnl-3/igt@xe_exec_threads@threads-hang-=
userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_module_load@force-load.html">FAIL</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5=
/igt@xe_module_load@force-load.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason-all:</p>
<ul>
<li>{shard-ptl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-ptl-5/igt@xe_oa@non-zero-reason-all.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334">Intel XE#733=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_158=
68/shard-ptl-2/igt@xe_oa@non-zero-reason-all.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-6/igt@xe_pm@s3-vm-bind-prefetch.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175">Intel =
XE#8175</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15868/shard-bmg-3/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic=
.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15868/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomi=
c.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3718">Intel XE#3718</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-h=
flip.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15868/shard-bmg-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rota=
te-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/s=
hard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-18=
0-hflip.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15868/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-r=
otate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.h=
tml">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15868/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/607">Intel XE#607</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SK=
IP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_158=
68/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel X=
E#610</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-target-2560x1440=
p.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15868/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-target-2560x14=
40p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3432">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tile=
d-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/9329">Intel XE#9329</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-c=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/9329">Intel XE#9329</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15868/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-c=
cs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9329">Intel XE#9329</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +13 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/9329">Intel XE#9329</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15868/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-=
tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2652">Intel XE#2652</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_15868/shard-bmg-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-m=
tl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9329">Intel XE#9329</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_chamelium_color@degamma.html">SKIP</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg=
-3/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ct=
m3x4.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15868/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut1d-po=
st-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html"=
>SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15868/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">=
Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_chamelium_sharpness_filter@filter-basic.html=
">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15868/shard-bmg-5/igt@kms_chamelium_sharpness_filter@filter-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507=
">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.=
html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15868/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_content_protection@srm.html">SKIP</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-=
10/igt@kms_content_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Int=
el XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_content_protection@type1.html">SKIP</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bm=
g-6/igt@kms_content_protection@type1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868=
/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2=
320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868=
/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2=
321</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
55">Intel XE#7355</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-=
atomic-transitions.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15868/shard-bmg-2/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.h=
tml">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15868/shard-bmg-9/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/9009">Intel XE#9009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-bigjoiner.html">SKIP</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-=
bmg-1/igt@kms_dsc@dsc-with-bpc-bigjoiner.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4t=
iledg2rcccs-downscaling.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-3/igt@kms_flip_scaled_crc@flip=
-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Int=
el XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-y=
ftile-downscaling.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15868/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp=
-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9329">Intel XE#9329</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_frontbuffer_tracking=
@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +12 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-=
wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-=
cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9329">Intel XE#9329</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-4/igt@kms_frontbu=
ffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw=
-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9329">Intel XE#9329</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@kms_frontbuffer_tracking@f=
bchdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9329">Intel XE#9329</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-4/igt@kms_frontbuffer_tracking=
@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +63 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mm=
ap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9329">Intel XE#9329</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@kms_frontbuffer_tracking@psr=
-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +5 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.ht=
ml">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15868/shard-bmg-6/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
9319">Intel XE#9319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-4/igt@k=
ms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SK=
IP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_158=
68/shard-bmg-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel =
XE#6911</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.h=
tml">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15868/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-sou=
rce-clamping.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15868/shard-bmg-4/igt@kms_plane@pixel-format-yf-tiled-ccs=
-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard=
-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE=
#7377</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-dow=
nscale-factor-0-5.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15868/shard-bmg-8/igt@kms_plane_scaling@planes-upsca=
le-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard=
-bmg-1/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE=
#7760</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_pm_dc@dc3co-framedrop-check.html">SKIP</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard=
-bmg-5/igt@kms_pm_dc@dc3co-framedrop-check.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE=
#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710">Intel =
XE#8710</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15868/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE=
#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7402">Intel XE#7402</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710">Intel X=
E#8710</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15868/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1=
439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
41">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7383">Intel XE#7383</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710">Intel XE#8710</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/s=
hard-bmg-9/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6814">Intel XE#6814</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428">Intel XE#7428=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-d=
mg-area.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15868/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/sh=
ard-bmg-1/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">In=
tel XE#2850</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-270.html">SKIP=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868=
/shard-bmg-8/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3=
904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
42">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html">SKIP=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868=
/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2=
413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_sharpness_filter@filter-scaler-downscale.htm=
l">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15868/shard-bmg-8/igt@kms_sharpness_filter@filter-scaler-downscale.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
03">Intel XE#6503</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15868/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-ch=
amelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_vrr@flip-suspend.html">SKIP</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-6/igt@=
kms_vrr@flip-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_vrr@lobf-dc3co.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@k=
ms_vrr@lobf-dc3co.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8397">Intel XE#8397</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html">SKI=
P</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1586=
8/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE=
#2504</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7319">Intel XE#7319</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7350">Intel XE#7350</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority.html">=
SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5868/shard-bmg-10/igt@xe_evict@evict-small-multi-queue-priority.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">I=
ntel XE#8370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind=
.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15868/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebin=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7372">Intel XE#7372</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-r=
ebind-prefetch.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15868/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueue=
s-multi-queue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +17 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-priority.html">SK=
IP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_158=
68/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-priority.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel =
XE#8364</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKI=
P</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1586=
8/shard-bmg-10/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel X=
E#8369</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm=
-rebind.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15868/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-s=
hared-vm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8378">Intel XE#8378</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-5/i=
gt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7325">Intel XE#7325</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7393">Intel XE#7=
393</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-1g-partial:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_page_reclaim@binds-1g-partial.html">SKIP</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shar=
d-bmg-10/igt@xe_page_reclaim@binds-1g-partial.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_pat@pat-index-xelp.html">SKIP</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-1/igt=
@xe_pat@pat-index-xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg-=
5/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-bmg=
-10/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329">Intel XE#7329</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517">Int=
el XE#7517</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@l2-prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html">SK=
IP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_158=
68/shard-bmg-9/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815">Intel =
XE#8815</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.ht=
ml">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15868/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7417">Intel XE#7417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html">=
SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5868/shard-bmg-4/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Int=
el XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard-b=
mg-5/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/shard=
-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a=
>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9103 -&gt; IGTPW_15868</li>
<li>Linux: xe-5781-2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c -&gt; xe-5791-7=
b7c73e7898b9ae6d5d2d849fe66c44db9b74caf</li>
</ul>
<p>IGTPW_15868: 9f7ec1b16076bea142f4b3bba6e5ba8222769023 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-5781-2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c: 2c43c8e6bbbe54f755b8e5c=
86d582f78159e7a2c<br />
  xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf: 7b7c73e7898b9ae6d5d2d84=
9fe66c44db9b74caf</p>

</body>
</html>

--===============1810091418800385497==--
