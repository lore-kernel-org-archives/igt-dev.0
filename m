Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31A6C982DA
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 13:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC7A10F362;
	Fri, 18 Sep 2026 13:05:11 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600F210F34E;
 Fri, 18 Sep 2026 13:04:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5240175986267805232=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/xe=5Fexec=5Fsystem?=
 =?utf-8?q?=5Fallocator=3A_skip_huge-page_multi-process_tests_when_memory_is?=
 =?utf-8?q?_low?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jia Yao" <jia.yao@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 18 Sep 2026 13:04:23 -0000
Message-ID: <178973666338.182123.7485299229353568345@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260917230748.1825181-1-jia.yao@intel.com>
In-Reply-To: <20260917230748.1825181-1-jia.yao@intel.com>
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

--===============5240175986267805232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_exec_system_allocator: skip huge-page multi-process tests when memory is low
URL   : https://patchwork.freedesktop.org/series/174462/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9100_FULL -> XEIGTPW_15862_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15862_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15862_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15862_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15862_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#3718] / [Intel XE#7265])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#7265])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2327])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1407])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-2/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1428] / [Intel XE#7387])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +7 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#367])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2652]) +7 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#2887]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2887]) +8 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-9/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#3432])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#3432]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2325] / [Intel XE#7358])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2252]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#373]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2390] / [Intel XE#6974])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#7642])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-5/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2320])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2321] / [Intel XE#7355])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#4354] / [Intel XE#5870])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#8265]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#8265])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-1/igt@kms_dsc@dsc-with-bpc-formats-bigjoiner.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1421])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#7178] / [Intel XE#7349])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#7178] / [Intel XE#7351])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2311]) +33 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#7905]) +9 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-7/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#4141]) +6 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#6312] / [Intel XE#651]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#6312]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#7399])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-indfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#7865]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-4/igt@kms_frontbuffer_tracking@fbchdr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#656] / [Intel XE#7905]) +9 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#7061]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2350] / [Intel XE#7503])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-6/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2313]) +24 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#6901])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-7/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#6911] / [Intel XE#7378])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#8303]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#7283]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-3/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [PASS][48] -> [INCOMPLETE][49] ([Intel XE#1035]) +1 other test incomplete
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-7/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2393])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-3/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#4596] / [Intel XE#5854])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc3co-vpb-framegap:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-framegap.html

  * igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#8396]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#1489]) +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#2893] / [Intel XE#7304])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1406]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-6/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1406] / [Intel XE#7345])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@fbc-psr2-primary-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html

  * igt@kms_psr@psr2-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-4/igt@kms_psr@psr2-primary-blt.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2330] / [Intel XE#5813]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2413])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#6503]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1499] / [Intel XE#9271])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@runner@aborted:
    - shard-lnl:          NOTRUN -> [FAIL][67] ([Intel XE#8990])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-4/igt@runner@aborted.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][69] -> [INCOMPLETE][70] ([Intel XE#6321] / [Intel XE#8355])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#8370]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-6/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#7482]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-3/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-3/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@once-multi-queue-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#8374]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-7/igt@xe_exec_fault_mode@once-multi-queue-rebind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#8374]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-basic-smem:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#8364]) +6 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-basic-smem.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#8364]) +11 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic.html

  * igt@xe_exec_reset@multi-queue-cancel:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#8369])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@xe_exec_reset@multi-queue-cancel.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset:
    - shard-lnl:          [PASS][79] -> [FAIL][80] ([Intel XE#8058])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-lnl:          [PASS][81] -> [FAIL][82] ([Intel XE#9096] / [Intel XE#9297])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-lnl-8/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-2/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#8378]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-6/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#8378]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-bmg:          [PASS][85] -> [ABORT][86] ([Intel XE#8007])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#2229])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-6/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#6964]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-1/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  * igt@xe_multigpu_svm@mgpu-migration-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#6964]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-10/igt@xe_multigpu_svm@mgpu-migration-prefetch.html

  * igt@xe_page_reclaim@many-vma-same-bo:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#7793]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-7/igt@xe_page_reclaim@many-vma-same-bo.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2236] / [Intel XE#7590])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          [PASS][92] -> [INCOMPLETE][93] ([Intel XE#8175])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-2/igt@xe_pm@s3-multiple-execs.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-6/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#4733] / [Intel XE#7417])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#944])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-2/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#4130] / [Intel XE#7366])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-6/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [PASS][97] -> [FAIL][98] ([Intel XE#6569])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-2/igt@xe_sriov_flr@flr-vfs-parallel.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-3/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][99] ([Intel XE#8963])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-bmg:          [INCOMPLETE][100] ([Intel XE#8587]) -> [PASS][101] +1 other test pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-3/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [FAIL][102] ([Intel XE#8628]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-lnl-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][104] ([Intel XE#2049] / [Intel XE#2597] / [Intel XE#8155]) -> [PASS][105] +1 other test pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][106] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][108] ([Intel XE#8399]) -> [PASS][109] +1 other test pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-bmg:          [SKIP][110] ([Intel XE#8710]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_pm_rpm@basic-rte.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-2/igt@kms_pm_rpm@basic-rte.html

  * igt@xe_exec_reset@gt-stress-reset-memory-pressure:
    - {shard-ptl}:        [DMESG-WARN][112] ([Intel XE#8652]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-ptl-5/igt@xe_exec_reset@gt-stress-reset-memory-pressure.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-ptl-2/igt@xe_exec_reset@gt-stress-reset-memory-pressure.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-race:
    - shard-lnl:          [ABORT][114] ([Intel XE#8007]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-lnl-3/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-race.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-3/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-race.html

  * igt@xe_intel_bb@intel-bb-blit-x:
    - shard-bmg:          [SKIP][116] ([Intel XE#8589]) -> [PASS][117] +87 other tests pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@xe_intel_bb@intel-bb-blit-x.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-5/igt@xe_intel_bb@intel-bb-blit-x.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][118] ([Intel XE#8589]) -> [SKIP][119] ([Intel XE#7059] / [Intel XE#7085])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [SKIP][120] ([Intel XE#8589]) -> [SKIP][121] ([Intel XE#1124]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-bmg:          [SKIP][122] ([Intel XE#8589]) -> [SKIP][123] ([Intel XE#7679])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][124] ([Intel XE#8589]) -> [SKIP][125] ([Intel XE#2652])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][126] ([Intel XE#8589]) -> [SKIP][127] ([Intel XE#2887])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-bmg:          [SKIP][128] ([Intel XE#8589]) -> [SKIP][129] ([Intel XE#2252]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-read.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          [SKIP][130] ([Intel XE#8589]) -> [SKIP][131] ([Intel XE#2320])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][132] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][133] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          [SKIP][134] ([Intel XE#8589]) -> [SKIP][135] ([Intel XE#2286] / [Intel XE#6035])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-with-formats-ultrajoiner:
    - shard-bmg:          [SKIP][136] ([Intel XE#8589]) -> [SKIP][137] ([Intel XE#8265])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_dsc@dsc-with-formats-ultrajoiner.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-3/igt@kms_dsc@dsc-with-formats-ultrajoiner.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][138] ([Intel XE#8589]) -> [SKIP][139] ([Intel XE#2374] / [Intel XE#6128])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_feature_discovery@psr2.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][140] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][141] ([Intel XE#301])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-blt:
    - shard-bmg:          [FAIL][142] ([Intel XE#9298]) -> [SKIP][143] ([Intel XE#2311])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-blt.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][144] ([Intel XE#8589]) -> [SKIP][145] ([Intel XE#2311]) +6 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][146] ([Intel XE#8589]) -> [SKIP][147] ([Intel XE#7061])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-3/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][148] ([Intel XE#8589]) -> [SKIP][149] ([Intel XE#2313]) +6 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-pgflip-blt.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][150] ([Intel XE#3544]) -> [SKIP][151] ([Intel XE#3374] / [Intel XE#3544])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-bmg:          [SKIP][152] ([Intel XE#8589]) -> [SKIP][153] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_psr@psr2-primary-page-flip.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-9/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_sharpness_filter@filter-scaler-upscale:
    - shard-bmg:          [SKIP][154] ([Intel XE#8589]) -> [SKIP][155] ([Intel XE#6503])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_sharpness_filter@filter-scaler-upscale.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-4/igt@kms_sharpness_filter@filter-scaler-upscale.html

  * igt@sriov_basic@pf-unbind-with-vf-probed:
    - shard-bmg:          [ABORT][156] ([Intel XE#8868]) -> [ABORT][157] ([Intel XE#8007] / [Intel XE#8868])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-8/igt@sriov_basic@pf-unbind-with-vf-probed.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-10/igt@sriov_basic@pf-unbind-with-vf-probed.html

  * igt@xe_cw_post_sync@walker-post-sync:
    - shard-bmg:          [SKIP][158] ([Intel XE#8589]) -> [SKIP][159] ([Intel XE#8608])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@xe_cw_post_sync@walker-post-sync.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-9/igt@xe_cw_post_sync@walker-post-sync.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          [SKIP][160] ([Intel XE#8589]) -> [SKIP][161] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-7/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@once-multi-queue-prefetch:
    - shard-bmg:          [SKIP][162] ([Intel XE#8589]) -> [SKIP][163] ([Intel XE#8374])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-queue-prefetch.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-prefetch.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-priority:
    - shard-bmg:          [SKIP][164] ([Intel XE#8589]) -> [SKIP][165] ([Intel XE#8364]) +6 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-priority.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-3/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-priority.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5823]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
  [Intel XE#5878]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5878
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917
  [Intel XE#5946]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5946
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
  [Intel XE#6144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144
  [Intel XE#6174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6918]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8058]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8058
  [Intel XE#8155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155
  [Intel XE#8175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8587]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8587
  [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
  [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
  [Intel XE#8628]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8628
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#8710]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#8990]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8990
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9297
  [Intel XE#9298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9298
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_9100 -> IGTPW_15862
  * Linux: xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb -> xe-5775-988199b4d1624a97ec2daa85bc5feb15a4166347

  IGTPW_15862: 5d6467786102c0b39887405f779ca5a8cd87931c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9100: 80e998fdbe300b1ca29901099f35316bd83781e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb: 1687195a722fb2a8bfa0af9b739a0485034fefcb
  xe-5775-988199b4d1624a97ec2daa85bc5feb15a4166347: 988199b4d1624a97ec2daa85bc5feb15a4166347

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/index.html

--===============5240175986267805232==
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
<tr><td><b>Series:</b></td><td>tests/xe_exec_system_allocator: skip huge-page multi-process tests when memory is low</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174462/">https://patchwork.freedesktop.org/series/174462/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9100_FULL -&gt; XEIGTPW_15862_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15862_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15862_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15862_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15862_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265">Intel XE#7265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265">Intel XE#7265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-2/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-9/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-5/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870">Intel XE#5870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-1/igt@kms_dsc@dsc-with-bpc-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-7/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-indfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-4/igt@kms_frontbuffer_tracking@fbchdr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-6/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503">Intel XE#7503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-7/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-3/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-7/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-3/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-framegap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-framegap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-6/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-4/igt@kms_psr@psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-4/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8990">Intel XE#8990</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350">Intel XE#7350</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-6/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-3/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-3/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-7/igt@xe_exec_fault_mode@once-multi-queue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-basic-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cancel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@xe_exec_reset@multi-queue-cancel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8058">Intel XE#8058</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-lnl-8/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-2/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9297">Intel XE#9297</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-6/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-6/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-1/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-10/igt@xe_multigpu_svm@mgpu-migration-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@many-vma-same-bo:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-7/igt@xe_page_reclaim@many-vma-same-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-2/igt@xe_pm@s3-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-6/igt@xe_pm@s3-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175">Intel XE#8175</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-2/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-6/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-2/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-3/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8587">Intel XE#8587</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-3/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-lnl-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8628">Intel XE#8628</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155">Intel XE#8155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710">Intel XE#8710</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-2/igt@kms_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-memory-pressure:</p>
<ul>
<li>{shard-ptl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-ptl-5/igt@xe_exec_reset@gt-stress-reset-memory-pressure.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-ptl-2/igt@xe_exec_reset@gt-stress-reset-memory-pressure.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-lnl-3/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-3/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@xe_intel_bb@intel-bb-blit-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-5/igt@xe_intel_bb@intel-bb-blit-x.html">PASS</a> +87 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-ultrajoiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_dsc@dsc-with-formats-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-3/igt@kms_dsc@dsc-with-formats-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128">Intel XE#6128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9298">Intel XE#9298</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-3/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_psr@psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-9/igt@kms_psr@psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-upscale:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@kms_sharpness_filter@filter-scaler-upscale.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-4/igt@kms_sharpness_filter@filter-scaler-upscale.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vf-probed:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-8/igt@sriov_basic@pf-unbind-with-vf-probed.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-10/igt@sriov_basic@pf-unbind-with-vf-probed.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_cw_post_sync@walker-post-sync:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@xe_cw_post_sync@walker-post-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-9/igt@xe_cw_post_sync@walker-post-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608">Intel XE#8608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-7/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-queue-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9100/shard-bmg-5/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-bmg-3/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9100 -&gt; IGTPW_15862</li>
<li>Linux: xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb -&gt; xe-5775-988199b4d1624a97ec2daa85bc5feb15a4166347</li>
</ul>
<p>IGTPW_15862: 5d6467786102c0b39887405f779ca5a8cd87931c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9100: 80e998fdbe300b1ca29901099f35316bd83781e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb: 1687195a722fb2a8bfa0af9b739a0485034fefcb<br />
  xe-5775-988199b4d1624a97ec2daa85bc5feb15a4166347: 988199b4d1624a97ec2daa85bc5feb15a4166347</p>

</body>
</html>

--===============5240175986267805232==--
