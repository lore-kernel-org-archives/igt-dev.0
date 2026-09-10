Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D95C79FB7
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 05:38:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326A010E244;
	Thu, 10 Sep 2026 05:38:20 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E059110E260;
 Thu, 10 Sep 2026 05:37:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2488714097603949068=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_lib/igt=5Fcore=3A_Make_bui?=
 =?utf-8?q?ld_reproducible?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 10 Sep 2026 05:37:33 -0000
Message-ID: <178901865390.145374.9498457842510032918@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260909133320.71100-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260909133320.71100-1-kamil.konieczny@linux.intel.com>
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

--===============2488714097603949068==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_core: Make build reproducible
URL   : https://patchwork.freedesktop.org/series/173723/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9088_FULL -> XEIGTPW_15815_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15815_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15815_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15815_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority@numvfs-random-gt1-vcs0:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-6/igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority@numvfs-random-gt1-vcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority@numvfs-random-gt1-vcs0.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15815_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2328] / [Intel XE#7367])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124]) +4 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1124])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#7679])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-9/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#367]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#8365])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +4 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#2669] / [Intel XE#7389]) +8 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#2887])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#3432])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#9204] / [Intel XE#9219]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_cdclk@plane-scaling.html
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2724] / [Intel XE#7449])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-8/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#9219]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_cdclk@plane-scaling@pipe-b-edp-1.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#7358])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-7/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7358])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2252]) +4 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-10/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#6974])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][21] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-3/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7642])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-8/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2320]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2286] / [Intel XE#6035])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#4210] / [Intel XE#7467])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-basic:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#8265]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#8265])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#4156] / [Intel XE#7425])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@display-4x:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1138] / [Intel XE#7344])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_feature_discovery@display-4x.html
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#1138] / [Intel XE#7344])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-2/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1421]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-3/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#7178] / [Intel XE#7351])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#656] / [Intel XE#7905]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#4141]) +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-stridechange:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#6312] / [Intel XE#651])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2311]) +31 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7061]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#6312]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#7865]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2313]) +34 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#7905]) +7 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#6901])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#8303]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-1/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#7283]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_pm_dc@dc3co-vpb-framegap:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-framegap.html

  * igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#8396]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          NOTRUN -> [FAIL][51] ([Intel XE#8399])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][52] -> [FAIL][53] ([Intel XE#8399])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#1489]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-9/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#4608]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#4608] / [Intel XE#7304]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-5/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1406] / [Intel XE#7345])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-render@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-render@edp-1.html

  * igt@kms_psr@pr-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1406]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-7/igt@kms_psr@pr-sprite-render.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#3904] / [Intel XE#7342])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-9/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#1435] / [Intel XE#8695])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#6503]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#1499])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-4/igt@kms_vrr@max-min.html

  * igt@xe_evict@evict-mixed-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#6540] / [Intel XE#688])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_exec_balancer@twice-cm-parallel-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#7482]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@xe_exec_balancer@twice-cm-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1392])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#8374]) +7 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#8374]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@many-queues-close-fd-smem:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#8364]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-7/igt@xe_exec_multi_queue@many-queues-close-fd-smem.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#8364]) +17 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#8369]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-4/igt@xe_exec_reset@cm-multi-queue-cat-error.html
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#8369])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#8378]) +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#8378]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][78] -> [ABORT][79] ([Intel XE#8007])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_madvise@atomic-cpu:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#7980])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@xe_madvise@atomic-cpu.html

  * igt@xe_multigpu_svm@mgpu-coherency-basic:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#6964])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-5/igt@xe_multigpu_svm@mgpu-coherency-basic.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#7793])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-4/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#5694] / [Intel XE#7370])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-2/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#4733] / [Intel XE#7417])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-5/igt@xe_pxp@pxp-optout.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#944]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-9/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random:
    - shard-bmg:          [PASS][86] -> [FAIL][87] ([Intel XE#7992]) +3 other tests fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-3/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-8/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [PASS][88] -> [FAIL][89] ([Intel XE#6569])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-6/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          NOTRUN -> [FAIL][90] ([Intel XE#6569])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-4/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - shard-lnl:          [SKIP][91] ([Intel XE#2134]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@fbdev@read.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@fbdev@read.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [FAIL][93] ([Intel XE#8583]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-9/igt@intel_hwmon@hwmon-write.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-2/igt@intel_hwmon@hwmon-write.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][95] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][96] +1 other test pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_color@ctm-0-75:
    - shard-lnl:          [SKIP][97] ([Intel XE#3297]) -> [PASS][98] +2 other tests pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_color@ctm-0-75.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-3/igt@kms_color@ctm-0-75.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-lnl:          [SKIP][99] ([Intel XE#7006]) -> [PASS][100] +2 other tests pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][101] ([Intel XE#7809]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-lnl:          [SKIP][103] ([Intel XE#9127]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_fbcon_fbt@fbc.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@psr1:
    - shard-lnl:          [SKIP][105] ([Intel XE#1135]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_feature_discovery@psr1.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][107] ([Intel XE#301]) -> [PASS][108] +1 other test pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-lnl:          [SKIP][109] ([Intel XE#2482]) -> [PASS][110] +10 other tests pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-3/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          [SKIP][111] ([Intel XE#1745] / [Intel XE#9144]) -> [PASS][112] +2 other tests pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-lnl:          [SKIP][113] ([Intel XE#2682]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_flip_tiling@flip-change-tiling.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-lnl:          [SKIP][115] ([Intel XE#2548] / [Intel XE#7779]) -> [PASS][116] +20 other tests pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
    - shard-lnl:          [SKIP][117] ([Intel XE#7779]) -> [PASS][118] +1 other test pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][119] ([Intel XE#1503]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_invalid_mode@bad-vtotal:
    - shard-lnl:          [SKIP][121] ([Intel XE#2568]) -> [PASS][122] +2 other tests pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_invalid_mode@bad-vtotal.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_invalid_mode@bad-vtotal.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-bmg:          [ABORT][123] ([Intel XE#9093]) -> [PASS][124] +1 other test pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-6/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-10/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@pixel-format-4-tiled-modifier:
    - shard-lnl:          [SKIP][125] ([Intel XE#7250] / [Intel XE#9128]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-modifier.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-1/igt@kms_plane@pixel-format-4-tiled-modifier.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [SKIP][127] ([Intel XE#9128]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_plane@plane-position-hole.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a:
    - shard-lnl:          [SKIP][129] ([Intel XE#2763] / [Intel XE#6886]) -> [PASS][130] +13 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
    - shard-lnl:          [SKIP][131] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [PASS][132] +13 other tests pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-lnl:          [SKIP][133] ([Intel XE#870]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_pm_backlight@fade-with-suspend.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][135] ([Intel XE#8399]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [SKIP][137] ([Intel XE#7794]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-lnl:          [SKIP][139] ([Intel XE#7106]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_pm_rpm@system-suspend-modeset.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-3/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [SKIP][141] ([Intel XE#4886]) -> [PASS][142] +1 other test pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_pm_rpm@universal-planes.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-3/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-lnl:          [SKIP][143] ([Intel XE#9129]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_properties@plane-properties-legacy.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-7/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-lnl:          [SKIP][145] ([Intel XE#1489]) -> [PASS][146] +2 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-lnl:          [SKIP][147] ([Intel XE#2850] / [Intel XE#929]) -> [PASS][148] +10 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_psr@psr2-sprite-plane-onoff.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_vblank@query-forked:
    - shard-lnl:          [SKIP][149] ([Intel XE#9125]) -> [PASS][150] +64 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_vblank@query-forked.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_vblank@query-forked.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][151] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          [ABORT][153] ([Intel XE#7774]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-3/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-1/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@rcs0:
    - shard-bmg:          [ABORT][155] ([Intel XE#9206]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-3/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@rcs0.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-1/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@rcs0.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs0:
    - shard-bmg:          [DMESG-FAIL][157] ([Intel XE#7774]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-3/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs0.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-1/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs0.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs1:
    - shard-bmg:          [INCOMPLETE][159] ([Intel XE#7774] / [Intel XE#8654]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-3/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs1.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-1/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs1.html

  * igt@xe_exec_reset@gt-stress-reset-rapid-cycle:
    - shard-lnl:          [INCOMPLETE][161] ([Intel XE#8652]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-3/igt@xe_exec_reset@gt-stress-reset-rapid-cycle.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-3/igt@xe_exec_reset@gt-stress-reset-rapid-cycle.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free-race:
    - shard-bmg:          [FAIL][163] ([Intel XE#9115]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-3/igt@xe_exec_system_allocator@process-many-stride-mmap-free-race.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-9/igt@xe_exec_system_allocator@process-many-stride-mmap-free-race.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [SKIP][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190]) ([Intel XE#378] / [Intel XE#7405]) -> ([PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-4/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-1/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-1/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-1/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-7/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-1/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-3/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-8/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-3/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-7/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-7/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-2/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-8/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-8/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-2/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-2/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-2/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-4/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-4/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-4/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-3/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-3/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-1/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-7/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-3/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-1/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-1/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-1/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-7/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-7/igt@xe_module_load@load.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-lnl:          [SKIP][213] ([Intel XE#7590] / [Intel XE#9125]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@xe_pat@display-vs-wb-transient.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [FAIL][215] ([Intel XE#6569]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [SKIP][217] ([Intel XE#9125]) -> [SKIP][218] ([Intel XE#3658] / [Intel XE#7360])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-lnl:          [SKIP][219] ([Intel XE#9125]) -> [SKIP][220] ([Intel XE#1407]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][221] ([Intel XE#9125]) -> [SKIP][222] ([Intel XE#7059] / [Intel XE#7085]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-lnl:          [SKIP][223] ([Intel XE#9125]) -> [SKIP][224] ([Intel XE#1124]) +14 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
    - shard-lnl:          [SKIP][225] ([Intel XE#9125]) -> [SKIP][226] ([Intel XE#7679]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
    - shard-lnl:          [SKIP][227] ([Intel XE#9125]) -> [SKIP][228] ([Intel XE#8365]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
    - shard-lnl:          [SKIP][229] ([Intel XE#9125]) -> [SKIP][230] ([Intel XE#367]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-lnl:          [SKIP][231] ([Intel XE#9125]) -> [SKIP][232] ([Intel XE#3432]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-lnl:          [SKIP][233] ([Intel XE#9125]) -> [SKIP][234] ([Intel XE#2887]) +17 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][235] ([Intel XE#9125]) -> [SKIP][236] ([Intel XE#2669] / [Intel XE#7389]) +2 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-lnl:          [SKIP][237] ([Intel XE#9125]) -> [SKIP][238] ([Intel XE#7008])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_cdclk@mode-transition-all-outputs.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-lnl:          [SKIP][239] ([Intel XE#9125]) -> [SKIP][240] ([Intel XE#6974]) +2 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          [SKIP][241] ([Intel XE#9125]) -> [SKIP][242] ([Intel XE#1468] / [Intel XE#7396])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_content_protection@mei-interface.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-lnl:          [SKIP][243] ([Intel XE#9125]) -> [SKIP][244] ([Intel XE#7642]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_content_protection@type1.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          [SKIP][245] ([Intel XE#9125]) -> [SKIP][246] ([Intel XE#1424]) +5 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-lnl:          [SKIP][247] ([Intel XE#9125]) -> [SKIP][248] ([Intel XE#2321] / [Intel XE#7355])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-lnl:          [SKIP][249] ([Intel XE#9125]) -> [SKIP][250] ([Intel XE#309] / [Intel XE#7343]) +5 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][251] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][252] ([Intel XE#309] / [Intel XE#7343])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-lnl:          [SKIP][253] ([Intel XE#9125]) -> [SKIP][254] ([Intel XE#323] / [Intel XE#6035]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-lnl:          [SKIP][255] ([Intel XE#9125]) -> [SKIP][256] ([Intel XE#4354] / [Intel XE#5882])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_dp_link_training@non-uhbr-mst.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-lnl:          [SKIP][257] ([Intel XE#9125]) -> [SKIP][258] ([Intel XE#8265]) +4 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-lnl:          [SKIP][259] ([Intel XE#1745] / [Intel XE#9144]) -> [SKIP][260] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-lnl:          [SKIP][261] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][262] ([Intel XE#6312] / [Intel XE#651]) +14 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-onoff:
    - shard-lnl:          [SKIP][263] ([Intel XE#7779]) -> [SKIP][264] ([Intel XE#6312]) +20 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-onoff.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][265] ([Intel XE#7779]) -> [SKIP][266] ([Intel XE#7905]) +62 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-lnl:          [SKIP][267] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][268] ([Intel XE#1469] / [Intel XE#7399])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-lnl:          [SKIP][269] ([Intel XE#7779]) -> [SKIP][270] ([Intel XE#7399])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
    - shard-lnl:          [SKIP][271] ([Intel XE#7779]) -> [SKIP][272] ([Intel XE#7865]) +36 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:
    - shard-lnl:          [SKIP][273] ([Intel XE#7779]) -> [SKIP][274] ([Intel XE#7061]) +12 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          [SKIP][275] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][276] ([Intel XE#656] / [Intel XE#7905]) +54 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
    - shard-lnl:          [SKIP][277] ([Intel XE#7779]) -> [SKIP][278] ([Intel XE#7061] / [Intel XE#7356]) +5 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][279] ([Intel XE#3544]) -> [SKIP][280] ([Intel XE#3374] / [Intel XE#3544])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-lnl:          [SKIP][281] ([Intel XE#9125]) -> [SKIP][282] ([Intel XE#6912] / [Intel XE#7375])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-lnl:          [SKIP][283] ([Intel XE#9125]) -> [SKIP][284] ([Intel XE#4596] / [Intel XE#5854]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-none.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
    - shard-lnl:          [SKIP][285] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [SKIP][286] ([Intel XE#2763] / [Intel XE#6886]) +5 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          [SKIP][287] ([Intel XE#1489]) -> [SKIP][288] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +2 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][289] ([Intel XE#1489]) -> [SKIP][290] ([Intel XE#2893] / [Intel XE#7304]) +5 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-lnl:          [SKIP][291] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][292] ([Intel XE#1406] / [Intel XE#7345]) +2 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-render.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-lnl:          [SKIP][293] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][294] ([Intel XE#1406]) +3 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_psr@pr-cursor-plane-onoff.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-lnl:          [SKIP][295] ([Intel XE#9125]) -> [SKIP][296] ([Intel XE#1127] / [Intel XE#5813])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-lnl:          [SKIP][297] ([Intel XE#9125]) -> [SKIP][298] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +3 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][299] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][300] ([Intel XE#2426] / [Intel XE#5848])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          [SKIP][301] ([Intel XE#9125]) -> [SKIP][302] ([Intel XE#1499])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-vrr.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_wedged@basic-wedged:
    - shard-lnl:          [ABORT][303] ([Intel XE#8963]) -> [DMESG-WARN][304] ([Intel XE#8963])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-4/igt@xe_wedged@basic-wedged.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-7/igt@xe_wedged@basic-wedged.html
    - shard-bmg:          [ABORT][305] ([Intel XE#8591] / [Intel XE#8963]) -> [DMESG-WARN][306] ([Intel XE#8963])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-5/igt@xe_wedged@basic-wedged.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-3/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2682]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2682
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7008
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7106
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7250]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8583]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583
  [Intel XE#8591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8591
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#8654]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8654
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9093]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9093
  [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115
  [Intel XE#9125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125
  [Intel XE#9127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9127
  [Intel XE#9128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128
  [Intel XE#9129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9129
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#9204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9204
  [Intel XE#9206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9206
  [Intel XE#9219]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9219
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_9088 -> IGTPW_15815
  * Linux: xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada -> xe-5715-0d30bc4f35590b6353a77f23e397ab2168b69673

  IGTPW_15815: 15815
  IGT_9088: 55a88d20e327d5c440cd3f3d661684fb83f29027 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada: dd822035c9dcd89e47cbfa75da6f3119617fbada
  xe-5715-0d30bc4f35590b6353a77f23e397ab2168b69673: 0d30bc4f35590b6353a77f23e397ab2168b69673

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/index.html

--===============2488714097603949068==
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
<tr><td><b>Series:</b></td><td>lib/igt_core: Make build reproducible</td></=
tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/173723/">https://patchwork.freedesktop.org/series/173723/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15815/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15815/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9088_FULL -&gt; XEIGTPW_15815_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15815_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_15815_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15=
815_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority@numvfs-ra=
ndom-gt1-vcs0:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-bmg-6/igt@xe_sriov_scheduling@nonpreempt-engine-resets-low=
-priority@numvfs-random-gt1-vcs0.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-8/igt@xe_sriov_schedu=
ling@nonpreempt-engine-resets-low-priority@numvfs-random-gt1-vcs0.html">FAI=
L</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15815_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
8">Intel XE#2328</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-9/igt@kms_bw@connected-linear-tiling-3=
-displays-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-=
target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-=
target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-=
dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_ccs@crc-primary-basic-4-tile=
d-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +8 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_ccs@crc-primary-basic-4-tile=
d-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_cdclk@plane-scaling.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9204=
">Intel XE#9204</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9219">Intel XE#9219</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-8/igt@kms_cdclk@plane-scaling.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724=
">Intel XE#2724</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_cdclk@plane-scaling@pipe-b-e=
dp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9219">Intel XE#9219</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-7/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-post-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-4/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-post-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-10/igt@kms_chamelium_hpd@hdmi-hpd-afte=
r-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-2/igt@kms_content_protection@dp-mst-ty=
pe-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-3/igt@kms_content_protection@lic-type-=
0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a=
>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-8/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-2=
56x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-6/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4210">Intel XE#4210</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7467">Intel XE#7467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_dsc@dsc-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Inte=
l XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-with-=
bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Inte=
l XE#4156</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1138">Intel XE#1138</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-2/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1138">Intel XE#1138</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-3/igt@kms_flip@2x-nonexisting-fb-inter=
ruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-l=
inear-to-16bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#13=
97</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/738=
5">Intel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/9144">Intel XE#9144</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +2=
 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-stridechange:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs=
-stridechange.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-=
wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs=
hdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +31 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs=
hdr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs=
hdr-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-=
abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-arg=
b161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-=
1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +34 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_frontbuffer_tracking@psrhdr-=
2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-1/igt@kms_plane@pixel-format-4-tiled-m=
odifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-m=
tl-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-framegap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-framegap.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-framegap@psr=
2-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Int=
el XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@k=
ms_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8399">Intel XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress-n=
o-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-9/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-pri=
mary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-5/igt@kms_psr@fbc-psr-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234=
">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plane-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-render@e=
dp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-7/igt@kms_psr@pr-sprite-render.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-9/igt@kms_rotation_crc@primary-rotatio=
n-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-1/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1435">Intel XE#1435</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8695">Intel XE#8695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-2/igt@kms_sharpness_filter@invalid-fil=
ter-with-plane.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-4/igt@kms_vrr@max-min.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel =
XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@xe_evict@evict-mixed-threads-sma=
ll.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@xe_exec_balancer@twice-cm-parall=
el-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7482">Intel XE#7482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-b=
indexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) =
+4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-7/igt@xe_exec_basic@multigpu-once-bind=
execqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-qu=
eue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@xe_exec_fault_mode@twice-multi-q=
ueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-close-fd-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-7/igt@xe_exec_multi_queue@many-queues-=
close-fd-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8364">Intel XE#8364</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-pr=
eempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +17 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-4/igt@xe_exec_reset@cm-multi-queue-cat=
-error.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8369">Intel XE#8369</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@xe_exec_reset@cm-multi-queue-cat=
-error.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-3/igt@xe_exec_threads@threads-multi-qu=
eue-cm-fd-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@xe_exec_threads@threads-multi-qu=
eue-fd-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-x=
e_ggtt_init_early.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15815/shard-bmg-3/igt@xe_fault_injection@inject-faul=
t-probe-function-xe_ggtt_init_early.html">ABORT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-cpu:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@xe_madvise@atomic-cpu.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980">=
Intel XE#7980</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-5/igt@xe_multigpu_svm@mgpu-coherency-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-4/igt@xe_page_reclaim@basic-mixed.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-2/igt@xe_pm@d3cold-i2c.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel=
 XE#5694</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-5/igt@xe_pxp@pxp-optout.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Inte=
l XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-9/igt@xe_query@multigpu-query-mem-usag=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-bmg-3/igt@xe_sriov_auto_provisioning@exclusive-ranges@numv=
fs-random.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15815/shard-bmg-8/igt@xe_sriov_auto_provisioning@exclusive-r=
anges@numvfs-random.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7992">Intel XE#7992</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-=
6/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-bmg-4/igt@xe_sriov_flr@flr-vfs-parallel.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6569">Intel XE#6569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@fbdev@read.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/=
igt@fbdev@read.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-bmg-9/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583">Intel XE#8583=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1581=
5/shard-bmg-2/igt@intel_hwmon@hwmon-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7084">Intel XE#7084</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-5/igt@kms_ccs@crc-primar=
y-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_color@ctm-0-75.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shar=
d-lnl-3/igt@kms_color@ctm-0-75.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
006">Intel XE#7006</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15815/shard-lnl-8/igt@kms_color_pipeline@plane-lut1d-post-ctm=
3x4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809=
">Intel XE#7809</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15815/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/9127">Intel XE#9127</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard=
-lnl-2/igt@kms_fbcon_fbt@fbc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#11=
35</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15=
815/shard-lnl-1/igt@kms_feature_discovery@psr1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15815/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/248=
2">Intel XE#2482</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15815/shard-lnl-3/igt@kms_flip@flip-vs-wf_vblank-interruptible.=
html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xt=
ile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1745">Intel XE#1745</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-3/igt@kms_fl=
ip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">PASS</a> +2 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2682">Int=
el XE#2682</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15815/shard-lnl-4/igt@kms_flip_tiling@flip-change-tiling.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-1/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">PASS</a> +20 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-in=
dfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-3/igt@kms_frontbuffer_track=
ing@psr-1p-offscreen-pri-indfb-draw-blt.html">PASS</a> +1 other test pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/sha=
rd-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_invalid_mode@bad-vtotal.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2=
568</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5815/shard-lnl-4/igt@kms_invalid_mode@bad-vtotal.html">PASS</a> +2 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-bmg-6/igt@kms_pipe_crc_basic@suspend-read-crc.html">ABORT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9093">I=
ntel XE#9093</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15815/shard-bmg-10/igt@kms_pipe_crc_basic@suspend-read-crc.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-modifier.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250=
">Intel XE#7250</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9128">Intel XE#9128</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15815/shard-lnl-1/igt@kms_plane@pixel-format-4-til=
ed-modifier.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_plane@plane-position-hole.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Intel XE=
#9128</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15815/shard-lnl-8/igt@kms_plane@plane-position-hole.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with=
-modifiers@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@k=
ms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a.html">PASS=
</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with=
-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel =
XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15815/shard-lnl-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-r=
otation@pipe-c.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Inte=
l XE#870</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15815/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shar=
d-lnl-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard=
-lnl-1/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7106">Inte=
l XE#7106</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15815/shard-lnl-3/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_pm_rpm@universal-planes.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886">Intel XE#4=
886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5815/shard-lnl-3/igt@kms_pm_rpm@universal-planes.html">PASS</a> +1 other te=
st pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_properties@plane-properties-legacy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9129"=
>Intel XE#9129</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15815/shard-lnl-7/igt@kms_properties@plane-properties-legacy.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-are=
a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_psr2_sf@psr2-primary-plane-u=
pdate-sf-dmg-area.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel =
XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_psr@psr2-sprite-plane-onoff.html">=
PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_vblank@query-forked.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1581=
5/shard-lnl-4/igt@kms_vblank@query-forked.html">PASS</a> +64 other tests pa=
ss</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6321">Intel XE#6321</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-7/igt@xe_evict@evict-mixed-=
many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-bmg-3/igt@xe_exec_basic@many-execqueues-many-vm-userptr-re=
bind.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7774">Intel XE#7774</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15815/shard-bmg-1/igt@xe_exec_basic@many-execqueue=
s-many-vm-userptr-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@rcs0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-bmg-3/igt@xe_exec_basic@many-execqueues-many-vm-userptr-re=
bind@rcs0.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/9206">Intel XE#9206</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-1/igt@xe_exec_basic@many-exec=
queues-many-vm-userptr-rebind@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-bmg-3/igt@xe_exec_basic@many-execqueues-many-vm-userptr-re=
bind@vcs0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7774">Intel XE#7774</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-1/igt@xe_exec_basic@many=
-execqueues-many-vm-userptr-rebind@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-bmg-3/igt@xe_exec_basic@many-execqueues-many-vm-userptr-re=
bind@vcs1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7774">Intel XE#7774</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8654">Intel XE#8654</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-1/igt@xe_e=
xec_basic@many-execqueues-many-vm-userptr-rebind@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-rapid-cycle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-3/igt@xe_exec_reset@gt-stress-reset-rapid-cycle.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8652">Intel XE#8652</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15815/shard-lnl-3/igt@xe_exec_reset@gt-stress-reset-rapi=
d-cycle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-bmg-3/igt@xe_exec_system_allocator@process-many-stride-mma=
p-free-race.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/9115">Intel XE#9115</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-9/igt@xe_exec_system_allocat=
or@process-many-stride-mmap-free-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_9088/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_9088/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-1/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_9088/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_9088/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_9088/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-ln=
l-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_9088/shard-lnl-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard=
-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-3/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/sh=
ard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-8/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9=
088/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-2/igt@xe_module_load@l=
oad.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_9088/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-2/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_9088/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_9088/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">I=
ntel XE#7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15815/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15815/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-ln=
l-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815=
/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15815/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15815/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15815/shard-lnl-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard=
-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15=
815/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15815/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15815/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/sh=
ard-lnl-7/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel X=
E#7590</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15815/shard-lnl-4/igt@xe_pat@display-vs-wb-transient.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel =
XE#6569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15815/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-18=
0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-7/igt@kms_big_fb@4-ti=
led-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360"=
>Intel XE#7360</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Inte=
l XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15815/shard-lnl-8/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Inte=
l XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180=
-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_big_fb@linear-max-hw-st=
ride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">I=
ntel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15815/shard-lnl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124=
">Intel XE#1124</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-target=
-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_bw@connected-linea=
r-tiling-3-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target=
-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_bw@connected-linea=
r-tiling-4-displays-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-target-1920x1080=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-=
target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled=
-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-c=
cs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic=
-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125=
">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15815/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2669">Intel XE#2669</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7389">Intel XE#7389</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">=
Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15815/shard-lnl-4/igt@kms_cdclk@mode-transition-all-outputs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/70=
08">Intel XE#7008</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_content_protection@dp-mst-type-0-suspend-res=
ume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_content_protection@dp-mst-=
type-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_content_protection@mei-interface.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">I=
ntel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15815/shard-lnl-4/igt@kms_content_protection@mei-interface.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468=
">Intel XE#1468</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7396">Intel XE#7396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_content_protection@type1.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#=
9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15815/shard-lnl-8/igt@kms_content_protection@type1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-1=
28x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1424">Intel XE#1424</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">=
Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15815/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-512x170.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
21">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15815/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipb=
-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-7/igt@k=
ms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">=
Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-=
toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/323">Intel XE#323</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Inte=
l XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15815/shard-lnl-4/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Inte=
l XE#4354</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5882">Intel XE#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/91=
25">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15815/shard-lnl-8/igt@kms_dsc@dsc-with-output-formats-bigjoine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8265">Intel XE#8265</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-l=
inear-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@k=
ms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">=
Intel XE#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1745">Intel XE#1745</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-3/igt@kms_frontbuffer_tracki=
ng@drrs-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur=
-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-1/igt@kms_frontbuffer_track=
ing@drrshdr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +20 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri=
-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_frontbuffer_tr=
acking@drrshdr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) =
+62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">=
Intel XE#2548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7779">Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-t=
iling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1469">Intel XE#1469</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7779">Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15815/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-t=
iling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-3/igt@kms_frontbuffer_tracki=
ng@fbchdr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +36 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-re=
nder.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7779">Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15815/shard-lnl-2/igt@kms_frontbuffer_tracking@hdr-=
argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +12 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">I=
ntel XE#7905</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-bl=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7779">Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-abg=
r161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3=
544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5815/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">In=
tel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125=
">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15815/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6912">Intel XE#6912</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Inte=
l XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15815/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Inte=
l XE#4596</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5854">Intel XE#5854</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-c:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-dow=
nscale-factor-0-5@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#768=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125=
">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15815/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-factor-0-=
25-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-d=
mg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_15815/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overl=
ay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel X=
E#7304</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15815/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-move-=
continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel X=
E#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15815/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-render.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406=
">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7345">Intel XE#7345</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE=
#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15815/shard-lnl-8/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15815/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-re=
flect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1127">Intel XE#1127</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15815/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-re=
flect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chame=
lium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-7/igt@kms_tiled_displ=
ay@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel X=
E#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15815/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1=
499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-lnl-4/igt@xe_wedged@basic-wedged.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1581=
5/shard-lnl-7/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)=
</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9088/shard-bmg-5/igt@xe_wedged@basic-wedged.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8591">Intel XE#8591=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963"=
>Intel XE#8963</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15815/shard-bmg-3/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Inte=
l XE#8963</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9088 -&gt; IGTPW_15815</li>
<li>Linux: xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada -&gt; xe-5715-0=
d30bc4f35590b6353a77f23e397ab2168b69673</li>
</ul>
<p>IGTPW_15815: 15815<br />
  IGT_9088: 55a88d20e327d5c440cd3f3d661684fb83f29027 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada: dd822035c9dcd89e47cbfa7=
5da6f3119617fbada<br />
  xe-5715-0d30bc4f35590b6353a77f23e397ab2168b69673: 0d30bc4f35590b6353a77f2=
3e397ab2168b69673</p>

</body>
</html>

--===============2488714097603949068==--
