Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BCED711C4
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 22:35:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4703510EBC0;
	Thu, 18 Dec 2025 22:35:29 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9984B10EBBF;
 Thu, 18 Dec 2025 22:35:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0600305389495186133=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Panthor_tests_for_huge_par?=
 =?utf-8?q?tial_unmaps_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 18 Dec 2025 22:35:28 -0000
Message-ID: <176609732861.103426.8321424318566734317@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251217215909.710730-1-adrian.larumbe@collabora.com>
In-Reply-To: <20251217215909.710730-1-adrian.larumbe@collabora.com>
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

--===============0600305389495186133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Panthor tests for huge partial unmaps (rev3)
URL   : https://patchwork.freedesktop.org/series/158975/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8670_FULL -> XEIGTPW_14232_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14232_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14232_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14232_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@core_getversion@basic:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@core_getversion@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@core_getversion@basic.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@core_setmaster@master-drop-set-root.html

  * igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-malloc-race:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-malloc-race.html

  
#### Warnings ####

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][5] ([Intel XE#6703]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@kms_joiner@basic-ultra-joiner.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_14232_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#6779]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@core_hotunplug@hotrebind-lateclose.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [PASS][9] -> [FAIL][10] ([Intel XE#4674])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@unaligned-read:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#2134]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@fbdev@unaligned-read.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@fbdev@unaligned-read.html

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1125])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-3/igt@intel_hwmon@hwmon-read.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#5177] / [Intel XE#6703])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@intel_hwmon@hwmon-write.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1407]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2327])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-8/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#1124]) +4 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#2191]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-2/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#367])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#2887]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2887]) +5 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-7/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2652] / [Intel XE#787]) +11 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#3432]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#3432]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#4416]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#306])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-8/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2325])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#6703]) +169 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2252])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#373]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][33] ([Intel XE#1178])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@srm:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#3278]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2341])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2320])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1424]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-4/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#2321])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#309]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#2291]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#1508])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#4331])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#2244])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-2/igt@kms_dsc@dsc-with-bpc.html
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2244])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fb_coherency@memset-crc@mmap-offset-wc:
    - shard-bmg:          NOTRUN -> [CRASH][46] ([Intel XE#6706])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_fb_coherency@memset-crc@mmap-offset-wc.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#2316]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1421]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2316]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][51] -> [INCOMPLETE][52] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2293]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [FAIL][54] ([Intel XE#3106] / [Intel XE#4683]) +1 other test fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1401]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#656]) +12 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2311]) +7 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#4141]) +5 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#651]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2312])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2313]) +6 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [ABORT][63] ([Intel XE#6740])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-2:
    - shard-bmg:          [PASS][64] -> [ABORT][65] ([Intel XE#6740]) +1 other test abort
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-3/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#6901])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#356])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#599])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-1/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][69] -> [SKIP][70] ([Intel XE#4596])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#5020])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-1/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          [PASS][72] -> [SKIP][73] ([Intel XE#2685] / [Intel XE#3307])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_plane_scaling@intel-max-src-size.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#6886]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#6886]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2392])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1439] / [Intel XE#836])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [PASS][78] -> [SKIP][79] ([Intel XE#6693]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_pm_rpm@drm-resources-equal.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1406] / [Intel XE#2893]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#1406] / [Intel XE#6703]) +6 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1406]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-4/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@kms_psr@fbc-psr-dpms.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#1406] / [Intel XE#2414])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#3414] / [Intel XE#3904])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2413])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1435])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-3/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1091] / [Intel XE#2849])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1447])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_eudebug@basic-vm-access-faultable:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#4837]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-4/igt@xe_eudebug@basic-vm-access-faultable.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#4837]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_eudebug_online@interrupt-all:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@xe_eudebug_online@interrupt-all.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_evict@evict-beng-cm-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#688]) +4 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-8/igt@xe_evict@evict-beng-cm-threads-small.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2322]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#1392]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [PASS][98] -> [SKIP][99] ([Intel XE#6703]) +641 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#6874]) +13 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-8/igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority.html

  * igt@xe_exec_multi_queue@max-queues-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#6874]) +8 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-7/igt@xe_exec_multi_queue@max-queues-basic-smem.html

  * igt@xe_exec_system_allocator@prefetch-sys-benchmark:
    - shard-bmg:          [PASS][102] -> [ABORT][103] ([Intel XE#3970] / [Intel XE#5545])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@xe_exec_system_allocator@prefetch-sys-benchmark.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@xe_exec_system_allocator@prefetch-sys-benchmark.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-eocheck:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#6557] / [Intel XE#6703])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-eocheck.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#4943]) +5 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#4943]) +11 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race:
    - shard-bmg:          [PASS][107] -> [SKIP][108] ([Intel XE#6557] / [Intel XE#6703]) +7 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][109] -> [SKIP][110] ([Intel XE#2229]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@xe_live_ktest@xe_bo.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#2833])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-8/igt@xe_live_ktest@xe_eudebug.html
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2833])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#2248])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-1/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#2284] / [Intel XE#366])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-2/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_compute0:
    - shard-lnl:          [PASS][115] -> [FAIL][116] ([Intel XE#6251])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_compute0.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_compute0.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#4650])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-4/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#944])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-1/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#4130])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-1/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#4273])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_sriov_vram@vf-access-beyond:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#6376])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-2/igt@xe_sriov_vram@vf-access-beyond.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          [SKIP][122] ([Intel XE#6779]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@core_hotunplug@hotunplug-rescan.html

  * igt@fbdev@unaligned-write:
    - shard-bmg:          [SKIP][124] ([Intel XE#2134]) -> [PASS][125] +1 other test pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@fbdev@unaligned-write.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-1/igt@fbdev@unaligned-write.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [FAIL][126] ([Intel XE#6054]) -> [PASS][127] +3 other tests pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][128] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][130] ([Intel XE#3862]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_feature_discovery@display-1x:
    - shard-bmg:          [SKIP][132] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][133] +4 other tests pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_feature_discovery@display-1x.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-3/igt@kms_feature_discovery@display-1x.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][134] ([Intel XE#2316]) -> [PASS][135] +3 other tests pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][136] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][137] +1 other test pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [FAIL][138] ([Intel XE#301]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [ABORT][140] ([Intel XE#6740]) -> [PASS][141] +1 other test pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_hdr@invalid-metadata-sizes.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][142] ([Intel XE#718]) -> [PASS][143] +1 other test pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [SKIP][144] ([Intel XE#6693]) -> [PASS][145] +3 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_pm_rpm@i2c.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_pm_rpm@i2c.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][146] ([Intel XE#6361]) -> [PASS][147] +2 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][148] ([Intel XE#2142]) -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_exec_system_allocator@many-free-race-nomemset:
    - shard-bmg:          [SKIP][150] ([Intel XE#6703]) -> [PASS][151] +496 other tests pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_exec_system_allocator@many-free-race-nomemset.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@xe_exec_system_allocator@many-free-race-nomemset.html

  * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance0:
    - shard-lnl:          [FAIL][152] ([Intel XE#6251]) -> [PASS][153] +1 other test pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance0.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance0.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][154] ([Intel XE#6703]) -> [SKIP][155] ([Intel XE#2233])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][156] ([Intel XE#6703]) -> [SKIP][157] ([Intel XE#2327]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-bmg:          [SKIP][158] ([Intel XE#2327]) -> [SKIP][159] ([Intel XE#6703]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][160] ([Intel XE#6703]) -> [SKIP][161] ([Intel XE#1124]) +7 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][162] ([Intel XE#610]) -> [SKIP][163] ([Intel XE#6703])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][164] ([Intel XE#1124]) -> [SKIP][165] ([Intel XE#6703]) +12 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][166] ([Intel XE#6703]) -> [SKIP][167] ([Intel XE#2314] / [Intel XE#2894])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          [SKIP][168] ([Intel XE#6703]) -> [SKIP][169] ([Intel XE#367]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][170] ([Intel XE#367]) -> [SKIP][171] ([Intel XE#6703]) +3 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][172] ([Intel XE#6703]) -> [SKIP][173] ([Intel XE#2887]) +9 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][174] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][175] ([Intel XE#6703]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][176] ([Intel XE#6703]) -> [SKIP][177] ([Intel XE#2652] / [Intel XE#787])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          [SKIP][178] ([Intel XE#3432]) -> [SKIP][179] ([Intel XE#6703]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][180] ([Intel XE#6703]) -> [SKIP][181] ([Intel XE#3432]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][182] ([Intel XE#2887]) -> [SKIP][183] ([Intel XE#6703]) +17 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          [SKIP][184] ([Intel XE#2252]) -> [SKIP][185] ([Intel XE#6703]) +9 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][186] ([Intel XE#6703]) -> [SKIP][187] ([Intel XE#2325]) +3 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][188] ([Intel XE#2325]) -> [SKIP][189] ([Intel XE#6703]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_chamelium_color@degamma.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-bmg:          [SKIP][190] ([Intel XE#6703]) -> [SKIP][191] ([Intel XE#2252]) +3 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-3/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][192] ([Intel XE#6507]) -> [SKIP][193] ([Intel XE#6703])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_chamelium_sharpness_filter@filter-basic.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@dp-mst-suspend-resume:
    - shard-bmg:          [SKIP][194] ([Intel XE#6743]) -> [SKIP][195] ([Intel XE#6703])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_content_protection@dp-mst-suspend-resume.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_content_protection@dp-mst-suspend-resume.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][196] ([Intel XE#6703]) -> [FAIL][197] ([Intel XE#1178])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_content_protection@lic-type-0.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][198] ([Intel XE#6703]) -> [SKIP][199] ([Intel XE#2341])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_content_protection@mei-interface.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-bmg:          [SKIP][200] ([Intel XE#6703]) -> [SKIP][201] ([Intel XE#2321])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-bmg:          [SKIP][202] ([Intel XE#2320]) -> [SKIP][203] ([Intel XE#6557] / [Intel XE#6703])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-bmg:          [SKIP][204] ([Intel XE#6703]) -> [SKIP][205] ([Intel XE#2320])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          [SKIP][206] ([Intel XE#2320]) -> [SKIP][207] ([Intel XE#6703]) +4 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          [SKIP][208] ([Intel XE#2321]) -> [SKIP][209] ([Intel XE#6703])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][210] ([Intel XE#2286]) -> [SKIP][211] ([Intel XE#6703])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][212] ([Intel XE#4210]) -> [SKIP][213] ([Intel XE#6703])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [SKIP][214] ([Intel XE#6703]) -> [SKIP][215] ([Intel XE#4354]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          [SKIP][216] ([Intel XE#6703]) -> [SKIP][217] ([Intel XE#4331])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          [SKIP][218] ([Intel XE#2244]) -> [SKIP][219] ([Intel XE#6703]) +2 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-bmg:          [SKIP][220] ([Intel XE#6703]) -> [CRASH][221] ([Intel XE#6706])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_fb_coherency@memset-crc.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][222] ([Intel XE#2372]) -> [SKIP][223] ([Intel XE#6703])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_feature_discovery@chamelium.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][224] ([Intel XE#6703]) -> [SKIP][225] ([Intel XE#2374])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_feature_discovery@psr1.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-7/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][226] ([Intel XE#2316]) -> [SKIP][227] ([Intel XE#6703])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-bmg:          [SKIP][228] ([Intel XE#6703]) -> [SKIP][229] ([Intel XE#2316])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][230] ([Intel XE#6703]) -> [SKIP][231] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][232] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][233] ([Intel XE#6557] / [Intel XE#6703])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][234] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][235] ([Intel XE#6703]) +6 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][236] ([Intel XE#6703]) -> [SKIP][237] ([Intel XE#2311]) +25 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][238] ([Intel XE#2311]) -> [SKIP][239] ([Intel XE#2312]) +3 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          [SKIP][240] ([Intel XE#2311]) -> [SKIP][241] ([Intel XE#6703]) +31 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][242] ([Intel XE#2312]) -> [SKIP][243] ([Intel XE#4141]) +2 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][244] ([Intel XE#4141]) -> [SKIP][245] ([Intel XE#2312]) +2 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][246] ([Intel XE#4141]) -> [SKIP][247] ([Intel XE#6703]) +11 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][248] ([Intel XE#6703]) -> [SKIP][249] ([Intel XE#4141]) +8 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][250] ([Intel XE#2352]) -> [SKIP][251] ([Intel XE#6703])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][252] ([Intel XE#2312]) -> [SKIP][253] ([Intel XE#6703]) +9 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][254] ([Intel XE#2312]) -> [SKIP][255] ([Intel XE#2311]) +4 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - shard-bmg:          [SKIP][256] ([Intel XE#2312]) -> [SKIP][257] ([Intel XE#2313]) +5 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][258] ([Intel XE#6703]) -> [SKIP][259] ([Intel XE#2312]) +4 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-bmg:          [SKIP][260] ([Intel XE#6703]) -> [SKIP][261] ([Intel XE#2313]) +22 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][262] ([Intel XE#6703]) -> [SKIP][263] ([Intel XE#2352])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][264] ([Intel XE#2313]) -> [SKIP][265] ([Intel XE#6703]) +28 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][266] ([Intel XE#2313]) -> [SKIP][267] ([Intel XE#2312]) +3 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-bmg:          [SKIP][268] ([Intel XE#6703]) -> [ABORT][269] ([Intel XE#6740])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_hdr@bpc-switch-suspend.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][270] ([Intel XE#3544]) -> [SKIP][271] ([Intel XE#6703])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          [SKIP][272] -> [SKIP][273] ([Intel XE#6703]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][274] ([Intel XE#5021]) -> [SKIP][275] ([Intel XE#6703])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][276] ([Intel XE#5020]) -> [SKIP][277] ([Intel XE#6703])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_plane_multiple@tiling-yf.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-bmg:          [SKIP][278] ([Intel XE#6703]) -> [SKIP][279] ([Intel XE#6886])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-bmg:          [SKIP][280] ([Intel XE#6886]) -> [SKIP][281] ([Intel XE#6703])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          [SKIP][282] ([Intel XE#6703]) -> [SKIP][283] ([Intel XE#870])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_pm_backlight@bad-brightness.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-7/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][284] ([Intel XE#1439] / [Intel XE#836]) -> [SKIP][285] ([Intel XE#6693])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][286] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][287] ([Intel XE#1406] / [Intel XE#1489]) +8 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][288] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][289] ([Intel XE#1406] / [Intel XE#6703]) +7 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          [SKIP][290] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][291] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +11 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_psr@fbc-psr-suspend.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][292] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][293] ([Intel XE#1406] / [Intel XE#6703]) +13 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][294] ([Intel XE#1406] / [Intel XE#2234]) -> [SKIP][295] ([Intel XE#1406] / [Intel XE#6703])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_psr@psr2-primary-render.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          [SKIP][296] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][297] ([Intel XE#6703])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          [SKIP][298] ([Intel XE#6703]) -> [SKIP][299] ([Intel XE#2413])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][300] ([Intel XE#6703]) -> [SKIP][301] ([Intel XE#1435])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@filter-formats:
    - shard-bmg:          [SKIP][302] ([Intel XE#6503]) -> [SKIP][303] ([Intel XE#6703]) +2 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_sharpness_filter@filter-formats.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_sharpness_filter@filter-formats.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          [SKIP][304] ([Intel XE#6703]) -> [SKIP][305] ([Intel XE#6503]) +3 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][306] ([Intel XE#2450]) -> [SKIP][307] ([Intel XE#6557] / [Intel XE#6703])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          [SKIP][308] ([Intel XE#2168]) -> [SKIP][309] ([Intel XE#6703])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_vrr@cmrr.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][310] ([Intel XE#6703]) -> [SKIP][311] ([Intel XE#1499]) +3 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_vrr@max-min.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][312] ([Intel XE#1499]) -> [SKIP][313] ([Intel XE#6703]) +2 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_vrr@seamless-rr-switch-drrs.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_compute@eu-busy-10s:
    - shard-bmg:          [SKIP][314] ([Intel XE#6599]) -> [SKIP][315] ([Intel XE#6703])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@xe_compute@eu-busy-10s.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_compute@eu-busy-10s.html

  * igt@xe_eudebug@basic-exec-queues-enable:
    - shard-bmg:          [SKIP][316] ([Intel XE#6703]) -> [SKIP][317] ([Intel XE#4837]) +8 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_eudebug@basic-exec-queues-enable.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@xe_eudebug@basic-exec-queues-enable.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][318] ([Intel XE#4837]) -> [SKIP][319] ([Intel XE#6703]) +7 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          [SKIP][320] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][321] ([Intel XE#6703]) +6 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          [SKIP][322] ([Intel XE#6703]) -> [SKIP][323] ([Intel XE#4837] / [Intel XE#6665]) +5 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-bmg:          [SKIP][324] ([Intel XE#6703]) -> [SKIP][325] ([Intel XE#2322]) +5 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-bmg:          [SKIP][326] ([Intel XE#2322]) -> [SKIP][327] ([Intel XE#6703]) +12 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem:
    - shard-bmg:          [SKIP][328] ([Intel XE#6874]) -> [SKIP][329] ([Intel XE#6703]) +29 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem.html

  * igt@xe_exec_multi_queue@many-execs-basic-smem:
    - shard-bmg:          [SKIP][330] ([Intel XE#6703]) -> [SKIP][331] ([Intel XE#6874]) +16 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_exec_multi_queue@many-execs-basic-smem.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-1/igt@xe_exec_multi_queue@many-execs-basic-smem.html

  * igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:
    - shard-bmg:          [SKIP][332] ([Intel XE#5007]) -> [SKIP][333] ([Intel XE#6703]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][334] ([Intel XE#4943]) -> [SKIP][335] ([Intel XE#6703]) +25 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset:
    - shard-bmg:          [SKIP][336] ([Intel XE#6703]) -> [SKIP][337] ([Intel XE#4943]) +14 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          [SKIP][338] ([Intel XE#2459] / [Intel XE#2596]) -> [SKIP][339] ([Intel XE#6703])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@xe_media_fill@media-fill.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][340] ([Intel XE#6703]) -> [SKIP][341] ([Intel XE#2248])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][342] ([Intel XE#6703]) -> [SKIP][343] ([Intel XE#5694])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_pm@d3cold-i2c.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-bmg:          [SKIP][344] ([Intel XE#6703]) -> [SKIP][345] ([Intel XE#2284])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_pm@d3cold-mmap-vram.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-3/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          [SKIP][346] ([Intel XE#5742]) -> [SKIP][347] ([Intel XE#6703])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@xe_pm@d3hot-i2c.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          [SKIP][348] ([Intel XE#6703]) -> [SKIP][349] ([Intel XE#4733]) +2 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          [SKIP][350] ([Intel XE#4733]) -> [SKIP][351] ([Intel XE#6703]) +4 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][352] ([Intel XE#6703]) -> [SKIP][353] ([Intel XE#944]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [FAIL][354] ([Intel XE#6569]) -> [SKIP][355] ([Intel XE#6703])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@xe_sriov_flr@flr-vf1-clear.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4674]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674
  [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6706]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6706
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6743]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6743
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8670 -> IGTPW_14232
  * Linux: xe-4259-605176fe40c828b491a1532367df157529895b87 -> xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864

  IGTPW_14232: 14232
  IGT_8670: 8670
  xe-4259-605176fe40c828b491a1532367df157529895b87: 605176fe40c828b491a1532367df157529895b87
  xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864: b8b72578c50083961ef150f128e6e8c0c3396864

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/index.html

--===============0600305389495186133==
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
<tr><td><b>Series:</b></td><td>Panthor tests for huge partial unmaps (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158975/">https://patchwork.freedesktop.org/series/158975/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8670_FULL -&gt; XEIGTPW_14232_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14232_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14232_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14232_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@core_getversion@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@core_getversion@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@core_setmaster@master-drop-set-root.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-malloc-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-malloc-race.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_joiner@basic-ultra-joiner:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14232_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674">Intel XE#4674</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@fbdev@unaligned-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-3/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@intel_hwmon@hwmon-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177">Intel XE#5177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-8/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-2/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-7/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-1/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-8/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +169 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-1/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-4/igt@kms_cursor_crc@cursor-random-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-2/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc@mmap-offset-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_fb_coherency@memset-crc@mmap-offset-wc.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6706">Intel XE#6706</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106">Intel XE#3106</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683">Intel XE#4683</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-3/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-1/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-1/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685">Intel XE#2685</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-4/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@kms_psr@fbc-psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-3/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-faultable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-4/igt@xe_eudebug@basic-vm-access-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@xe_eudebug_online@interrupt-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-8/igt@xe_evict@evict-beng-cm-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +641 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-8/igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-7/igt@xe_exec_multi_queue@max-queues-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@prefetch-sys-benchmark:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@xe_exec_system_allocator@prefetch-sys-benchmark.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@xe_exec_system_allocator@prefetch-sys-benchmark.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-eocheck:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-eocheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-8/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-1/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-2/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_compute0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_compute0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_compute0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-4/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-1/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-1/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-beyond:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-2/igt@xe_sriov_vram@vf-access-beyond.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376">Intel XE#6376</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@core_hotunplug@hotunplug-rescan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@fbdev@unaligned-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-1/igt@fbdev@unaligned-write.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054">Intel XE#6054</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-3/igt@kms_feature_discovery@display-1x.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_hdr@invalid-metadata-sizes.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_pm_rpm@i2c.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-free-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_exec_system_allocator@many-free-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@xe_exec_system_allocator@many-free-race-nomemset.html">PASS</a> +496 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-3/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6743">Intel XE#6743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210">Intel XE#4210</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_fb_coherency@memset-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_fb_coherency@memset-crc.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6706">Intel XE#6706</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-7/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@kms_hdr@bpc-switch-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-7/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_sharpness_filter@filter-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_sharpness_filter@filter-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@xe_compute@eu-busy-10s.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_compute@eu-busy-10s.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues-enable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_eudebug@basic-exec-queues-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@xe_eudebug@basic-exec-queues-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-8/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-basic-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_exec_multi_queue@many-execs-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-1/igt@xe_exec_multi_queue@many-execs-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-4/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-3/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-10/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-9/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14232/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8670 -&gt; IGTPW_14232</li>
<li>Linux: xe-4259-605176fe40c828b491a1532367df157529895b87 -&gt; xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864</li>
</ul>
<p>IGTPW_14232: 14232<br />
  IGT_8670: 8670<br />
  xe-4259-605176fe40c828b491a1532367df157529895b87: 605176fe40c828b491a1532367df157529895b87<br />
  xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864: b8b72578c50083961ef150f128e6e8c0c3396864</p>

</body>
</html>

--===============0600305389495186133==--
