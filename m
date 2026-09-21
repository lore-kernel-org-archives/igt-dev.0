Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468D9C982DA
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 03:53:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D6610E03D;
	Mon, 21 Sep 2026 03:53:18 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE8210E03D;
 Mon, 21 Sep 2026 03:52:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4851438049961404757=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/panthor=3A_skip_spar?=
 =?utf-8?q?se_VM=5FBIND_tests_before_v1=2E9?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Deborah Brouwer" <deborah.brouwer@collabora.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 21 Sep 2026 03:52:34 -0000
Message-ID: <178996275457.185285.28580077917868957@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260920-b4-panthor_version_sparse-v2-1-fa395c125eb1@collabora.com>
In-Reply-To: <20260920-b4-panthor_version_sparse-v2-1-fa395c125eb1@collabora.com>
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

--===============4851438049961404757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/panthor: skip sparse VM_BIND tests before v1.9
URL   : https://patchwork.freedesktop.org/series/174552/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9103_FULL -> XEIGTPW_15867_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15867_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15867_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15867_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@many-bindexecqueue-imm:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +135 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-9/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html

  * igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][3] +76 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-multi-fault:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][4] +8 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-multi-fault.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][5] -> [SKIP][6] +654 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][7] -> [FAIL][8] +5 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-2/igt@xe_module_load@many-reload.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_module_load@many-reload.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority@numvfs-random-gt1-vcs0:
    - shard-bmg:          NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority@numvfs-random-gt1-vcs0.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][10] ([Intel XE#3718] / [Intel XE#6078]) -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][12] ([Intel XE#2370]) -> [SKIP][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          [SKIP][14] ([Intel XE#2327]) -> [SKIP][15] +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][16] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][18] ([Intel XE#1124]) -> [SKIP][19] +11 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][20] ([Intel XE#610] / [Intel XE#7387]) -> [SKIP][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][22] ([Intel XE#367]) -> [SKIP][23] +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][24] ([Intel XE#2887]) -> [SKIP][25] +13 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][26] ([Intel XE#3432]) -> [SKIP][27] +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          [SKIP][28] ([Intel XE#2724] / [Intel XE#7449]) -> [SKIP][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@kms_cdclk@mode-transition.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          [SKIP][30] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@kms_chamelium_color@ctm-max.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-bmg:          [SKIP][32] ([Intel XE#7358]) -> [SKIP][33] +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          [SKIP][34] ([Intel XE#2252]) -> [SKIP][35] +6 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][36] ([Intel XE#7642]) -> [SKIP][37] +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_content_protection@content-type-change.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][38] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-0.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][40] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][41] +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_content_protection@legacy.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][42] ([Intel XE#2320]) -> [SKIP][43] +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          [SKIP][44] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][46] ([Intel XE#2286] / [Intel XE#6035]) -> [SKIP][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [SKIP][48] ([Intel XE#4354] / [Intel XE#5870]) -> [SKIP][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-2/igt@kms_dp_link_training@uhbr-sst.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          [SKIP][50] ([Intel XE#4331] / [Intel XE#7227]) -> [SKIP][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][52] ([Intel XE#8265]) -> [SKIP][53] +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_dsc@dsc-fractional-bpp.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][54] ([Intel XE#4156] / [Intel XE#7425]) -> [SKIP][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_fbcon_fbt@fbc.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][56] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][57] +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
    - shard-bmg:          [SKIP][58] ([Intel XE#7179]) -> [SKIP][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][60] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][61] +5 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][62] ([Intel XE#7061]) -> [SKIP][63] +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][64] ([Intel XE#4141]) -> [SKIP][65] +15 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][66] ([Intel XE#2352] / [Intel XE#7399]) -> [SKIP][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][68] ([Intel XE#2311]) -> [SKIP][69] +55 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-bmg:          [SKIP][70] ([Intel XE#7399]) -> [SKIP][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][72] ([Intel XE#2313]) -> [SKIP][73] +65 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
    - shard-bmg:          [FAIL][74] ([Intel XE#9313]) -> [SKIP][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-bmg:          [SKIP][76] -> [FAIL][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][78] ([Intel XE#6901]) -> [SKIP][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@kms_joiner@basic-big-joiner.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][80] ([Intel XE#6911] / [Intel XE#7378]) -> [SKIP][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@kms_joiner@basic-ultra-joiner.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][82] ([Intel XE#2486]) -> [SKIP][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-4/igt@kms_panel_fitting@legacy.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          [SKIP][84] ([Intel XE#6912] / [Intel XE#7375]) -> [SKIP][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-bmg:          [SKIP][86] ([Intel XE#7283]) -> [SKIP][87] +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_plane@pixel-format-yf-tiled-modifier.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][88] ([Intel XE#5020] / [Intel XE#7348]) -> [SKIP][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][90] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760]) -> [SKIP][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_pm_backlight@brightness-with-dpms.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-after-dc6:
    - shard-bmg:          [SKIP][92] ([Intel XE#8395] / [Intel XE#8396]) -> [SKIP][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-4/igt@kms_pm_dc@dc3co-after-dc6.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_pm_dc@dc3co-after-dc6.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][94] ([Intel XE#7794]) -> [SKIP][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_pm_dc@dc5-psr.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-bmg:          [SKIP][96] ([Intel XE#1489]) -> [SKIP][97] +7 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][98] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][99] +14 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_psr@psr-primary-page-flip.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          [SKIP][100] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][101] +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - shard-bmg:          [SKIP][102] ([Intel XE#6503]) -> [SKIP][103] +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_sharpness_filter@invalid-plane-with-filter.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_sharpness_filter@invalid-plane-with-filter.html

  * igt@kms_vrr@cmrr-video-mode:
    - shard-bmg:          [SKIP][104] ([Intel XE#9271]) -> [SKIP][105] +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@kms_vrr@cmrr-video-mode.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_vrr@cmrr-video-mode.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][106] ([Intel XE#1499] / [Intel XE#9271]) -> [SKIP][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-drrs.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          [SKIP][108] ([Intel XE#6599]) -> [SKIP][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@xe_compute@ccs-mode-basic.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          [SKIP][110] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][111] +7 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-multi-queue-imm:
    - shard-bmg:          [SKIP][112] ([Intel XE#8374]) -> [SKIP][113] +10 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-imm.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-imm.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:
    - shard-bmg:          [SKIP][114] ([Intel XE#8364]) -> [SKIP][115] +29 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-bmg:          [DMESG-WARN][116] ([Intel XE#9130]) -> [SKIP][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@xe_exec_reset@gt-reset-fault-injection.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_exec_reset@gt-reset-fault-injection.html

  * igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
    - shard-bmg:          [SKIP][118] ([Intel XE#8369]) -> [SKIP][119] +3 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-fork-read-after:
    - shard-bmg:          [SKIP][120] -> [DMESG-WARN][121] +54 other tests dmesg-warn
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_exec_system_allocator@many-large-execqueues-malloc-fork-read-after.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-4/igt@xe_exec_system_allocator@many-large-execqueues-malloc-fork-read-after.html

  * igt@xe_exec_system_allocator@process-many-large-malloc-race:
    - shard-bmg:          [DMESG-WARN][122] -> [SKIP][123] +48 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-malloc-race.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-malloc-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
    - shard-bmg:          [SKIP][124] ([Intel XE#8378]) -> [SKIP][125] +11 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html

  * igt@xe_mempage_offline@inject-single-page:
    - shard-bmg:          [SKIP][126] ([Intel XE#9203]) -> [SKIP][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@xe_mempage_offline@inject-single-page.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_mempage_offline@inject-single-page.html

  * igt@xe_page_reclaim@prl-max-entries:
    - shard-bmg:          [SKIP][128] ([Intel XE#7793]) -> [SKIP][129] +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@xe_page_reclaim@prl-max-entries.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_page_reclaim@prl-max-entries.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][130] ([Intel XE#2236] / [Intel XE#7590]) -> [SKIP][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pat@pat-sw-hw-reset-compare:
    - shard-bmg:          [FAIL][132] ([Intel XE#7695]) -> [SKIP][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@xe_pat@pat-sw-hw-reset-compare.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_pat@pat-sw-hw-reset-compare.html

  * igt@xe_pat@xa-app-transient-media-on:
    - shard-bmg:          [SKIP][134] ([Intel XE#7590]) -> [SKIP][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@xe_pat@xa-app-transient-media-on.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_pat@xa-app-transient-media-on.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          [SKIP][136] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@xe_pm@d3cold-basic-exec.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-bmg:          [INCOMPLETE][138] ([Intel XE#8175]) -> [SKIP][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@xe_pm@s3-vm-bind-prefetch.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          [SKIP][140] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][141] +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-bmg:          [SKIP][142] ([Intel XE#944]) -> [SKIP][143] +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@xe_query@multigpu-query-gt-list.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_query@multigpu-query-gt-list.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15867_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_debugfs@read-all-entries:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#8589]) +8 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@core_debugfs@read-all-entries.html

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#8749])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@core_hotunplug@hotrebind.html

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [PASS][146] -> [SKIP][147] ([Intel XE#8749]) +2 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@core_hotunplug@hotrebind-lateclose.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          NOTRUN -> [FAIL][148] ([Intel XE#8583])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-4/igt@intel_hwmon@hwmon-write.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][149] ([Intel XE#7774])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-3.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#2327])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#1124]) +3 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#367])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#2652]) +15 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#3432])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#2887]) +2 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#2252])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#6969]) +15 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#6974])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-4/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#2320]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-256x256:
    - shard-bmg:          [PASS][161] -> [FAIL][162] ([Intel XE#8117])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-256x256.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x256.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#1340] / [Intel XE#7435])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#8265])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#8680])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][166] -> [FAIL][167] ([Intel XE#3098]) +1 other test fail
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [PASS][168] -> [FAIL][169] ([Intel XE#301])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][170] -> [FAIL][171] ([Intel XE#301] / [Intel XE#3149])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#7179])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#7061] / [Intel XE#7356])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#4141]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#2311]) +14 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][176] ([Intel XE#7061]) +3 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#2313]) +17 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][178] -> [INCOMPLETE][179] ([Intel XE#9320]) +1 other test incomplete
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_hdr@static-toggle-suspend.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#7283])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][181] ([Intel XE#2763] / [Intel XE#6886]) +7 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-10/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#8395] / [Intel XE#8396])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-10/igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#8396]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-10/igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [PASS][185] -> [SKIP][186] ([Intel XE#8710]) +2 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_pm_rpm@drm-resources-equal.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#8710])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][188] ([Intel XE#1489]) +2 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-9/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.html

  * igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:
    - shard-bmg:          NOTRUN -> [ABORT][190] ([Intel XE#8868])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-10/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html

  * igt@xe_evict@evict-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][191] ([Intel XE#8370])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@xe_evict@evict-small-multi-queue.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-bmg:          [PASS][192] -> [DMESG-FAIL][193] ([Intel XE#6652])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][194] ([Intel XE#8374]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-4/igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][195] ([Intel XE#8364]) +10 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html

  * igt@xe_exec_reset@gt-stress-reset-pm-transition:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][196] ([Intel XE#8649] / [Intel XE#8652])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-9/igt@xe_exec_reset@gt-stress-reset-pm-transition.html

  * igt@xe_exec_reset@multi-queue-cancel-on-secondary:
    - shard-bmg:          NOTRUN -> [SKIP][197] ([Intel XE#8369])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-10/igt@xe_exec_reset@multi-queue-cancel-on-secondary.html

  * igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch-madvise:
    - shard-bmg:          [PASS][198] -> [DMESG-WARN][199] ([Intel XE#9309]) +1 other test dmesg-warn
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch-madvise.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch-madvise.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-prefetch:
    - shard-bmg:          [PASS][200] -> [SKIP][201] ([Intel XE#8589]) +57 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-prefetch.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-prefetch.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][202] ([Intel XE#8378]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          NOTRUN -> [SKIP][203] ([Intel XE#6281] / [Intel XE#7426])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [PASS][204] -> [SKIP][205] ([Intel XE#2229]) +2 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230]) -> ([PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [SKIP][254], [PASS][255], [PASS][256]) ([Intel XE#2457] / [Intel XE#7405])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-2/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-4/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-6/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-1/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-1/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-4/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-4/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-9/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-9/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-10/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-10/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][257] ([Intel XE#6964])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-10/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [SKIP][258] ([Intel XE#2284] / [Intel XE#7370])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-1/igt@xe_pm@d3cold-basic.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][259] ([Intel XE#4733] / [Intel XE#7417])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [PASS][260] -> [FAIL][261] ([Intel XE#6569])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_scheduling@equal-throughput-normal-priority@numvfs-random-gt0-rcs0:
    - shard-bmg:          [PASS][262] -> [FAIL][263] ([Intel XE#7992]) +2 other tests fail
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@xe_sriov_scheduling@equal-throughput-normal-priority@numvfs-random-gt0-rcs0.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput-normal-priority@numvfs-random-gt0-rcs0.html

  * igt@xe_sriov_scheduling@equal-throughput-normal-priority@numvfs-random-gt1-vcs0:
    - shard-bmg:          [PASS][264] -> [FAIL][265] ([Intel XE#8526])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@xe_sriov_scheduling@equal-throughput-normal-priority@numvfs-random-gt1-vcs0.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput-normal-priority@numvfs-random-gt1-vcs0.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority@numvfs-random-gt0-rcs0:
    - shard-bmg:          NOTRUN -> [FAIL][266] ([Intel XE#7992]) +1 other test fail
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority@numvfs-random-gt0-rcs0.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [SKIP][267] ([Intel XE#8749]) -> [PASS][268] +1 other test pass
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@core_hotunplug@hotreplug.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@core_hotunplug@hotreplug.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [FAIL][269] -> [PASS][270]
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@core_setmaster@master-drop-set-root.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@info:
    - shard-bmg:          [SKIP][271] ([Intel XE#2134]) -> [PASS][272] +2 other tests pass
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@fbdev@info.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@fbdev@info.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-lnl:          [FAIL][273] ([Intel XE#1231]) -> [PASS][274]
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_flip@blocking-wf_vblank@d-hdmi-a3:
    - shard-bmg:          [FAIL][275] ([Intel XE#3149] / [Intel XE#5408] / [Intel XE#6266]) -> [PASS][276] +1 other test pass
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@kms_flip@blocking-wf_vblank@d-hdmi-a3.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_flip@blocking-wf_vblank@d-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][277] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][278]
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
    - shard-bmg:          [FAIL][279] ([Intel XE#9313]) -> [PASS][280]
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-bmg:          [INCOMPLETE][281] ([Intel XE#2597]) -> [PASS][282] +1 other test pass
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][283] ([Intel XE#8399]) -> [PASS][284] +1 other test pass
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock:
    - shard-bmg:          [DMESG-WARN][285] -> [PASS][286] +140 other tests pass
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-lnl:          [FAIL][287] ([Intel XE#9096]) -> [PASS][288]
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-lnl-6/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_oa@non-zero-reason-all:
    - {shard-ptl}:        [FAIL][289] ([Intel XE#7334]) -> [PASS][290] +1 other test pass
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-ptl-5/igt@xe_oa@non-zero-reason-all.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-ptl-6/igt@xe_oa@non-zero-reason-all.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [SKIP][291] -> [PASS][292] +611 other tests pass
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-bmg:          [SKIP][293] -> [DMESG-WARN][294] ([Intel XE#7774])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          [SKIP][295] ([Intel XE#2327]) -> [SKIP][296] ([Intel XE#8589]) +2 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][297] -> [SKIP][298] ([Intel XE#2327]) +2 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-9/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][299] -> [SKIP][300] ([Intel XE#1124]) +10 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-9/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][301] ([Intel XE#1124]) -> [SKIP][302] ([Intel XE#8589])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][303] -> [SKIP][304] ([Intel XE#607] / [Intel XE#7361])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][305] -> [SKIP][306] ([Intel XE#610] / [Intel XE#7387])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][307] -> [SKIP][308] ([Intel XE#367]) +3 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][309] ([Intel XE#2887]) -> [SKIP][310] ([Intel XE#8589])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][311] ([Intel XE#3432]) -> [SKIP][312] ([Intel XE#8589])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][313] -> [SKIP][314] ([Intel XE#3432]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][315] -> [SKIP][316] ([Intel XE#2887]) +13 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][317] -> [SKIP][318] ([Intel XE#2652]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-bmg:          [SKIP][319] -> [SKIP][320] ([Intel XE#2325] / [Intel XE#7358])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_chamelium_color@ctm-0-75.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-4/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-bmg:          [SKIP][321] -> [SKIP][322] ([Intel XE#7358])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][323] -> [SKIP][324] ([Intel XE#2252]) +5 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          [SKIP][325] ([Intel XE#2252]) -> [SKIP][326] ([Intel XE#8589])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][327] -> [SKIP][328] ([Intel XE#6507])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_chamelium_sharpness_filter@filter-basic.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-bmg:          [SKIP][329] -> [SKIP][330] ([Intel XE#6974])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          [SKIP][331] -> [SKIP][332] ([Intel XE#2320]) +4 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][333] -> [SKIP][334] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-10/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][335] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][336] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-bmg:          [SKIP][337] -> [SKIP][338] ([Intel XE#9009])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-bmg:          [SKIP][339] -> [SKIP][340] ([Intel XE#8265]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][341] ([Intel XE#2374] / [Intel XE#6128]) -> [SKIP][342] ([Intel XE#8589])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-2/igt@kms_feature_discovery@psr2.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_feature_discovery@psr2.html

  * igt@kms_feature_discovery@vrr:
    - shard-bmg:          [SKIP][343] -> [SKIP][344] ([Intel XE#8586])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_feature_discovery@vrr.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-9/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][345] ([Intel XE#301]) -> [FAIL][346] ([Intel XE#301] / [Intel XE#3149])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][347] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][348] ([Intel XE#301])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][349] -> [SKIP][350] ([Intel XE#7178] / [Intel XE#7349]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][351] -> [SKIP][352] ([Intel XE#7178] / [Intel XE#7351]) +4 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][353] ([Intel XE#2311]) -> [SKIP][354] ([Intel XE#8589]) +4 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][355] -> [SKIP][356] ([Intel XE#4141]) +14 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][357] -> [SKIP][358] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][359] -> [SKIP][360] ([Intel XE#2311]) +65 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][361] -> [SKIP][362] ([Intel XE#7061]) +2 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][363] ([Intel XE#2313]) -> [SKIP][364] ([Intel XE#8589]) +2 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][365] -> [SKIP][366] ([Intel XE#2352] / [Intel XE#7399])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][367] -> [SKIP][368] ([Intel XE#2313]) +70 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][369] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][370] ([Intel XE#3544])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][371] -> [SKIP][372] ([Intel XE#7591])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-bmg:          [SKIP][373] -> [SKIP][374] ([Intel XE#7283]) +3 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][375] -> [SKIP][376] ([Intel XE#8589]) +24 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][377] -> [SKIP][378] ([Intel XE#2393])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][379] -> [SKIP][380] ([Intel XE#5021] / [Intel XE#7377]) +1 other test skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][381] -> [SKIP][382] ([Intel XE#2763] / [Intel XE#6886]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          [SKIP][383] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) -> [SKIP][384] ([Intel XE#8589])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_pm_backlight@fade-with-suspend.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-framedrop-check:
    - shard-bmg:          [SKIP][385] -> [SKIP][386] ([Intel XE#8395] / [Intel XE#8396])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_pm_dc@dc3co-framedrop-check.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-10/igt@kms_pm_dc@dc3co-framedrop-check.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][387] -> [SKIP][388] ([Intel XE#2505] / [Intel XE#7447])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][389] -> [SKIP][390] ([Intel XE#2499])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][391] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [SKIP][392] ([Intel XE#8710])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_pm_rpm@dpms-lpsp.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][393] ([Intel XE#8710]) -> [SKIP][394] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][395] ([Intel XE#8710]) -> [SKIP][396] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-9/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][397] -> [SKIP][398] ([Intel XE#1489]) +7 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][399] -> [SKIP][400] ([Intel XE#2234] / [Intel XE#2850]) +12 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@psr-sprite-render:
    - shard-bmg:          [SKIP][401] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][402] ([Intel XE#8589])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-2/igt@kms_psr@psr-sprite-render.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_psr@psr-sprite-render.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          [SKIP][403] -> [SKIP][404] ([Intel XE#3904] / [Intel XE#7342]) +2 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-270.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-9/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][405] -> [SKIP][406] ([Intel XE#2330] / [Intel XE#5813])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][407] -> [SKIP][408] ([Intel XE#1435] / [Intel XE#8695])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - shard-bmg:          [SKIP][409] -> [SKIP][410] ([Intel XE#6503]) +2 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_sharpness_filter@filter-scaler-downscale.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-1/igt@kms_sharpness_filter@filter-scaler-downscale.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][411] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][412] ([Intel XE#2426] / [Intel XE#5848])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][413] -> [SKIP][414] ([Intel XE#2509] / [Intel XE#7437])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][415] -> [SKIP][416] ([Intel XE#2168] / [Intel XE#7444])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_vrr@lobf.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@kms_vrr@lobf.html

  * igt@kms_vrr@lobf-dc3co:
    - shard-bmg:          [SKIP][417] -> [SKIP][418] ([Intel XE#8397])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_vrr@lobf-dc3co.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-6/igt@kms_vrr@lobf-dc3co.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][419] ([Intel XE#1499] / [Intel XE#9271]) -> [SKIP][420] ([Intel XE#8589])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@kms_vrr@max-min.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          [SKIP][421] -> [SKIP][422] ([Intel XE#1499] / [Intel XE#9271])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-vrr.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          [SKIP][423] -> [SKIP][424] ([Intel XE#6599])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_compute@ccs-mode-compute-kernel.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_cw_post_sync@walker-post-sync:
    - shard-bmg:          [SKIP][425] -> [SKIP][426] ([Intel XE#8608])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_cw_post_sync@walker-post-sync.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-4/igt@xe_cw_post_sync@walker-post-sync.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][427] ([Intel XE#6321] / [Intel XE#8355]) -> [SKIP][428] ([Intel XE#8589])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-queue-priority:
    - shard-bmg:          [SKIP][429] -> [SKIP][430] ([Intel XE#8370]) +1 other test skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-priority.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][431] -> [SKIP][432] ([Intel XE#2322] / [Intel XE#7372]) +9 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
    - shard-bmg:          [SKIP][433] -> [SKIP][434] ([Intel XE#8374]) +17 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html

  * igt@xe_exec_fault_mode@once-multi-queue-imm:
    - shard-bmg:          [SKIP][435] ([Intel XE#8374]) -> [SKIP][436] ([Intel XE#8589]) +1 other test skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@xe_exec_fault_mode@once-multi-queue-imm.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-queue-imm.html

  * igt@xe_exec_multi_queue@two-queues-dyn-priority:
    - shard-bmg:          [SKIP][437] ([Intel XE#8364]) -> [SKIP][438] ([Intel XE#8589]) +1 other test skip
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-dyn-priority.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-dyn-priority.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
    - shard-bmg:          [SKIP][439] -> [SKIP][440] ([Intel XE#8364]) +28 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          [SKIP][441] -> [SKIP][442] ([Intel XE#8369])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-6/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap:
    - shard-bmg:          [DMESG-WARN][443] -> [SKIP][444] ([Intel XE#8589]) +6 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:
    - shard-bmg:          [SKIP][445] -> [SKIP][446] ([Intel XE#8378]) +8 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html

  * igt@xe_page_reclaim@binds-1g-partial:
    - shard-bmg:          [SKIP][447] -> [SKIP][448] ([Intel XE#7793]) +1 other test skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_page_reclaim@binds-1g-partial.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-10/igt@xe_page_reclaim@binds-1g-partial.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][449] -> [SKIP][450] ([Intel XE#2245] / [Intel XE#7590])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_pat@pat-index-xelp.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          [SKIP][451] -> [SKIP][452] ([Intel XE#7590])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_pat@xa-app-transient-media-off.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-10/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][453] ([Intel XE#5694] / [Intel XE#7370]) -> [SKIP][454] ([Intel XE#8589])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@xe_pm@d3cold-i2c.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-bmg:          [SKIP][455] -> [SKIP][456] ([Intel XE#2284] / [Intel XE#7370]) +1 other test skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_pm@s4-d3cold-basic-exec.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-4/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_prefetch_fault@l2-prefetch-fault-svm:
    - shard-bmg:          [SKIP][457] -> [SKIP][458] ([Intel XE#8815]) +1 other test skip
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-1/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
    - shard-bmg:          [SKIP][459] -> [SKIP][460] ([Intel XE#4733] / [Intel XE#7417])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          [SKIP][461] -> [SKIP][462] ([Intel XE#944]) +4 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-6/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_sriov_vfio@open-basic:
    - shard-bmg:          [SKIP][463] -> [FAIL][464] ([Intel XE#7992])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_sriov_vfio@open-basic.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@xe_sriov_vfio@open-basic.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [SKIP][465] -> [DMESG-WARN][466] ([Intel XE#8963])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
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
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
  [Intel XE#5946]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5946
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
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
  [Intel XE#7334]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8117]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8117
  [Intel XE#8175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
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
  [Intel XE#8526]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8526
  [Intel XE#8583]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
  [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
  [Intel XE#8649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8649
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8710]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710
  [Intel XE#8749]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749
  [Intel XE#8815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
  [Intel XE#9203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9309
  [Intel XE#9312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312
  [Intel XE#9313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313
  [Intel XE#9320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9320
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_9103 -> IGTPW_15867
  * Linux: xe-5781-2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c -> xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7

  IGTPW_15867: 15867
  IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5781-2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c: 2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c
  xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7: fd2ca2a0c165980cac3a07afa88032da881db2d7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/index.html

--===============4851438049961404757==
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
<tr><td><b>Series:</b></td><td>tests/panthor: skip sparse VM_BIND tests bef=
ore v1.9</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/174552/">https://patchwork.freedesktop.org/series/174552/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15867/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15867/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9103_FULL -&gt; XEIGTPW_15867_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15867_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_15867_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15=
867_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5867/shard-bmg-9/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html">DMESG-=
WARN</a> +135 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_exec_system_allocator@many-la=
rge-execqueues-new-race-nomemset.html">SKIP</a> +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-multi-f=
ault:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@xe_exec_system_allocator@threads=
-shared-vm-many-large-malloc-multi-fault.html">DMESG-WARN</a> +8 other test=
s dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-=
xe_ggtt_init_early.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_fault_injection@inject-fau=
lt-probe-function-xe_ggtt_init_early.html">SKIP</a> +654 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-2/igt@xe_module_load@many-reload.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-=
7/igt@xe_module_load@many-reload.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority@numvfs-ran=
dom-gt1-vcs0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@xe_sriov_scheduling@nonpreempt-e=
ngine-resets-low-priority@numvfs-random-gt1-vcs0.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
18">Intel XE#3718</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6078">Intel XE#6078</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_async_flips@alternate-=
sync-async-flip.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_atomic_transition@plane-all-modeset-transit=
ion-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_atomic_tra=
nsition@plane-all-modeset-transition-internal-panels.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel=
 XE#2327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15867/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> +=
2 other tests skip</li>
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
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_big_fb@li=
near-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Int=
el XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15867/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</=
a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">=
Intel XE#610</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7387">Intel XE#7387</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-o=
verflow.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-target-2560x1440=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/367">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-ta=
rget-2560x1440p.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc=
-ccs-cc.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3432">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled=
-dg2-rc-ccs.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#272=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449=
">Intel XE#7449</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15867/shard-bmg-7/igt@kms_cdclk@mode-transition.html">SKIP</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2=
325</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
58">Intel XE#7358</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15867/shard-bmg-7/igt@kms_chamelium_color@ctm-max.html">SKIP</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-lut3d-green-o=
nly.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7358">Intel XE#7358</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_chamelium_color_pipeline@p=
lane-lut3d-green-only.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1586=
7/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_content_protection@content-type-change.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
642">Intel XE#7642</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15867/shard-bmg-7/igt@kms_content_protection@content-type-cha=
nge.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-0.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/239=
0">Intel XE#2390</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6974">Intel XE#6974</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_content_protection@dp-m=
st-lic-type-0.html">SKIP</a></li>
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
i.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_content_protection@l=
egacy.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320"=
>Intel XE#2320</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15867/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html=
">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_cursor_crc@cursor-r=
apid-movement-512x170.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-=
toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2286">Intel XE#2286</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6035">Intel XE#6035</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_cursor_le=
gacy@short-busy-flip-before-cursor-toggle.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-2/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE=
#4354</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5870">Intel XE#5870</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst.html">SK=
IP</a></li>
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
org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc=
-fallback.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8=
265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5867/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel =
XE#7425</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15867/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html">SKIP</a></li>
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
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@k=
ms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP<=
/a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflec=
t-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32b=
pp-yuv-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_flip_s=
caled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-m=
map-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_frontbuff=
er_tracking@drrs-abgr161616f-draw-mmap-wc.html">SKIP</a> +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-dra=
w-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_frontbuffer_tracking=
@drrshdr-argb161616f-draw-mmap-wc.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_frontbuffer_tracki=
ng@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> +15 other tests skip</=
li>
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
.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_frontbuffer_tracking@=
fbcdrrs-tiling-y.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-=
wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-=
pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_frontbu=
ffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> =
+55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7399">Intel XE#7399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-=
tiling-y.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> +65 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank160:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313">I=
ntel XE#9313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15867/shard-bmg-7/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">SK=
IP</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.ht=
ml">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15867/shard-bmg-2/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html=
">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6=
901</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5867/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html">SKIP</a></li>
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
intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html">SK=
IP</a></li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-4/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1586=
7/shard-bmg-7/igt@kms_panel_fitting@legacy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912=
">Intel XE#6912</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7375">Intel XE#7375</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8=
888-yftiled.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_plane@pixel-format-yf-tiled-modifier.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/728=
3">Intel XE#7283</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15867/shard-bmg-7/igt@kms_plane@pixel-format-yf-tiled-modifier.=
html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#=
5020</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
348">Intel XE#7348</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15867/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html">SKIP=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_pm_backlight@brightness-with-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938"=
>Intel XE#2938</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7760">Intel XE#7760</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_pm_backligh=
t@brightness-with-dpms.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-4/igt@kms_pm_dc@dc3co-after-dc6.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#839=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396=
">Intel XE#8396</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15867/shard-bmg-7/igt@kms_pm_dc@dc3co-after-dc6.html">SKIP</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shar=
d-bmg-7/igt@kms_pm_dc@dc5-psr.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous=
-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane=
-update-continuous-sf.html">SKIP</a> +7 other tests skip</li>
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
/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.html">S=
KIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_rotation_crc@sprit=
e-rotation-90-pos-100-0.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_sharpness_filter@invalid-plane-with-filter.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6503">Intel XE#6503</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_sharpness_filter@invalid-plane-=
with-filter.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-video-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@kms_vrr@cmrr-video-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1586=
7/shard-bmg-7/igt@kms_vrr@cmrr-video-mode.html">SKIP</a> +1 other test skip=
</li>
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
e/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html=
">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#659=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_158=
67/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@xe_exec_basic@multigpu-once-basic-defer-bind.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_exec_basic@multigpu-=
once-basic-defer-bind.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-imm.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374=
">Intel XE#8374</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15867/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-imm.ht=
ml">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-6/igt@xe_exec_multi_queue@max-queues-preempt-mode-clos=
e-fd-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_exec_multi_queue@max-=
queues-preempt-mode-close-fd-smem.html">SKIP</a> +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-6/igt@xe_exec_reset@gt-reset-fault-injection.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/9130">Intel XE#9130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_exec_reset@gt-reset-fault-injectio=
n.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-5/igt@xe_exec_reset@multi-queue-cat-error-on-secondary=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8369">Intel XE#8369</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_exec_reset@multi-queue-cat-err=
or-on-secondary.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-fork-read-afte=
r:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_exec_system_allocator@many-large-execqueues-m=
alloc-fork-read-after.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_15867/shard-bmg-4/igt@xe_exec_system_allocator@m=
any-large-execqueues-malloc-fork-read-after.html">DMESG-WARN</a> +54 other =
tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-mall=
oc-race.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_exec_system_allocator@process-m=
any-large-malloc-race.html">SKIP</a> +48 other tests skip</li>
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
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_exec_threads=
@threads-multi-queue-mixed-userptr-invalidate-race.html">SKIP</a> +11 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mempage_offline@inject-single-page:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-5/igt@xe_mempage_offline@inject-single-page.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203">=
Intel XE#9203</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15867/shard-bmg-7/igt@xe_mempage_offline@inject-single-page.html">=
SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-max-entries:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel =
XE#7793</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15867/shard-bmg-7/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590"=
>Intel XE#7590</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15867/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-reset-compare:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@xe_pat@pat-sw-hw-reset-compare.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel =
XE#7695</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15867/shard-bmg-7/igt@xe_pat@pat-sw-hw-reset-compare.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-on:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel=
 XE#7590</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15867/shard-bmg-7/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a></=
li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370"=
>Intel XE#7370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15867/shard-bmg-7/igt@xe_pm@d3cold-basic-exec.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-6/igt@xe_pm@s3-vm-bind-prefetch.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175">Intel =
XE#8175</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15867/shard-bmg-7/igt@xe_pm@s3-vm-bind-prefetch.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_pxp@pxp-terminatio=
n-key-update-post-suspend.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel X=
E#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15867/shard-bmg-7/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> +1 ot=
her test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15867_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_debugfs@read-all-entries:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@core_debugfs@read-all-entries.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8589">Intel XE#8589</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@core_hotunplug@hotrebind.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/874=
9">Intel XE#8749</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-6/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/sh=
ard-bmg-7/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749">Intel XE#8749</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-4/igt@intel_hwmon@hwmon-write.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583=
">Intel XE#8583</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-=
3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_atomic_transition@plane-togg=
le-modeset-transition@pipe-b-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@kms_big_fb@x-tiled-64bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-=
target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-=
lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@kms_ccs@missing-ccs-buffer-y-til=
ed-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@kms_chamelium_color@ctm-0-50.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-cha=
nge-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_color_pipeline@plane-lut1d-l=
ut1d@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-4/igt@kms_content_protection@dp-mst-ty=
pe-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@kms_cursor_crc@cursor-random-32x=
32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-256x256.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867=
/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x256.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8117">Intel XE#8=
117</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1340">Intel XE#1340</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7435">Intel XE#7435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-with-=
bpc-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@kms_fbcon_fbt@psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">Inte=
l XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/s=
hard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098=
</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-=
edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15867/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1586=
7/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#=
301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
49">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@kms_flip_scaled_crc@flip-nv12-li=
near-to-nv12-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-ar=
gb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs=
hdr-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_frontbuffer_tracking@hdr-arg=
b161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-=
1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +17 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_hdr@static-toggle-suspend.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-b=
mg-6/igt@kms_hdr@static-toggle-suspend.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/9320">Intel XE#9320</a>) +=
1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_plane@pixel-format-yf-tiled-=
modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-9/igt@kms_plane_scaling@planes-upscale=
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
/tree/intel-xe/IGTPW_15867/shard-bmg-10/igt@kms_pm_backlight@fade.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376"=
>Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-10/igt@kms_pm_dc@dc3co-framedrop-check=
@pr-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-10/igt@kms_pm_dc@dc3co-framedrop-check=
@psr2-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-=
bmg-7/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8710">Intel XE#8710</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_pm_rpm@system-suspend-idle.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8710">Intel XE#8710</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-9/igt@kms_psr2_sf@psr2-cursor-plane-mo=
ve-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-10/igt@sriov_basic@pf-unbind-with-vfs-=
enabled-numvfs-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8868">Intel XE#8868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@xe_evict@evict-small-multi-queue=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-5/igt@xe_evict_ccs@evict-overcommit-standalone-instant=
free-reopen.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_15867/shard-bmg-5/igt@xe_evict_ccs@evict-overcommit-standa=
lone-instantfree-reopen.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-4/igt@xe_exec_fault_mode@twice-multi-q=
ueue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@xe_exec_multi_queue@many-queues-=
preempt-mode-close-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-pm-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-9/igt@xe_exec_reset@gt-stress-reset-pm=
-transition.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8649">Intel XE#8649</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cancel-on-secondary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-10/igt@xe_exec_reset@multi-queue-cance=
l-on-secondary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch-madvise=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@xe_exec_system_allocator@process-many-stride-mal=
loc-prefetch-madvise.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@xe_exec_system_allocator@pr=
ocess-many-stride-malloc-prefetch-madvise.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/9309">Intel XE#9309</a>=
) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-prefetch:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many=
-stride-new-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@xe_exec_system_allocator@th=
reads-shared-vm-many-stride-new-prefetch.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +57 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-9/igt@xe_exec_threads@threads-multi-qu=
eue-mixed-shared-vm-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@xe_fault_injection@exec-queue-cr=
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
TPW_15867/shard-bmg-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2229">Intel XE#2229</a>) +2 other tests skip</li>
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
ree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bm=
g-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15867/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15867/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15867/shard-bmg-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard=
-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15=
867/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-9/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15867/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15867/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/sh=
ard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15867/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15867/shard-bmg-5/igt@xe_module_load@load.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-10/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15867/shard-bmg-10/igt@xe_module_load@load.html">PASS</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">I=
ntel XE#2457</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7405">Intel XE#7405</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-10/igt@xe_multigpu_svm@mgpu-latency-co=
py-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-1/igt@xe_pm@d3cold-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Int=
el XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@xe_pxp@display-black-pxp-fb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard=
-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-normal-priority@numvfs-random-g=
t0-rcs0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@xe_sriov_scheduling@equal-throughput-normal-prio=
rity@numvfs-random-gt0-rcs0.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@xe_sriov_scheduling@=
equal-throughput-normal-priority@numvfs-random-gt0-rcs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#=
7992</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-normal-priority@numvfs-random-g=
t1-vcs0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@xe_sriov_scheduling@equal-throughput-normal-prio=
rity@numvfs-random-gt1-vcs0.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@xe_sriov_scheduling@=
equal-throughput-normal-priority@numvfs-random-gt1-vcs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8526">Intel XE#=
8526</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority@numvfs-ran=
dom-gt0-rcs0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@xe_sriov_scheduling@nonpreempt-e=
ngine-resets-low-priority@numvfs-random-gt0-rcs0.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a=
>) +1 other test fail</li>
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
7/shard-bmg-8/igt@core_hotunplug@hotreplug.html">PASS</a> +1 other test pas=
s</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@core_setmaster@master-drop-set-root.html">FAIL</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/s=
hard-bmg-3/igt@core_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@fbdev@info.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/=
igt@fbdev@info.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-18=
0-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15867/shard-lnl-2/igt@kms_big_fb@4-tiled-ma=
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
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_flip@blockin=
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
l-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-lnl-2/igt@kms_flip@flip-vs-=
expired-vblank-interruptible@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank80:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313">In=
tel XE#9313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15867/shard-bmg-3/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-6/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
97">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15867/shard-bmg-3/igt@kms_pipe_crc_basic@suspend-read-crc.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard=
-lnl-2/igt@kms_pm_dc@dc6-psr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@xe_exec_system_allocator@many-large-execqueues-m=
alloc-mlock.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@xe_exec_system_allocator@many-=
large-execqueues-malloc-mlock.html">PASS</a> +140 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-lnl-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-=
race.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9096">Intel XE#9096</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15867/shard-lnl-6/igt@xe_exec_threads@threads-hang-=
userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason-all:</p>
<ul>
<li>{shard-ptl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-ptl-5/igt@xe_oa@non-zero-reason-all.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334">Intel XE#733=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_158=
67/shard-ptl-6/igt@xe_oa@non-zero-reason-all.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-time=
out.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15867/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-=
timeout.html">PASS</a> +611 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_atomic_transition@plane-toggle-modeset-trans=
ition.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15867/shard-bmg-5/igt@kms_atomic_transition@plane-toggle-modeset=
-transition.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7774">Intel XE#7774</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Int=
el XE#2327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15867/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">In=
tel XE#8589</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/s=
hard-bmg-9/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/=
shard-bmg-9/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#112=
4</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Int=
el XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15867/shard-bmg-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">In=
tel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.h=
tml">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15867/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.ht=
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
67/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (=
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
/IGTPW_15867/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-target-2560x14=
40p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-=
mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3432">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled=
-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-c=
c.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15867/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs=
-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-c=
cs-cc.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15867/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg=
2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2887">Intel XE#2887</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.=
html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15867/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2652">Intel XE#2652</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bm=
g-4/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ct=
m3x4.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15867/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-lut1d-po=
st-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html"=
>SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15867/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">=
Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_chamelium_hpd@common-hpd-after-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2252">Intel XE#2252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-sus=
pend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_chamelium_sharpness_filter@filter-basic.html=
">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15867/shard-bmg-3/igt@kms_chamelium_sharpness_filter@filter-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507=
">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1-suspend-res=
ume.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15867/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1-suspend=
-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867=
/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2=
320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867=
/shard-bmg-10/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#=
2321</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-lnl-8/igt@kms_cursor_legac=
y@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935"=
>Intel XE#7935</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.h=
tml">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15867/shard-bmg-2/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/9009">Intel XE#9009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">=
SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5867/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">In=
tel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-2/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#23=
74</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/612=
8">Intel XE#6128</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15867/shard-bmg-5/igt@kms_feature_discovery@psr2.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Inte=
l XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_feature_discovery@vrr.html">SKIP</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-9=
/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8586">Intel XE#8586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel X=
E#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15867/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149=
">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15867/shard-lnl-2/igt@kms_flip@flip-vs-expired=
-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4t=
iledg2rcccs-downscaling.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2/igt@kms_flip_scaled_crc@flip=
-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Int=
el XE#7349</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-y=
ftile-downscaling.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15867/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-p=
gflip-blt.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15867/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primsc=
rn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-dra=
w-mmap-wc.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15867/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-argb1=
61616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-=
wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-=
cur-indfb-draw-mmap-wc.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_frontbuffer_tracking@=
fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) =
+65 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-=
draw-mmap-wc.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15867/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrshdr=
-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">S=
KIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15=
867/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Inte=
l XE#2352</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primsc=
rn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +70 other tests skip</li>
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
tel-xe/IGTPW_15867/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">In=
tel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.h=
tml">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15867/shard-bmg-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifi=
er.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15867/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-mod=
ifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7283">Intel XE#7283</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-sou=
rce-clamping.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_plane@pixel-format-yf-tiled-ccs=
-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +24 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html">SKIP</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-2=
/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard=
-bmg-9/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https=
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
rg/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@kms_plane_scaling@planes-upsca=
le-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Int=
el XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@kms_pm_backlight@fade=
-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_pm_dc@dc3co-framedrop-check.html">SKIP</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard=
-bmg-10/igt@kms_pm_dc@dc3co-framedrop-check.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel X=
E#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@k=
ms_pm_dc@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2505">Intel XE#2505</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7447">Intel XE#7447</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-3/igt@=
kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">In=
tel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7383">Intel XE#7383</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8710">Intel XE#8710</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710">Intel =
XE#8710</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15867/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a=
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
W_15867/shard-bmg-9/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1=
439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
41">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7383">Intel XE#7383</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-s=
f.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15867/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous=
-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/sh=
ard-bmg-8/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">In=
tel XE#2850</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-2/igt@kms_psr@psr-sprite-render.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#223=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850=
">Intel XE#2850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15867/shard-bmg-5/igt@kms_psr@psr-sprite-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel =
XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-270.html">SKIP=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867=
/shard-bmg-9/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3=
904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
42">Intel XE#7342</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.=
html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15867/shard-bmg-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/s=
hard-bmg-3/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695"=
>Intel XE#8695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_sharpness_filter@filter-scaler-downscale.htm=
l">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15867/shard-bmg-1/igt@kms_sharpness_filter@filter-scaler-downscale.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
03">Intel XE#6503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">I=
ntel XE#1729</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7424">Intel XE#7424</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15867/shard-bmg-6/igt@kms_tiled_display@basic-test-pa=
ttern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2426">Intel XE#2426</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15867/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-c=
hamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_vrr@lobf.html">SKIP</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt@kms_vrr@=
lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2168">Intel XE#2168</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7444">Intel XE#7444</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_vrr@lobf-dc3co.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-6/igt@k=
ms_vrr@lobf-dc3co.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8397">Intel XE#8397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-6/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE=
#9271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15867/shard-bmg-5/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-=
bmg-4/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9=
271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/sh=
ard-bmg-2/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_cw_post_sync@walker-post-sync:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_cw_post_sync@walker-post-sync.html">SKIP</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shar=
d-bmg-4/igt@xe_cw_post_sync@walker-post-sync.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8608">Intel XE#8608</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6321">Intel XE#6321</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@xe_evict@evict-mixed-m=
any-threads-small.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority.html">=
SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5867/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-priority.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">In=
tel XE#8370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind=
.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15867/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebin=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7372">Intel XE#7372</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-u=
serptr.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15867/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-multi-=
queue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8374">Intel XE#8374</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@xe_exec_fault_mode@once-multi-queue-imm.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374=
">Intel XE#8374</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15867/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-queue-imm.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-dyn-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-dyn-priority.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
8364">Intel XE#8364</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15867/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-dyn-pri=
ority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-faul=
t-priority.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15867/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preemp=
t-mode-fault-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKI=
P</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1586=
7/shard-bmg-6/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE=
#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-exe=
cqueues-mmap-remap.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/igt@xe_exec_system_allocato=
r@process-many-large-execqueues-mmap-remap.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +6 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-userpt=
r-rebind.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15867/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mix=
ed-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-1g-partial:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_page_reclaim@binds-1g-partial.html">SKIP</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shar=
d-bmg-10/igt@xe_page_reclaim@binds-1g-partial.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_pat@pat-index-xelp.html">SKIP</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-8/igt=
@xe_pat@pat-index-xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/sha=
rd-bmg-10/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>=
)</li>
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
W_15867/shard-bmg-5/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-=
4/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@l2-prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html">SK=
IP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_158=
67/shard-bmg-1/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815">Intel =
XE#8815</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html">SKIP</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/sha=
rd-bmg-4/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Inte=
l XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_query@multigpu-query-invalid-uc-fw-version-mb=
z.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15867/shard-bmg-6/igt@xe_query@multigpu-query-invalid-uc-fw-version-=
mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vfio@open-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_sriov_vfio@open-basic.html">SKIP</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard-bmg-5/=
igt@xe_sriov_vfio@open-basic.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15867/shard=
-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a=
>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9103 -&gt; IGTPW_15867</li>
<li>Linux: xe-5781-2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c -&gt; xe-5790-f=
d2ca2a0c165980cac3a07afa88032da881db2d7</li>
</ul>
<p>IGTPW_15867: 15867<br />
  IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-5781-2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c: 2c43c8e6bbbe54f755b8e5c=
86d582f78159e7a2c<br />
  xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7: fd2ca2a0c165980cac3a07a=
fa88032da881db2d7</p>

</body>
</html>

--===============4851438049961404757==--
