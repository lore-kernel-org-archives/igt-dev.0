Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DD6C982E1
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 10:31:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4C310E039;
	Mon, 21 Sep 2026 10:31:36 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9A210E039;
 Mon, 21 Sep 2026 10:30:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1625743962569838992=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_intel-ci=3A_blocklist_mult?=
 =?utf-8?q?i-queue_tests_on_BMG=2C_LNL=2C_PTL_and_WCL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 21 Sep 2026 10:30:49 -0000
Message-ID: <178998664987.186929.3716772336013902871@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260921065255.39530-1-shivtej.eknath.patil@intel.com>
In-Reply-To: <20260921065255.39530-1-shivtej.eknath.patil@intel.com>
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

--===============1625743962569838992==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: blocklist multi-queue tests on BMG, LNL, PTL and WCL
URL   : https://patchwork.freedesktop.org/series/174557/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9103_FULL -> XEIGTPW_15869_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15869_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15869_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15869_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@core_setmaster@master-drop-set-user.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][2] -> [SKIP][3] +601 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html

  * igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][4] +11 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html

  * igt@xe_exec_system_allocator@partial-middle-remap-no-cpu-fault:
    - shard-bmg:          [PASS][5] -> [DMESG-FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@xe_exec_system_allocator@partial-middle-remap-no-cpu-fault.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@xe_exec_system_allocator@partial-middle-remap-no-cpu-fault.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-madvise:
    - shard-bmg:          [PASS][7] -> [DMESG-WARN][8] +136 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-madvise.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-madvise.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [PASS][9] -> [FAIL][10] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@xe_module_load@reload.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_module_load@reload.html

  * igt@xe_vm@bind-once:
    - shard-bmg:          NOTRUN -> [SKIP][11] +79 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_vm@bind-once.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][12] ([Intel XE#2327]) -> [SKIP][13] +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][14] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][16] ([Intel XE#1124]) -> [SKIP][17] +12 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-bmg:          [SKIP][18] ([Intel XE#7679]) -> [SKIP][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][20] ([Intel XE#367]) -> [SKIP][21] +5 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][22] ([Intel XE#2652]) -> [SKIP][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][24] ([Intel XE#2887]) -> [SKIP][25] +12 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          [SKIP][26] ([Intel XE#3432]) -> [SKIP][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][28] ([Intel XE#2724] / [Intel XE#7449]) -> [SKIP][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@kms_cdclk@plane-scaling.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-bmg:          [SKIP][30] ([Intel XE#2252]) -> [SKIP][31] +9 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@kms_chamelium_audio@dp-audio-after-suspend.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          [SKIP][32] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_chamelium_color@ctm-limited-range.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-bmg:          [SKIP][34] ([Intel XE#7358]) -> [SKIP][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-bmg:          [SKIP][36] ([Intel XE#6974]) -> [SKIP][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@lic-type-0-hdcp14:
    - shard-bmg:          [FAIL][38] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][39] +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@kms_content_protection@lic-type-0-hdcp14.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_content_protection@lic-type-0-hdcp14.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          [SKIP][40] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][41] +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_cursor_crc@cursor-random-512x512.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-bmg:          [SKIP][42] ([Intel XE#2320]) -> [SKIP][43] +4 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][44] ([Intel XE#1508]) -> [SKIP][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          [SKIP][46] ([Intel XE#4354] / [Intel XE#5882]) -> [SKIP][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_dp_link_training@non-uhbr-mst.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [SKIP][48] ([Intel XE#4354] / [Intel XE#5870]) -> [SKIP][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-2/igt@kms_dp_link_training@uhbr-sst.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-bmg:          [SKIP][50] ([Intel XE#8265]) -> [SKIP][51] +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][52] ([Intel XE#2374] / [Intel XE#6128]) -> [SKIP][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-2/igt@kms_feature_discovery@psr2.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][54] ([Intel XE#7178] / [Intel XE#7349]) -> [SKIP][55] +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][56] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][57] +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][58] ([Intel XE#4141]) -> [SKIP][59] +15 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][60] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][61] +5 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][62] ([Intel XE#2311]) -> [SKIP][63] +54 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][64] ([Intel XE#2352] / [Intel XE#7399]) -> [SKIP][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][66] ([Intel XE#9329]) -> [SKIP][67] +81 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][68] ([Intel XE#2350] / [Intel XE#7503]) -> [SKIP][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][70] ([Intel XE#2313]) -> [SKIP][71] +57 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][72] ([Intel XE#7061]) -> [SKIP][73] +8 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][74] ([Intel XE#4090] / [Intel XE#7443]) -> [SKIP][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][76] ([Intel XE#7283]) -> [SKIP][77] +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][78] ([Intel XE#5020] / [Intel XE#7348]) -> [SKIP][79] +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][80] ([Intel XE#7794]) -> [SKIP][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][82] ([Intel XE#1489]) -> [SKIP][83] +8 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][84] ([Intel XE#2387] / [Intel XE#7429]) -> [SKIP][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-bmg:          [SKIP][86] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][87] +11 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@kms_psr@fbc-psr2-sprite-render.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][88] ([Intel XE#2234]) -> [SKIP][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_psr@psr2-primary-render.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          [SKIP][90] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - shard-bmg:          [SKIP][92] ([Intel XE#6503]) -> [SKIP][93] +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_sharpness_filter@invalid-plane-with-filter.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_sharpness_filter@invalid-plane-with-filter.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          [SKIP][94] ([Intel XE#1499] / [Intel XE#9271]) -> [SKIP][95] +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-virtual.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@sriov_basic@pf-unbind-with-vf-probed:
    - shard-bmg:          [ABORT][96] ([Intel XE#8868]) -> [SKIP][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-2/igt@sriov_basic@pf-unbind-with-vf-probed.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@sriov_basic@pf-unbind-with-vf-probed.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          [SKIP][98] ([Intel XE#6599]) -> [SKIP][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@xe_compute@ccs-mode-basic.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          [SKIP][100] ([Intel XE#8370]) -> [SKIP][101] +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-cm.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][102] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][103] +9 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:
    - shard-bmg:          [DMESG-WARN][104] ([Intel XE#9331]) -> [SKIP][105] +15 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@many-userptr-rebind-prefetch:
    - shard-bmg:          [DMESG-WARN][106] ([Intel XE#9331]) -> [DMESG-WARN][107] +1 other test dmesg-warn
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@xe_exec_fault_mode@many-userptr-rebind-prefetch.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-2/igt@xe_exec_fault_mode@many-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          [SKIP][108] ([Intel XE#8374]) -> [SKIP][109] +12 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_multi_queue@two-queues-basic-smem:
    - shard-bmg:          [SKIP][110] ([Intel XE#8364]) -> [SKIP][111] +29 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@xe_exec_multi_queue@two-queues-basic-smem.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-basic-smem.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-bmg:          [DMESG-WARN][112] ([Intel XE#9130]) -> [SKIP][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@xe_exec_reset@gt-reset-fault-injection.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_exec_reset@gt-reset-fault-injection.html

  * igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
    - shard-bmg:          [SKIP][114] ([Intel XE#8369]) -> [SKIP][115] +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-race:
    - shard-bmg:          [DMESG-WARN][116] -> [SKIP][117] +47 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@xe_exec_system_allocator@many-large-execqueues-malloc-race.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_exec_system_allocator@many-large-execqueues-malloc-race.html

  * igt@xe_exec_system_allocator@twice-mmap-free-madvise:
    - shard-bmg:          [SKIP][118] -> [DMESG-WARN][119] +54 other tests dmesg-warn
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_exec_system_allocator@twice-mmap-free-madvise.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-3/igt@xe_exec_system_allocator@twice-mmap-free-madvise.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
    - shard-bmg:          [SKIP][120] ([Intel XE#8378]) -> [SKIP][121] +11 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-bmg:          [SKIP][122] ([Intel XE#7954]) -> [SKIP][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@xe_gpgpu_fill@offset-4x4.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_page_reclaim@prl-max-entries:
    - shard-bmg:          [SKIP][124] ([Intel XE#7793]) -> [SKIP][125] +3 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@xe_page_reclaim@prl-max-entries.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_page_reclaim@prl-max-entries.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][126] ([Intel XE#1420] / [Intel XE#7590]) -> [SKIP][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@xe_pat@pat-index-xehpc.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][128] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@xe_pm@d3cold-multiple-execs.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          [SKIP][130] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][131] +4 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - {shard-ptl}:        [PASS][132] -> [SKIP][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-ptl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-ptl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15869_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_debugfs@read-all-entries:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#9329]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@core_debugfs@read-all-entries.html

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [PASS][135] -> [SKIP][136] ([Intel XE#8749]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@core_hotunplug@hotrebind-lateclose.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [PASS][137] -> [SKIP][138] ([Intel XE#2134])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@fbdev@nullptr.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@fbdev@nullptr.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#5177])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#1124]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#367])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][142] ([Intel XE#7084] / [Intel XE#8150])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#3432])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#2652]) +15 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2887]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-10/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2325] / [Intel XE#7358])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2252])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#6969]) +23 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-5/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#6974])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#2320])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-10/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [PASS][151] -> [FAIL][152] ([Intel XE#7949])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-5/igt@kms_fbcon_fbt@psr-suspend.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][153] -> [FAIL][154] ([Intel XE#301])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#7178] / [Intel XE#7351])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#4141]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#7061] / [Intel XE#7356])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#2311]) +17 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#7061]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#2313]) +16 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_lease@possible-crtcs-filtering:
    - shard-bmg:          [PASS][161] -> [SKIP][162] ([Intel XE#9329]) +29 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_lease@possible-crtcs-filtering.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_lease@possible-crtcs-filtering.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#8395] / [Intel XE#8396])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#8396]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][166] -> [FAIL][167] ([Intel XE#8399]) +1 other test fail
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [PASS][168] -> [SKIP][169] ([Intel XE#8710]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#1489]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          [PASS][172] -> [SKIP][173] ([Intel XE#8361]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-lnl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#6503])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-10/igt@kms_sharpness_filter@filter-basic.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-bmg:          [PASS][175] -> [INCOMPLETE][176] ([Intel XE#9272]) +1 other test incomplete
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_vblank@ts-continuation-suspend.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-6/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_compute@eu-busy-10s:
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#6599])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-10/igt@xe_compute@eu-busy-10s.html

  * igt@xe_evict@evict-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][178] ([Intel XE#8370])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@xe_evict@evict-small-multi-queue.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][179] ([Intel XE#2322] / [Intel XE#7372])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#8374]) +4 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@many-queues-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][181] ([Intel XE#8364]) +5 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-5/igt@xe_exec_multi_queue@many-queues-close-fd-smem.html

  * igt@xe_exec_system_allocator@partial-atomic-remap-no-cpu-fault:
    - shard-bmg:          [PASS][182] -> [DMESG-WARN][183] ([Intel XE#9331]) +2 other tests dmesg-warn
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@xe_exec_system_allocator@partial-atomic-remap-no-cpu-fault.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@xe_exec_system_allocator@partial-atomic-remap-no-cpu-fault.html

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-prefetch-madvise:
    - shard-bmg:          [PASS][184] -> [DMESG-WARN][185] ([Intel XE#9309]) +2 other tests dmesg-warn
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-stride-malloc-prefetch-madvise.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-stride-malloc-prefetch-madvise.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][186] ([Intel XE#8378])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#6281] / [Intel XE#7426])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212]) -> ([PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [SKIP][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238]) ([Intel XE#2457] / [Intel XE#7405])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-2/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-4/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-10/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-5/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-3/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-5/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-3/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-2/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-2/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-10/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-3/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-6/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-6/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][239] ([Intel XE#6964])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [SKIP][240] ([Intel XE#2284] / [Intel XE#7370])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-2/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s3-basic-exec:
    - shard-bmg:          [PASS][241] -> [INCOMPLETE][242] ([Intel XE#8175])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@xe_pm@s3-basic-exec.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-6/igt@xe_pm@s3-basic-exec.html

  * igt@xe_prefetch_fault@prefetch-fault:
    - shard-bmg:          NOTRUN -> [SKIP][243] ([Intel XE#7599])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-2/igt@xe_prefetch_fault@prefetch-fault.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][244] ([Intel XE#4733] / [Intel XE#7417])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][245] ([Intel XE#944])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@xe_query@multigpu-query-cs-cycles.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug-with-load:
    - shard-bmg:          [SKIP][246] ([Intel XE#8749]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@core_hotunplug@hotreplug-with-load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-5/igt@core_hotunplug@hotreplug-with-load.html

  * igt@fbdev@read:
    - shard-bmg:          [SKIP][248] ([Intel XE#2134]) -> [PASS][249] +1 other test pass
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@fbdev@read.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@fbdev@read.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][250] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][251]
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2:
    - shard-bmg:          [FAIL][252] ([Intel XE#6078]) -> [PASS][253]
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-lnl:          [FAIL][254] ([Intel XE#1231]) -> [PASS][255]
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_flip@blocking-wf_vblank@d-hdmi-a3:
    - shard-bmg:          [FAIL][256] ([Intel XE#3149] / [Intel XE#5408] / [Intel XE#6266]) -> [PASS][257] +1 other test pass
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@kms_flip@blocking-wf_vblank@d-hdmi-a3.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-6/igt@kms_flip@blocking-wf_vblank@d-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][258] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][259]
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
    - shard-bmg:          [FAIL][260] ([Intel XE#9313]) -> [PASS][261]
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-bmg:          [INCOMPLETE][262] ([Intel XE#2597]) -> [PASS][263] +1 other test pass
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-2/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][264] ([Intel XE#8399]) -> [PASS][265] +1 other test pass
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-bmg:          [SKIP][266] ([Intel XE#8710]) -> [PASS][267] +1 other test pass
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_pm_rpm@legacy-planes-dpms.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_sequence@get-idle:
    - shard-bmg:          [SKIP][268] ([Intel XE#9329]) -> [PASS][269] +62 other tests pass
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_sequence@get-idle.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-2/igt@kms_sequence@get-idle.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][270] -> [PASS][271] +540 other tests pass
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-3/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_system_allocator@once-large-malloc-busy-nomemset:
    - shard-bmg:          [DMESG-WARN][272] ([Intel XE#9331]) -> [PASS][273] +12 other tests pass
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@xe_exec_system_allocator@once-large-malloc-busy-nomemset.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-2/igt@xe_exec_system_allocator@once-large-malloc-busy-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-malloc-race:
    - shard-bmg:          [DMESG-WARN][274] -> [PASS][275] +111 other tests pass
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-malloc-race.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-malloc-race.html

  * igt@xe_exec_system_allocator@processes-evict-malloc:
    - shard-bmg:          [DMESG-WARN][276] ([Intel XE#9309]) -> [PASS][277]
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@xe_exec_system_allocator@processes-evict-malloc.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-5/igt@xe_exec_system_allocator@processes-evict-malloc.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-lnl:          [FAIL][278] ([Intel XE#9096]) -> [PASS][279]
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-lnl-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          [FAIL][280] -> [PASS][281]
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_module_load@force-load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@xe_module_load@force-load.html

  * igt@xe_oa@non-zero-reason-all:
    - {shard-ptl}:        [FAIL][282] ([Intel XE#7334]) -> [PASS][283] +1 other test pass
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-ptl-5/igt@xe_oa@non-zero-reason-all.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-ptl-4/igt@xe_oa@non-zero-reason-all.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-bmg:          [INCOMPLETE][284] ([Intel XE#8175]) -> [PASS][285]
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-6/igt@xe_pm@s3-vm-bind-prefetch.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@xe_pm@s3-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][286] -> [SKIP][287] ([Intel XE#2327]) +2 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][288] -> [SKIP][289] ([Intel XE#1124]) +9 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][290] -> [SKIP][291] ([Intel XE#607] / [Intel XE#7361])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][292] -> [SKIP][293] ([Intel XE#610] / [Intel XE#7387])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][294] -> [SKIP][295] ([Intel XE#367]) +3 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [SKIP][296] ([Intel XE#9329]) -> [INCOMPLETE][297] ([Intel XE#7084] / [Intel XE#8150])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][298] ([Intel XE#9329]) -> [SKIP][299] ([Intel XE#3432]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][300] ([Intel XE#9329]) -> [SKIP][301] ([Intel XE#2887]) +12 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][302] ([Intel XE#9329]) -> [SKIP][303] ([Intel XE#2652]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][304] -> [SKIP][305] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_chamelium_color@degamma.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-bmg:          [SKIP][306] -> [SKIP][307] ([Intel XE#7358]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          [SKIP][308] -> [SKIP][309] ([Intel XE#2252]) +7 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-lnl:          [SKIP][310] ([Intel XE#6507]) -> [SKIP][311] ([Intel XE#6507] / [Intel XE#7358])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-5/igt@kms_chamelium_sharpness_filter@filter-basic.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-lnl-3/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][312] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][313] ([Intel XE#9329]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_content_protection@dp-mst-type-0.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-bmg:          [SKIP][314] ([Intel XE#9329]) -> [SKIP][315] ([Intel XE#6974])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-10/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][316] ([Intel XE#9329]) -> [SKIP][317] ([Intel XE#7642])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_content_protection@type1.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-3/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          [SKIP][318] -> [SKIP][319] ([Intel XE#2320]) +2 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][320] -> [SKIP][321] ([Intel XE#2321] / [Intel XE#7355]) +3 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-bmg:          [SKIP][322] -> [SKIP][323] ([Intel XE#9009])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-with-bpc-bigjoiner:
    - shard-bmg:          [SKIP][324] -> [SKIP][325] ([Intel XE#8265]) +2 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-bigjoiner.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-bigjoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          [SKIP][326] ([Intel XE#9329]) -> [SKIP][327] ([Intel XE#4422] / [Intel XE#7442])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          [SKIP][328] ([Intel XE#4422] / [Intel XE#7442]) -> [SKIP][329] ([Intel XE#9329])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][330] ([Intel XE#2373] / [Intel XE#7448]) -> [SKIP][331] ([Intel XE#9329])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-4/igt@kms_feature_discovery@display-3x.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@vrr:
    - shard-bmg:          [SKIP][332] ([Intel XE#9329]) -> [SKIP][333] ([Intel XE#8586])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_feature_discovery@vrr.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][334] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][335] ([Intel XE#301])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][336] -> [SKIP][337] ([Intel XE#7178] / [Intel XE#7349]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][338] -> [SKIP][339] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][340] ([Intel XE#9329]) -> [SKIP][341] ([Intel XE#4141]) +13 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][342] ([Intel XE#9329]) -> [SKIP][343] ([Intel XE#2311]) +55 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][344] ([Intel XE#9329]) -> [SKIP][345] ([Intel XE#7061]) +4 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][346] ([Intel XE#9329]) -> [SKIP][347] ([Intel XE#2352] / [Intel XE#7399])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][348] ([Intel XE#9329]) -> [SKIP][349] ([Intel XE#2313]) +58 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][350] ([Intel XE#9329]) -> [SKIP][351] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][352] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][353] ([Intel XE#3544])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][354] -> [SKIP][355] ([Intel XE#1503])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][356] ([Intel XE#9329]) -> [SKIP][357] ([Intel XE#6911] / [Intel XE#7378])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][358] -> [SKIP][359] ([Intel XE#7591])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-bmg:          [SKIP][360] -> [SKIP][361] ([Intel XE#7283]) +7 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-modifier.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][362] -> [SKIP][363] ([Intel XE#2393])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][364] -> [SKIP][365] ([Intel XE#5021] / [Intel XE#7377])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][366] -> [SKIP][367] ([Intel XE#2763] / [Intel XE#6886])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc3co-framedrop-check:
    - shard-bmg:          [SKIP][368] -> [SKIP][369] ([Intel XE#8395] / [Intel XE#8396])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_pm_dc@dc3co-framedrop-check.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@kms_pm_dc@dc3co-framedrop-check.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][370] ([Intel XE#9329]) -> [SKIP][371] ([Intel XE#2505] / [Intel XE#7447])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][372] ([Intel XE#9329]) -> [SKIP][373] ([Intel XE#2499])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][374] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [SKIP][375] ([Intel XE#8710])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-10/igt@kms_pm_rpm@dpms-lpsp.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][376] ([Intel XE#8710]) -> [SKIP][377] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][378] -> [SKIP][379] ([Intel XE#1489]) +6 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          [SKIP][380] -> [SKIP][381] ([Intel XE#2234] / [Intel XE#2850]) +16 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_psr@psr-basic.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_psr@psr-basic.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          [SKIP][382] ([Intel XE#9329]) -> [SKIP][383] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-270.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][384] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][385] ([Intel XE#9329]) +1 other test skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][386] -> [SKIP][387] ([Intel XE#2413])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][388] ([Intel XE#9329]) -> [SKIP][389] ([Intel XE#1435] / [Intel XE#8695])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][390] ([Intel XE#1435] / [Intel XE#8695]) -> [SKIP][391] ([Intel XE#9329])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - shard-bmg:          [SKIP][392] -> [SKIP][393] ([Intel XE#6503]) +2 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_sharpness_filter@filter-scaler-downscale.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-5/igt@kms_sharpness_filter@filter-scaler-downscale.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][394] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][395] ([Intel XE#9329])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][396] -> [SKIP][397] ([Intel XE#2509] / [Intel XE#7437])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr-video-mode:
    - shard-bmg:          [SKIP][398] ([Intel XE#9271]) -> [SKIP][399] ([Intel XE#9329])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-9/igt@kms_vrr@cmrr-video-mode.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_vrr@cmrr-video-mode.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][400] -> [SKIP][401] ([Intel XE#1499] / [Intel XE#9271]) +1 other test skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_vrr@flip-suspend.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][402] ([Intel XE#9329]) -> [SKIP][403] ([Intel XE#2168] / [Intel XE#7444])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@kms_vrr@lobf.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-3/igt@kms_vrr@lobf.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          [SKIP][404] -> [SKIP][405] ([Intel XE#6599])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_compute@ccs-mode-compute-kernel.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-3/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_cw_post_sync@walker-post-sync:
    - shard-bmg:          [SKIP][406] -> [SKIP][407] ([Intel XE#8608])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_cw_post_sync@walker-post-sync.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-3/igt@xe_cw_post_sync@walker-post-sync.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [SKIP][408] -> [INCOMPLETE][409] ([Intel XE#6321] / [Intel XE#8355])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-queue-priority:
    - shard-bmg:          [SKIP][410] -> [SKIP][411] ([Intel XE#8370]) +1 other test skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-5/igt@xe_evict@evict-small-multi-queue-priority.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][412] -> [SKIP][413] ([Intel XE#2322] / [Intel XE#7372]) +10 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
    - shard-bmg:          [SKIP][414] -> [SKIP][415] ([Intel XE#8374]) +12 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          [SKIP][416] -> [SKIP][417] ([Intel XE#8364]) +32 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-priority.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          [SKIP][418] -> [SKIP][419] ([Intel XE#8369])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-10/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-bmg:          [SKIP][420] -> [DMESG-WARN][421] ([Intel XE#9331]) +3 other tests dmesg-warn
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:
    - shard-bmg:          [SKIP][422] -> [SKIP][423] ([Intel XE#8378]) +8 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][424] -> [SKIP][425] ([Intel XE#586] / [Intel XE#7323] / [Intel XE#7384])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_mmap@small-bar.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-10/igt@xe_mmap@small-bar.html

  * igt@xe_page_reclaim@binds-1g-partial:
    - shard-bmg:          [SKIP][426] -> [SKIP][427] ([Intel XE#7793]) +1 other test skip
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_page_reclaim@binds-1g-partial.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-6/igt@xe_page_reclaim@binds-1g-partial.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][428] -> [SKIP][429] ([Intel XE#2245] / [Intel XE#7590])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_pat@pat-index-xelp.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          [SKIP][430] -> [SKIP][431] ([Intel XE#2284] / [Intel XE#7370]) +1 other test skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_pm@s3-d3cold-basic-exec.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-2/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][432] -> [SKIP][433] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7517])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-10/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_prefetch_fault@l2-prefetch-fault:
    - shard-bmg:          [SKIP][434] -> [SKIP][435] ([Intel XE#8815])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_prefetch_fault@l2-prefetch-fault.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@xe_prefetch_fault@l2-prefetch-fault.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          [SKIP][436] -> [SKIP][437] ([Intel XE#4733] / [Intel XE#7417])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][438] -> [SKIP][439] ([Intel XE#944]) +4 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [SKIP][440] -> [DMESG-WARN][441] ([Intel XE#8963]) +1 other test dmesg-warn
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-6/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
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
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#5946]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5946
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323
  [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
  [Intel XE#7334]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
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
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7384]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7949]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7949
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8361
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#8710]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710
  [Intel XE#8749]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749
  [Intel XE#8815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9272]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9272
  [Intel XE#9309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9309
  [Intel XE#9312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312
  [Intel XE#9313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313
  [Intel XE#9329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9329
  [Intel XE#9331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_9103 -> IGTPW_15869
  * Linux: xe-5781-2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c -> xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf

  IGTPW_15869: 15869
  IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5781-2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c: 2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c
  xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf: 7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/index.html

--===============1625743962569838992==
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
<tr><td><b>Series:</b></td><td>intel-ci: blocklist multi-queue tests on BMG=
, LNL, PTL and WCL</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/174557/">https://patchwork.freedesktop.org/series/174557/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15869/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15869/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9103_FULL -&gt; XEIGTPW_15869_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15869_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_15869_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15=
869_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@core_setmaster@master-drop-set-u=
ser.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-=
7/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> +601 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@xe_exec_system_allocator@many-la=
rge-execqueues-new-race-nomemset.html">DMESG-WARN</a> +11 other tests dmesg=
-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-middle-remap-no-cpu-fault:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@xe_exec_system_allocator@partial-middle-remap-no=
-cpu-fault.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15869/shard-bmg-4/igt@xe_exec_system_allocator@partial-midd=
le-remap-no-cpu-fault.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-madvise:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-=
large-execqueues-malloc-madvise.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@xe_exec_system_a=
llocator@threads-shared-vm-many-large-execqueues-malloc-madvise.html">DMESG=
-WARN</a> +136 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@xe_module_load@reload.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/ig=
t@xe_module_load@reload.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-once:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_vm@bind-once.html">SKIP</a> +=
79 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Int=
el XE#2327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15869/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</=
a> +3 other tests skip</li>
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
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_big_fb@li=
near-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Int=
el XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15869/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</=
a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@kms_bw@connected-linear-tiling-4-displays-target=
-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7679">Intel XE#7679</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_bw@connected-linea=
r-tiling-4-displays-target-2160x1440p.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-target-2560x1440=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/367">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-ta=
rget-2560x1440p.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/26=
52">Intel XE#2652</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15869/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-cc=
s.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-r=
c-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_ccs@crc-primary-rotation=
-180-y-tiled-gen12-rc-ccs.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432=
">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15869/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.ht=
ml">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-5/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449"=
>Intel XE#7449</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15869/shard-bmg-7/igt@kms_cdclk@plane-scaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@kms_chamelium_audio@dp-audio-after-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
252">Intel XE#2252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15869/shard-bmg-7/igt@kms_chamelium_audio@dp-audio-after-susp=
end.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_chamelium_color@ctm-limited-range.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">=
Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7358">Intel XE#7358</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_chamelium_color@ctm-limite=
d-range.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-lut3d-green-o=
nly.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7358">Intel XE#7358</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_chamelium_color_pipeline@p=
lane-lut3d-green-only.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_content_protection@dp-mst-type-0-hdcp14.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6974">Intel XE#6974</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0-=
hdcp14.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-6/igt@kms_content_protection@lic-type-0-hdcp14.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/117=
8">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_content_p=
rotection@lic-type-0-hdcp14.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">=
Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7355">Intel XE#7355</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_cursor_crc@cursor-random-5=
12x512.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-max-size.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2320">Intel XE#2320</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement=
-max-size.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE=
#1508</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15869/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Int=
el XE#4354</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5882">Intel XE#5882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-mst=
.html">SKIP</a></li>
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
intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst.html">SK=
IP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">I=
ntel XE#8265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15869/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SK=
IP</a> +1 other test skip</li>
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
el-xe/IGTPW_15869/shard-bmg-7/igt@kms_feature_discovery@psr2.html">SKIP</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4t=
iledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/ig=
t@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.htm=
l">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-y=
ftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@k=
ms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP=
</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_frontbuffer_trac=
king@fbc-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> +15 other tests ski=
p</li>
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
-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_frontbuffer_tr=
acking@fbc-argb161616f-draw-blt.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_frontbuffe=
r_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> +54 ot=
her tests skip</li>
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
.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_frontbuffer_tracking@=
fbcdrrs-tiling-y.html">SKIP</a></li>
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
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_frontbu=
ffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
+81 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350"=
>Intel XE#2350</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7503">Intel XE#7503</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_frontbuffer_tracking@plan=
e-fbc-rte.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_frontbuffer_track=
ing@psrhdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> +57 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw=
-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7061">Intel XE#7061</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_frontbuffer_tracking@p=
srhdr-argb161616f-draw-render.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_joiner@switch-modeset-ultra-joiner-big-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4090">Intel XE#4090</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7443">Intel XE#7443</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_joiner@switch=
-modeset-ultra-joiner-big-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-sour=
ce-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_plane@pixel-format=
-y-tiled-ccs-modifier-source-clamping.html">SKIP</a> +4 other tests skip</l=
i>
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
ntel-xe/IGTPW_15869/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html">SKIP=
</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard=
-bmg-7/igt@kms_pm_dc@dc6-psr.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg=
-area.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel=
 XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7429">Intel XE#7429</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8888.ht=
ml">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-5/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel X=
E#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2850">Intel XE#2850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_psr@fbc-psr2-sprite-render.html">=
SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#=
2234</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15869/shard-bmg-7/igt@kms_psr@psr2-primary-render.html">SKIP</a></li>
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
-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_rotation_crc@sprit=
e-rotation-90-pos-100-0.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_sharpness_filter@invalid-plane-with-filter.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6503">Intel XE#6503</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_sharpness_filter@invalid-plane-=
with-filter.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/9271">Intel XE#9271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtua=
l.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vf-probed:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-2/igt@sriov_basic@pf-unbind-with-vf-probed.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868">=
Intel XE#8868</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15869/shard-bmg-7/igt@sriov_basic@pf-unbind-with-vf-probed.html">S=
KIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#659=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_158=
69/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">In=
tel XE#8370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15869/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP=
</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userpt=
r-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_exec=
_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> +9 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-invalid-userp=
tr-fault.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_exec_fault_mode@=
many-execqueues-invalid-userptr-fault.html">SKIP</a> +15 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@xe_exec_fault_mode@many-userptr-rebind-prefetch=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/9331">Intel XE#9331</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15869/shard-bmg-2/igt@xe_exec_fault_mode@many-use=
rptr-rebind-prefetch.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr-reb=
ind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_exec_fault_mode@tw=
ice-multi-queue-userptr-rebind-prefetch.html">SKIP</a> +12 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-basic-smem:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@xe_exec_multi_queue@two-queues-basic-smem.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
364">Intel XE#8364</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15869/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-basic-sm=
em.html">SKIP</a> +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-6/igt@xe_exec_reset@gt-reset-fault-injection.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/9130">Intel XE#9130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_exec_reset@gt-reset-fault-injectio=
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
tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_exec_reset@multi-queue-cat-err=
or-on-secondary.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@xe_exec_system_allocator@many-large-execqueues-m=
alloc-race.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_exec_system_allocator@many-l=
arge-execqueues-malloc-race.html">SKIP</a> +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-madvise:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_exec_system_allocator@twice-mmap-free-madvise=
.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15869/shard-bmg-3/igt@xe_exec_system_allocator@twice-mmap-free-madvis=
e.html">DMESG-WARN</a> +54 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-cm-fd-userp=
tr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8378">Intel XE#8378</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_exec_threads@threads-=
multi-queue-cm-fd-userptr-rebind.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@xe_gpgpu_fill@offset-4x4.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954">Intel XE#7954=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1586=
9/shard-bmg-7/igt@xe_gpgpu_fill@offset-4x4.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-max-entries:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel =
XE#7793</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15869/shard-bmg-7/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> +3 =
other tests skip</li>
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
-xe/IGTPW_15869/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
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
ntel-xe/IGTPW_15869/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html">SKIP<=
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
-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bi=
nd-post-termination-irq.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:<ul>
<li>{shard-ptl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-ptl-6/igt@kms_psr_stress_test@invalidate-primary-flip-over=
lay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15869/shard-ptl-2/igt@kms_psr_stress_test@invalidate-primary-flip-=
overlay.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15869_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_debugfs@read-all-entries:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@core_debugfs@read-all-entries.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/9329">Intel XE#9329</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-6/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/sh=
ard-bmg-7/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749">Intel XE#8749</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@fbdev@n=
ullptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@intel_hwmon@hwmon-write.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177=
">Intel XE#5177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-=
target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs@pipe-d-hdmi-a-3.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic=
-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +15 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-10/igt@kms_ccs@missing-ccs-buffer-y-ti=
led-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-cha=
nge-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-5/igt@kms_color_pipeline@plane-lut1d-p=
ost-ctm3x4@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +23 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@kms_content_protection@dp-mst-ty=
pe-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-10/igt@kms_cursor_crc@cursor-random-32=
x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-lnl-5/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-lnl-6=
/igt@kms_fbcon_fbt@psr-suspend.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7949">Intel XE#7949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15869/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs=
-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs=
hdr-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-=
1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +16 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_lease@possible-crtcs-filtering:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_lease@possible-crtcs-filtering.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/sh=
ard-bmg-7/igt@kms_lease@possible-crtcs-filtering.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9329">Intel XE#9329</a=
>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6=
886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@kms_pm_dc@dc3co-framedrop-check@=
pr-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@kms_pm_dc@dc3co-framedrop-check@=
psr2-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-lnl-3/igt@k=
ms_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8399">Intel XE#8399</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/=
shard-bmg-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710">Intel XE#871=
0</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@kms_psr2_sf@psr2-cursor-plane-mo=
ve-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_psr@fbc-psr-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234=
">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-lnl-7/igt@kms_psr_stress_test@flip-primary-invalidate-over=
lay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15869/shard-lnl-5/igt@kms_psr_stress_test@flip-primary-invalidate-=
overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8361">Intel XE#8361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-10/igt@kms_sharpness_filter@filter-bas=
ic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_vblank@ts-continuation-suspend.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/sh=
ard-bmg-6/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9272">Intel XE#9=
272</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-10/igt@xe_compute@eu-busy-10s.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599=
">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@xe_evict@evict-small-multi-queue=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-n=
ull-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-qu=
eue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-5/igt@xe_exec_multi_queue@many-queues-=
close-fd-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8364">Intel XE#8364</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-atomic-remap-no-cpu-fault:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@xe_exec_system_allocator@partial-atomic-remap-no=
-cpu-fault.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15869/shard-bmg-8/igt@xe_exec_system_allocator@partial-atom=
ic-remap-no-cpu-fault.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) +2 other tests dme=
sg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-prefetch-madvise=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-stride-mal=
loc-prefetch-madvise.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@xe_exec_system_allocator@th=
reads-many-stride-malloc-prefetch-madvise.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/9309">Intel XE#9309</a>=
) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-2/igt@xe_exec_threads@threads-multi-qu=
eue-mixed-shared-vm-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-6/igt@xe_fault_injection@exec-queue-cr=
eate-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7426">Intel XE#7426</a>)<=
/li>
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
ree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bm=
g-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-5/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1586=
9/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-5/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15869/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15869/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-3/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15869/shard-bmg-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shar=
d-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5869/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-3/igt@xe_module_l=
oad@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15869/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bm=
g-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15869/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15869/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15869/shard-bmg-6/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">=
Intel XE#2457</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7405">Intel XE#7405</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@xe_multigpu_svm@mgpu-latency-cop=
y-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-2/igt@xe_pm@d3cold-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Int=
el XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@xe_pm@s3-basic-exec.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-6/igt@x=
e_pm@s3-basic-exec.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8175">Intel XE#8175</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-2/igt@xe_prefetch_fault@prefetch-fault=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@xe_pxp@display-black-pxp-fb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@xe_query@multigpu-query-cs-cycle=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-with-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@core_hotunplug@hotreplug-with-load.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749">Int=
el XE#8749</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15869/shard-bmg-5/igt@core_hotunplug@hotreplug-with-load.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@fbdev@read.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/=
igt@fbdev@read.html">PASS</a> +1 other test pass</li>
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
01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_async_flips@alternate-=
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
.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_async_flips@alternate-sy=
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
x-ci.01.org/tree/intel-xe/IGTPW_15869/shard-lnl-4/igt@kms_big_fb@4-tiled-ma=
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
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-6/igt@kms_flip@blockin=
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
l-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-lnl-6/igt@kms_flip@flip-vs-=
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
/IGTPW_15869/shard-bmg-1/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html">PASS=
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
tel-xe/IGTPW_15869/shard-bmg-2/igt@kms_pipe_crc_basic@suspend-read-crc.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard=
-lnl-5/igt@kms_pm_dc@dc6-psr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710">Intel XE=
#8710</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15869/shard-bmg-9/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_sequence@get-idle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9329">Intel XE#9329</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/s=
hard-bmg-2/igt@kms_sequence@get-idle.html">PASS</a> +62 other tests pass</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SK=
IP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_158=
69/shard-bmg-3/igt@xe_exec_basic@many-bindexecqueue-rebind.html">PASS</a> +=
540 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc-busy-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-5/igt@xe_exec_system_allocator@once-large-malloc-busy-=
nomemset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-2/igt@xe_exec_system_allo=
cator@once-large-malloc-busy-nomemset.html">PASS</a> +12 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-mall=
oc-race.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15869/shard-bmg-1/igt@xe_exec_system_allocator@process-m=
any-large-malloc-race.html">PASS</a> +111 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@processes-evict-malloc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-1/igt@xe_exec_system_allocator@processes-evict-malloc.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9309">Intel XE#9309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15869/shard-bmg-5/igt@xe_exec_system_allocator@pro=
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
org/tree/intel-xe/IGTPW_15869/shard-lnl-7/igt@xe_exec_threads@threads-hang-=
userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_module_load@force-load.html">FAIL</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9=
/igt@xe_module_load@force-load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason-all:</p>
<ul>
<li>{shard-ptl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-ptl-5/igt@xe_oa@non-zero-reason-all.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334">Intel XE#733=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_158=
69/shard-ptl-4/igt@xe_oa@non-zero-reason-all.html">PASS</a> +1 other test p=
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
PW_15869/shard-bmg-1/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/s=
hard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/=
shard-bmg-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#112=
4</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.h=
tml">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15869/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.ht=
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
69/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (=
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
/IGTPW_15869/shard-bmg-9/igt@kms_bw@linear-tiling-2-displays-target-2560x14=
40p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
9329">Intel XE#9329</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15869/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bm=
g-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7084">Intel XE#7084</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-c=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/9329">Intel XE#9329</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-ti=
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
.org/tree/intel-xe/IGTPW_15869/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +12 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/9329">Intel XE#9329</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15869/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2652">Intel XE#2652</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_chamelium_color@degamma.html">SKIP</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg=
-4/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ct=
m3x4.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15869/shard-bmg-8/igt@kms_chamelium_color_pipeline@plane-lut1d-po=
st-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">S=
KIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15=
869/shard-bmg-9/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Inte=
l XE#2252</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-lnl-5/igt@kms_chamelium_sharpness_filter@filter-basic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6507">Intel XE#6507</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15869/shard-lnl-3/igt@kms_chamelium_sharpness_filter@filter-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6507">Intel XE#6507</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_content_protection@dp-mst-type-0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">I=
ntel XE#2390</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6974">Intel XE#6974</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_content_protection@dp-mst-t=
ype-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9329">Intel XE#9329</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1-suspend-res=
ume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/9329">Intel XE#9329</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15869/shard-bmg-10/igt@kms_content_protection@dp-mst=
-type-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_content_protection@type1.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9329">Intel XE#=
9329</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15869/shard-bmg-3/igt@kms_content_protection@type1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869=
/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2=
320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869=
/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2=
321</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
55">Intel XE#7355</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.h=
tml">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15869/shard-bmg-1/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/9009">Intel XE#9009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-bigjoiner.html">SKIP</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-=
bmg-4/igt@kms_dsc@dsc-with-bpc-bigjoiner.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different=
-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/9329">Intel XE#9329</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-di=
rty-rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-t=
ests.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4422">Intel XE#4422</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7442">Intel XE#7442</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_fbc_dirty_r=
ect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/9329">Intel XE#9329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-4/igt@kms_feature_discovery@display-3x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel=
 XE#2373</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7448">Intel XE#7448</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_feature_discovery@display-3x.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/9329">Intel XE#9329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9329">Intel XE#932=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_158=
69/shard-bmg-1/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8586">Intel XE#8586</a>)</=
li>
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
i.01.org/tree/intel-xe/IGTPW_15869/shard-lnl-6/igt@kms_flip@flip-vs-expired=
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
i.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-5/igt@kms_flip_scaled_crc@flip=
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
rg/tree/intel-xe/IGTPW_15869/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp=
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
i.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-3/igt@kms_frontbuffer_tracking=
@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +13 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-=
indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/9329">Intel XE#9329</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_frontbuffer_t=
racking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>=
) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw=
-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9329">Intel XE#9329</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_15869/shard-bmg-2/igt@kms_frontbuffer_tracking@f=
bchdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +4 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/932=
9">Intel XE#9329</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15869/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2352">Intel XE#2352</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9329">Intel XE#9329</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@kms_frontbuffer_tracking=
@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +58 other te=
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
.org/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@kms_frontbuffer_tracking@psr=
-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 oth=
er tests skip</li>
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
tel-xe/IGTPW_15869/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">In=
tel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-5/igt@k=
ms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9329=
">Intel XE#9329</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15869/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.h=
tml">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15869/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-modifier.html">SK=
IP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_158=
69/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel =
XE#7283</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html">SKIP</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-8=
/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-=
bmg-8/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7=
377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-dow=
nscale-factor-0-5.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15869/shard-bmg-4/igt@kms_plane_scaling@planes-upsca=
le-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_pm_dc@dc3co-framedrop-check.html">SKIP</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard=
-bmg-8/igt@kms_pm_dc@dc3co-framedrop-check.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE=
#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/9329">Intel XE#9329</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/sha=
rd-bmg-5/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7447">Intel XE#7447</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/9329">Intel XE#9329</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/sh=
ard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>)</li>
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
fx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8710">Intel XE#8710</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710">Intel X=
E#8710</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15869/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a h=
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
/IGTPW_15869/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous=
-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_psr@psr-basic.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt@k=
ms_psr@psr-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +16 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9329">=
Intel XE#9329</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15869/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-270.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/39=
04">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_rotation_crc@prim=
ary-y-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/9329">Intel XE#9329</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html">SKIP=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869=
/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2=
413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9329">In=
tel XE#9329</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15869/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">=
Intel XE#1435</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8695">Intel XE#8695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/143=
5">Intel XE#1435</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8695">Intel XE#8695</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_setmode@invalid-clone-e=
xclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/9329">Intel XE#9329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_sharpness_filter@filter-scaler-downscale.htm=
l">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15869/shard-bmg-5/igt@kms_sharpness_filter@filter-scaler-downscale.html">=
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
g/tree/intel-xe/IGTPW_15869/shard-bmg-7/igt@kms_tiled_display@basic-test-pa=
ttern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9329">Intel XE#9329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15869/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-ch=
amelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-video-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-9/igt@kms_vrr@cmrr-video-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1586=
9/shard-bmg-7/igt@kms_vrr@cmrr-video-mode.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/9329">Intel XE#9329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_vrr@flip-suspend.html">SKIP</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@=
kms_vrr@flip-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/9329">Intel XE#9329</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-=
3/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2168">Intel XE#2168</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7444">Intel XE#7444</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/sh=
ard-bmg-3/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_cw_post_sync@walker-post-sync:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_cw_post_sync@walker-post-sync.html">SKIP</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shar=
d-bmg-3/igt@xe_cw_post_sync@walker-post-sync.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8608">Intel XE#8608</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.htm=
l">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15869/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6321">Intel XE#6321</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority.html">=
SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5869/shard-bmg-5/igt@xe_evict@evict-small-multi-queue-priority.html">SKIP</=
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
IGTPW_15869/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebin=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7372">Intel XE#7372</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-u=
serptr.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15869/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-=
queue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8374">Intel XE#8374</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-priority.html">SK=
IP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_158=
69/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-priority.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel =
XE#8364</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKI=
P</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1586=
9/shard-bmg-10/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel X=
E#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-i=
dx-uc-single-vma.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15869/shard-bmg-9/igt@xe_exec_system_allocator@pat-in=
dex-madvise-pat-idx-uc-single-vma.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) +3 oth=
er tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm=
-rebind.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15869/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-cm-s=
hared-vm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8378">Intel XE#8378</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_mmap@small-bar.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-10/igt@=
xe_mmap@small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/586">Intel XE#586</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7323">Intel XE#7323</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7384">Intel XE#7384</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-1g-partial:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_page_reclaim@binds-1g-partial.html">SKIP</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shar=
d-bmg-6/igt@xe_page_reclaim@binds-1g-partial.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_pat@pat-index-xelp.html">SKIP</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-1/igt=
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
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg-=
2/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard-bmg=
-10/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329">Intel XE#7329</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517">Int=
el XE#7517</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@l2-prefetch-fault:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_prefetch_fault@l2-prefetch-fault.html">SKIP</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/s=
hard-bmg-9/igt@xe_prefetch_fault@l2-prefetch-fault.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815">Intel XE#8815=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.ht=
ml">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15869/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html">=
SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5869/shard-bmg-9/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Int=
el XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9103/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15869/shard=
-bmg-6/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href=3D=
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
<li>IGT: IGT_9103 -&gt; IGTPW_15869</li>
<li>Linux: xe-5781-2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c -&gt; xe-5791-7=
b7c73e7898b9ae6d5d2d849fe66c44db9b74caf</li>
</ul>
<p>IGTPW_15869: 15869<br />
  IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-5781-2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c: 2c43c8e6bbbe54f755b8e5c=
86d582f78159e7a2c<br />
  xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf: 7b7c73e7898b9ae6d5d2d84=
9fe66c44db9b74caf</p>

</body>
</html>

--===============1625743962569838992==--
