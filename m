Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A55C53200
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jul 2026 01:32:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1B710E64F;
	Thu, 30 Jul 2026 01:32:19 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B884A10E64F;
 Thu, 30 Jul 2026 01:31:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7952236970675403193=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/xe=5Fpm=3A_add_cover?=
 =?utf-8?q?age_for_xe=5Fdevice=5Fsysfs_Modify_xe=5Fpm_subtests_to_exercise_t?=
 =?utf-8?q?he_following_xe=5Fdevice=5Fsysfs=2Ec_functions=3A?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 30 Jul 2026 01:31:47 -0000
Message-ID: <178537510772.2666.6455615495595726895@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260729074046.42734-1-shivtej.eknath.patil@intel.com>
In-Reply-To: <20260729074046.42734-1-shivtej.eknath.patil@intel.com>
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

--===============7952236970675403193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_pm: add coverage for xe_device_sysfs Modify xe_pm subtests to exercise the following xe_device_sysfs.c functions:
URL   : https://patchwork.freedesktop.org/series/171252/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9032_FULL -> XEIGTPW_15607_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15607_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15607_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15607_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@many-free-race-nomemset:
    - shard-bmg:          [PASS][1] -> [SKIP][2] +913 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@xe_exec_system_allocator@many-free-race-nomemset.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_exec_system_allocator@many-free-race-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][3] +114 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@xe_module_load@reload-no-display.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_module_load@reload-no-display.html

  * {igt@xe_pm@vram-d3cold-threshold-show} (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][6] +5 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-lnl-6/igt@xe_pm@vram-d3cold-threshold-show.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][7] ([Intel XE#2233]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          [SKIP][9] ([Intel XE#2327]) -> [SKIP][10] +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-10/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][11] ([Intel XE#1124]) -> [SKIP][12] +13 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][13] ([Intel XE#2328] / [Intel XE#7367]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][15] ([Intel XE#7679]) -> [SKIP][16] +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:
    - shard-bmg:          [SKIP][17] ([Intel XE#367]) -> [SKIP][18] +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][19] ([Intel XE#2652]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][21] ([Intel XE#3432]) -> [SKIP][22] +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][23] ([Intel XE#2887]) -> [SKIP][24] +22 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][25] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][26] +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-1/igt@kms_chamelium_color@ctm-red-to-blue.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-bmg:          [SKIP][27] ([Intel XE#7358]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][29] ([Intel XE#2252]) -> [SKIP][30] +10 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][31] ([Intel XE#7642]) -> [SKIP][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-8/igt@kms_content_protection@content-type-change.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-bmg:          [SKIP][33] ([Intel XE#6974]) -> [SKIP][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-9/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@suspend-resume:
    - shard-bmg:          [FAIL][35] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][36] +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@kms_content_protection@suspend-resume.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          [SKIP][37] ([Intel XE#2320]) -> [SKIP][38] +5 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][39] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][40] +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][41] ([Intel XE#1508]) -> [SKIP][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          [SKIP][43] ([Intel XE#4354] / [Intel XE#7386]) -> [SKIP][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-7/igt@kms_dp_link_training@uhbr-mst.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-bmg:          [SKIP][45] ([Intel XE#8265]) -> [SKIP][46] +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          [SKIP][47] ([Intel XE#4422] / [Intel XE#7442]) -> [SKIP][48] +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][49] ([Intel XE#4156] / [Intel XE#7425]) -> [SKIP][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@kms_fbcon_fbt@fbc.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][51] ([Intel XE#8680]) -> [SKIP][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@kms_fbcon_fbt@psr.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][53] ([Intel XE#7178] / [Intel XE#7349]) -> [SKIP][54] +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][55] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][56] +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-bmg:          [SKIP][57] ([Intel XE#7179]) -> [SKIP][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-5/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][59] ([Intel XE#7061]) -> [SKIP][60] +10 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][61] ([Intel XE#4141]) -> [SKIP][62] +20 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-bmg:          [SKIP][63] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][64] +5 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][65] ([Intel XE#2311]) -> [SKIP][66] +83 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-bmg:          [SKIP][67] ([Intel XE#7399]) -> [SKIP][68] +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][69] ([Intel XE#2313]) -> [SKIP][70] +84 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][71] ([Intel XE#1503]) -> [SKIP][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][73] ([Intel XE#6901]) -> [SKIP][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@kms_joiner@invalid-modeset-big-joiner.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          [SKIP][75] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375]) -> [SKIP][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][77] ([Intel XE#7283]) -> [SKIP][78] +7 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][79] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][80] +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][81] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) -> [SKIP][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-framegap:
    - shard-bmg:          [SKIP][83] ([Intel XE#8395] / [Intel XE#8396]) -> [SKIP][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-framegap.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-framegap.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-bmg:          [SKIP][85] ([Intel XE#6927]) -> [SKIP][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-7/igt@kms_pm_dc@dc5-pageflip-negative.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][87] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [SKIP][88] +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][89] ([Intel XE#1489]) -> [SKIP][90] +7 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          [SKIP][91] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][92] +15 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-plane-onoff.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][93] ([Intel XE#2234]) -> [SKIP][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@kms_psr@psr2-primary-render.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][95] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][96] +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-10/igt@kms_rotation_crc@sprite-rotation-90.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][97] ([Intel XE#1435] / [Intel XE#8695]) -> [SKIP][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          [SKIP][99] ([Intel XE#6503]) -> [SKIP][100] +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][101] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][103] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][105] ([Intel XE#1499]) -> [SKIP][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-2/igt@kms_vrr@flip-suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][107] ([Intel XE#2168] / [Intel XE#7444]) -> [SKIP][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-10/igt@kms_vrr@lobf.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_vrr@lobf.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          [SKIP][109] ([Intel XE#6599]) -> [SKIP][110] +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-5/igt@xe_compute@ccs-mode-basic.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][111] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350]) -> [SKIP][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-10/igt@xe_create@multigpu-create-massive-size.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][113] ([Intel XE#6321] / [Intel XE#8355]) -> [SKIP][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-queue-priority-cm:
    - shard-bmg:          [SKIP][115] ([Intel XE#8370]) -> [SKIP][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@xe_evict@evict-small-multi-queue-priority-cm.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          [SKIP][117] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][118] +10 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_fault_mode@atomic-many:
    - shard-bmg:          [FAIL][119] ([Intel XE#8578]) -> [SKIP][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_exec_fault_mode@atomic-many.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
    - shard-bmg:          [SKIP][121] ([Intel XE#8374]) -> [SKIP][122] +16 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
    - shard-bmg:          [SKIP][123] ([Intel XE#8364]) -> [SKIP][124] +38 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:
    - shard-bmg:          [SKIP][125] ([Intel XE#8369]) -> [SKIP][126] +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          [SKIP][127] ([Intel XE#8378]) -> [SKIP][128] +8 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          [SKIP][129] ([Intel XE#2459] / [Intel XE#2596] / [Intel XE#7321] / [Intel XE#7453]) -> [SKIP][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-1/igt@xe_media_fill@media-fill.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][131] ([Intel XE#586] / [Intel XE#7323] / [Intel XE#7384]) -> [SKIP][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@xe_mmap@small-bar.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_mmap@small-bar.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-bmg:          [SKIP][133] ([Intel XE#7793]) -> [SKIP][134] +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-5/igt@xe_page_reclaim@basic-mixed.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][135] ([Intel XE#2236] / [Intel XE#7590]) -> [SKIP][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pat@pat-sw-hw-reset-compare:
    - shard-bmg:          [FAIL][137] ([Intel XE#7695]) -> [SKIP][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-2/igt@xe_pat@pat-sw-hw-reset-compare.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_pat@pat-sw-hw-reset-compare.html

  * igt@xe_pat@xa-app-transient-media-on:
    - shard-bmg:          [SKIP][139] ([Intel XE#7590]) -> [SKIP][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-8/igt@xe_pat@xa-app-transient-media-on.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_pat@xa-app-transient-media-on.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][141] ([Intel XE#5694] / [Intel XE#7370]) -> [SKIP][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@xe_pm@d3cold-i2c.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          [SKIP][143] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][144] +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-5/igt@xe_pm@d3cold-mocs.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_pm@d3cold-mocs.html

  * igt@xe_prefetch_fault@prefetch-fault:
    - shard-bmg:          [SKIP][145] ([Intel XE#7599]) -> [SKIP][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-5/igt@xe_prefetch_fault@prefetch-fault.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_prefetch_fault@prefetch-fault.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          [SKIP][147] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][148] +4 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-bmg:          [SKIP][149] ([Intel XE#944]) -> [SKIP][150] +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-10/igt@xe_query@multigpu-query-invalid-query.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_query@multigpu-query-invalid-query.html

  
New tests
---------

  New tests have been introduced between XEIGT_9032_FULL and XEIGTPW_15607_FULL:

### New IGT tests (6) ###

  * igt@xe_pm@auto-link-downgrade-capable-show:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_pm@auto-link-downgrade-status-show:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.04, 0.05] s

  * igt@xe_pm@lb-fan-control-version-show:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_pm@lb-voltage-regulator-version-show:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.04, 0.06] s

  * igt@xe_pm@vram-d3cold-threshold-show:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_pm@vram-d3cold-threshold-store:
    - Statuses : 2 skip(s)
    - Exec time: [0.03, 0.04] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_15607_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@unaligned-read:
    - shard-bmg:          [PASS][151] -> [SKIP][152] ([Intel XE#2134])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-10/igt@fbdev@unaligned-read.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@fbdev@unaligned-read.html

  * igt@fbdev@write:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#2134])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@fbdev@write.html

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          [PASS][154] -> [SKIP][155] ([Intel XE#5177]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-10/igt@intel_hwmon@hwmon-read.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@intel_hwmon@hwmon-read.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#2327])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-9/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#2328] / [Intel XE#7367])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#610] / [Intel XE#7387])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#1124])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#367])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#2887]) +4 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#7358])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#2252]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][164] ([Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-6/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#2390] / [Intel XE#6974])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#6974])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#2320]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#1340] / [Intel XE#7435])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#8265]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#4156] / [Intel XE#7425])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#2375])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [PASS][172] -> [FAIL][173] ([Intel XE#3098]) +1 other test fail
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@kms_flip@2x-blocking-wf_vblank.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [PASS][174] -> [FAIL][175] ([Intel XE#301])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][176] -> [FAIL][177] ([Intel XE#301] / [Intel XE#3149])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][178] ([Intel XE#2311]) +22 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][179] ([Intel XE#7061]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#4141]) +4 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][181] ([Intel XE#2313]) +16 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-6/igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#6911] / [Intel XE#7378])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#6912] / [Intel XE#7375])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#7283]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-3/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][185] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][186] ([Intel XE#7794])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#2499])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-8/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          NOTRUN -> [SKIP][188] ([Intel XE#6814] / [Intel XE#7428])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-5/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#1489])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][190] ([Intel XE#2387] / [Intel XE#7429])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][191] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-10/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][192] ([Intel XE#2413])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][193] ([Intel XE#1499])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-4/igt@kms_vrr@flip-dpms.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][194] -> [INCOMPLETE][195] ([Intel XE#6321] / [Intel XE#8355])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-external-multi-queue-cm:
    - shard-bmg:          NOTRUN -> [SKIP][196] ([Intel XE#8370])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-1/igt@xe_evict@evict-small-external-multi-queue-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][197] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][198] ([Intel XE#8374]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-4/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-basic:
    - shard-bmg:          NOTRUN -> [SKIP][199] ([Intel XE#8364]) +5 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-4/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-basic.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][200] ([Intel XE#8378])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          NOTRUN -> [SKIP][201] ([Intel XE#6281] / [Intel XE#7426])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-8/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-bmg:          [PASS][202] -> [ABORT][203] ([Intel XE#8007]) +1 other test abort
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [PASS][204] -> [SKIP][205] ([Intel XE#2229])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-10/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_multigpu_svm@mgpu-migration-basic:
    - shard-bmg:          NOTRUN -> [SKIP][206] ([Intel XE#6964])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-6/igt@xe_multigpu_svm@mgpu-migration-basic.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-bmg:          NOTRUN -> [SKIP][207] ([Intel XE#7599])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-3/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-bmg:          NOTRUN -> [SKIP][208] ([Intel XE#4733] / [Intel XE#7417])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-bmg:          NOTRUN -> [SKIP][209] ([Intel XE#944])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-1/igt@xe_query@multigpu-query-pxp-status.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [PASS][210] -> [FAIL][211] ([Intel XE#6569]) +1 other test fail
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-9/igt@xe_sriov_flr@flr-twice.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-2/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          NOTRUN -> [FAIL][212] ([Intel XE#6569])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-3/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][213] ([Intel XE#7571]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [FAIL][215] ([Intel XE#3098]) -> [PASS][216] +1 other test pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-2/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][217] ([Intel XE#301]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][219] ([Intel XE#2029] / [Intel XE#7395]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [ABORT][221] ([Intel XE#8007]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][223] ([Intel XE#301]) -> [FAIL][224] ([Intel XE#301] / [Intel XE#3149])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321
  [Intel XE#7323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7384]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
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
  [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_9032 -> IGTPW_15607
  * Linux: xe-5499-5df28e621a86e501b09902fdf816f8c02a162794 -> xe-5505-323e76383def977e17ead23f81927ac5a297a18d

  IGTPW_15607: 51836fc8fca686033fcab146e118ba8dc0557872 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9032: 9032
  xe-5499-5df28e621a86e501b09902fdf816f8c02a162794: 5df28e621a86e501b09902fdf816f8c02a162794
  xe-5505-323e76383def977e17ead23f81927ac5a297a18d: 323e76383def977e17ead23f81927ac5a297a18d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/index.html

--===============7952236970675403193==
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
<tr><td><b>Series:</b></td><td>tests/xe_pm: add coverage for xe_device_sysfs Modify xe_pm subtests to exercise the following xe_device_sysfs.c functions:</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171252/">https://patchwork.freedesktop.org/series/171252/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9032_FULL -&gt; XEIGTPW_15607_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15607_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15607_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15607_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@many-free-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@xe_exec_system_allocator@many-free-race-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_exec_system_allocator@many-free-race-nomemset.html">SKIP</a> +913 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset.html">SKIP</a> +114 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_module_load@reload-no-display.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_pm@vram-d3cold-threshold-show} (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-lnl-6/igt@xe_pm@vram-d3cold-threshold-show.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-10/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-1/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-8/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_content_protection@content-type-change.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-9/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@kms_content_protection@suspend-resume.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_content_protection@suspend-resume.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-7/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">Intel XE#8680</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_fbcon_fbt@psr.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-5/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> +84 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-framegap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-framegap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-framegap.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-7/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927">Intel XE#6927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_psr@psr2-primary-render.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-10/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695">Intel XE#8695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-2/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_vrr@flip-suspend.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-10/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444">Intel XE#7444</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@kms_vrr@lobf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-5/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-10/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350">Intel XE#7350</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@xe_evict@evict-small-multi-queue-priority-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority-cm.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578">Intel XE#8578</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_exec_fault_mode@atomic-many.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html">SKIP</a> +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html">SKIP</a> +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-1/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321">Intel XE#7321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453">Intel XE#7453</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_media_fill@media-fill.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323">Intel XE#7323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384">Intel XE#7384</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_mmap@small-bar.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-5/igt@xe_page_reclaim@basic-mixed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_page_reclaim@basic-mixed.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-reset-compare:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-2/igt@xe_pat@pat-sw-hw-reset-compare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_pat@pat-sw-hw-reset-compare.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-on:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-8/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_pm@d3cold-i2c.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-5/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_pm@d3cold-mocs.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-5/igt@xe_prefetch_fault@prefetch-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_prefetch_fault@prefetch-fault.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-10/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_9032_FULL and XEIGTPW_15607_FULL:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@xe_pm@auto-link-downgrade-capable-show:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@auto-link-downgrade-status-show:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.04, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@lb-fan-control-version-show:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@lb-voltage-regulator-version-show:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.04, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold-show:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold-store:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15607_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-10/igt@fbdev@unaligned-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-10/igt@intel_hwmon@hwmon-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177">Intel XE#5177</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-9/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-6/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435">Intel XE#7435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-6/igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-3/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-8/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-8/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-5/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814">Intel XE#6814</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428">Intel XE#7428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-10/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-4/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-1/igt@xe_evict@evict-small-external-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-4/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-4/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-8/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426">Intel XE#7426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-10/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-6/igt@xe_multigpu_svm@mgpu-migration-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-3/igt@xe_prefetch_fault@prefetch-fault-svm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-1/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-9/igt@xe_sriov_flr@flr-twice.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-2/igt@xe_sriov_flr@flr-twice.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-3/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-3/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-2/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395">Intel XE#7395</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_flip@flip-vs-expired-vblank-interruptible:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9032/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15607/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9032 -&gt; IGTPW_15607</li>
<li>Linux: xe-5499-5df28e621a86e501b09902fdf816f8c02a162794 -&gt; xe-5505-323e76383def977e17ead23f81927ac5a297a18d</li>
</ul>
<p>IGTPW_15607: 51836fc8fca686033fcab146e118ba8dc0557872 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9032: 9032<br />
  xe-5499-5df28e621a86e501b09902fdf816f8c02a162794: 5df28e621a86e501b09902fdf816f8c02a162794<br />
  xe-5505-323e76383def977e17ead23f81927ac5a297a18d: 323e76383def977e17ead23f81927ac5a297a18d</p>

</body>
</html>

--===============7952236970675403193==--
