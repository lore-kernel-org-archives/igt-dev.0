Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1029E7717D
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 00:40:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B0610E1F6;
	Thu, 12 Dec 2024 00:40:52 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3969210E1F6;
 Thu, 12 Dec 2024 00:40:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8669659393003448297=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_series_starting_with_=5Bi-?=
 =?utf-8?q?g-t=2C1/2=5D_tests/xe=5Feudebug=3A_Set_NEEDS=5FVISIBLE=5FVRAM_for?=
 =?utf-8?q?_=27create=5Fbind=5Flist=27?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Dec 2024 00:40:51 -0000
Message-ID: <173396405122.1391498.15440291673119882192@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241211191741.36973-1-christoph.manszewski@intel.com>
In-Reply-To: <20241211191741.36973-1-christoph.manszewski@intel.com>
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

--===============8669659393003448297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/xe_eudebug: Set NEEDS_VISIBLE_VRAM for 'create_bind_list'
URL   : https://patchwork.freedesktop.org/series/142438/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8149_full -> XEIGTPW_12298_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12298_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12298_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12298_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_basic@twice-null-defer-bind:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-2/igt@xe_exec_basic@twice-null-defer-bind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-2/igt@xe_exec_basic@twice-null-defer-bind.html

  * igt@xe_prime_self_import@basic-with_one_bo_two_files:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-2/igt@xe_prime_self_import@basic-with_one_bo_two_files.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [FAIL][4] ([Intel XE#2333]) -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12298_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][6] -> [DMESG-WARN][7] ([Intel XE#3467] / [Intel XE#3468])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-2/igt@core_hotunplug@hotreplug.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-7/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][8] ([Intel XE#3468] / [Intel XE#3783])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#664])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@kms_async_flips@test-cursor.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#3658]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2327]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1407]) +4 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-8/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +10 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1428]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#610])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1124]) +13 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1477])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2191]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1512]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#367]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#367]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2887]) +17 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2887]) +19 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#3432]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#314]) +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-6/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_chamelium_audio:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][28] ([Intel XE#2594])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-4/igt@kms_chamelium_audio.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2325]) +4 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#306]) +6 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-7/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2252]) +13 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#373]) +15 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-5/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_color@ctm-0-50:
    - shard-bmg:          [PASS][33] -> [DMESG-WARN][34] ([Intel XE#3468]) +47 other tests dmesg-warn
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-4/igt@kms_color@ctm-0-50.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-2/igt@kms_color@ctm-0-50.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2341]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#3278])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1468])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#2321])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1424]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2321]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2320]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2291]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#309]) +5 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#2291])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#323]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2286])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1508])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#1508])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - shard-bmg:          [PASS][50] -> [DMESG-WARN][51] ([Intel XE#877]) +1 other test dmesg-warn
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-3/igt@kms_display_modes@extended-mode-basic@pipe-b-dp-2-pipe-c-hdmi-a-3.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-4/igt@kms_display_modes@extended-mode-basic@pipe-b-dp-2-pipe-c-hdmi-a-3.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#1340])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2244])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#2244])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-1/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#703])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1138])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-6/igt@kms_feature_discovery@display-4x.html
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#1138])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-7/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2375])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-2/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1421]) +15 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][61] ([Intel XE#2882]) +3 other tests fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][62] ([Intel XE#3321]) +1 other test fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][63] -> [INCOMPLETE][64] ([Intel XE#1727] / [Intel XE#2597] / [Intel XE#3468])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][65] -> [DMESG-FAIL][66] ([Intel XE#3468]) +6 other tests dmesg-fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][67] -> [DMESG-FAIL][68] ([Intel XE#1727] / [Intel XE#3468]) +7 other tests dmesg-fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [PASS][69] -> [SKIP][70] ([Intel XE#2316]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-7/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][71] -> [FAIL][72] ([Intel XE#2882]) +1 other test fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2316]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@bo-too-big-interruptible:
    - shard-lnl:          NOTRUN -> [TIMEOUT][74] ([Intel XE#1504]) +1 other test timeout
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][75] ([Intel XE#3468]) +13 other tests dmesg-warn
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2293]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1401]) +7 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1401] / [Intel XE#1745]) +7 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2311]) +32 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#651]) +23 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][82] ([Intel XE#3468]) +1 other test dmesg-fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [FAIL][83] ([Intel XE#2333]) +16 other tests fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#656]) +62 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2312]) +12 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2313]) +29 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2502])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#2340])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-1/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1470])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-7/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#3374] / [Intel XE#3544])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][91] -> [SKIP][92] ([Intel XE#1503])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1503]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][94] -> [SKIP][95] ([Intel XE#3012])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#2927]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-8/igt@kms_joiner@basic-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2927])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#346])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-8/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#346])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2934])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#2934])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2486])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [ABORT][103] ([Intel XE#3673]) +9 other tests abort
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#599])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-7/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2393])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-4/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#2763]) +27 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2763]) +29 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#870]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#736])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-8/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#3309])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1439] / [Intel XE#836])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#1439] / [Intel XE#3141])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-6/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#2893]) +4 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#1489]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#1406]) +6 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-8/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2234] / [Intel XE#2850]) +16 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-4/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2234])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#3414]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#3414]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-2/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1127])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2330])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2413])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#1435])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vblank@wait-forked-busy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][124] ([Intel XE#1727]) +1 other test incomplete
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@kms_vblank@wait-forked-busy@pipe-a-dp-2.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#1499]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1499]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-check-output:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#756])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#756]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
    - shard-bmg:          NOTRUN -> [ABORT][129] ([Intel XE#3673]) +2 other tests abort
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-2/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#1447])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-6/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-bmg:          [PASS][131] -> [DMESG-WARN][132] ([Intel XE#1727]) +5 other tests dmesg-warn
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-3/igt@xe_copy_basic@mem-set-linear-0x369.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-2/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_eudebug@basic-vms:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2905]) +14 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-4/igt@xe_eudebug@basic-vms.html

  * igt@xe_eudebug@exec-queue-placements:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#2905]) +17 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-7/igt@xe_eudebug@exec-queue-placements.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-bmg:          NOTRUN -> [TIMEOUT][135] ([Intel XE#1473])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-cm-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#688]) +20 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-6/igt@xe_evict@evict-cm-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][137] ([Intel XE#1473])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#1392]) +14 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2322]) +10 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][140] ([Intel XE#3467] / [Intel XE#3468]) +2 other tests dmesg-warn
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][141] ([Intel XE#3343] / [Intel XE#3468])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [PASS][142] -> [DMESG-WARN][143] ([Intel XE#3467]) +2 other tests dmesg-warn
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#2229]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-5/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2229])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#560])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-1/igt@xe_media_fill@media-fill.html
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2459] / [Intel XE#2596])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#1416])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-7/igt@xe_mmap@vram.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173]) -> ([PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [SKIP][197], [PASS][198], [PASS][199]) ([Intel XE#378])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-8/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-8/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-8/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-4/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-7/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-7/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-4/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-4/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-5/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-5/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-5/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-1/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-1/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-1/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-6/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-6/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-6/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-6/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-2/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-2/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-2/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-2/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-3/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-3/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-3/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-8/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-8/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-7/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-8/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-8/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-7/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-5/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-5/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-5/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-4/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-1/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-1/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-6/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-4/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-4/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-7/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-6/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-1/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-2/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-2/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-1/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-5/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-6/igt@xe_module_load@load.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-lnl:          NOTRUN -> [SKIP][200] ([Intel XE#1420] / [Intel XE#2838])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-4/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][201] ([Intel XE#977])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-5/igt@xe_pat@pat-index-xelp.html
    - shard-bmg:          NOTRUN -> [SKIP][202] ([Intel XE#2245])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-4/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][203] ([Intel XE#2236])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html
    - shard-lnl:          NOTRUN -> [SKIP][204] ([Intel XE#979])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-8/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][205] ([Intel XE#2284] / [Intel XE#366])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-6/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3hot-basic:
    - shard-bmg:          [PASS][206] -> [DMESG-WARN][207] ([Intel XE#1727] / [Intel XE#3468])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-5/igt@xe_pm@d3hot-basic.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@xe_pm@d3hot-basic.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][208] ([Intel XE#1948])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][209] ([Intel XE#2284])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-lnl:          NOTRUN -> [ABORT][210] ([Intel XE#1616] / [Intel XE#1694] / [Intel XE#3766])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-7/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][211] ([Intel XE#584]) +2 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          [PASS][212] -> [DMESG-WARN][213] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) +1 other test dmesg-warn
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-7/igt@xe_pm@s3-multiple-execs.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-2/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][214] -> [ABORT][215] ([Intel XE#1794])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> [SKIP][216] ([Intel XE#944]) +3 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@xe_query@multigpu-query-invalid-size.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [DMESG-WARN][217] ([Intel XE#3468]) -> [PASS][218] +47 other tests pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][219] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][221] ([Intel XE#2291]) -> [PASS][222] +1 other test pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][223] ([Intel XE#2316]) -> [PASS][224] +2 other tests pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][225] ([Intel XE#3321]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][227] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][228] +6 other tests pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-3/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-7/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend@c-dp2:
    - shard-bmg:          [DMESG-FAIL][229] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][230] +4 other tests pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-3/igt@kms_flip@flip-vs-suspend@c-dp2.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-7/igt@kms_flip@flip-vs-suspend@c-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-bmg:          [INCOMPLETE][231] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][232] +1 other test pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-bmg:          [INCOMPLETE][233] ([Intel XE#1727]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-bmg:          [DMESG-FAIL][235] ([Intel XE#3468]) -> [PASS][236] +12 other tests pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-3/igt@kms_rotation_crc@multiplane-rotation.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [DMESG-WARN][237] ([Intel XE#1727]) -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-5/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          [DMESG-WARN][239] ([Intel XE#3467] / [Intel XE#3468]) -> [PASS][240] +2 other tests pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-bmg:          [DMESG-WARN][241] -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [DMESG-WARN][243] ([Intel XE#3467]) -> [PASS][244]
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [SKIP][245] ([Intel XE#1192]) -> [PASS][246] +1 other test pass
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-8/igt@xe_live_ktest@xe_bo.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-lnl:          [SKIP][247] ([Intel XE#1192]) -> [PASS][248]
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-4/igt@xe_live_ktest@xe_dma_buf.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_pm@s3-basic:
    - shard-bmg:          [DMESG-WARN][249] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [PASS][250] +1 other test pass
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-4/igt@xe_pm@s3-basic.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [ABORT][251] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][252]
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [DMESG-WARN][253] ([Intel XE#1727] / [Intel XE#3467]) -> [PASS][254]
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-4/igt@xe_wedged@wedged-mode-toggle.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][255] ([Intel XE#1178]) -> [SKIP][256] ([Intel XE#2341])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][257] ([Intel XE#2291]) -> [DMESG-WARN][258] ([Intel XE#877])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [DMESG-FAIL][259] ([Intel XE#3468]) -> [FAIL][260] ([Intel XE#1695]) +1 other test fail
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-bmg:          [DMESG-WARN][261] ([Intel XE#3468]) -> [SKIP][262] ([Intel XE#2316])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][263] ([Intel XE#2312]) -> [SKIP][264] ([Intel XE#2311]) +6 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][265] ([Intel XE#2311]) -> [SKIP][266] ([Intel XE#2312]) +8 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][267] ([Intel XE#2312]) -> [FAIL][268] ([Intel XE#2333]) +1 other test fail
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [DMESG-FAIL][269] ([Intel XE#3468]) -> [SKIP][270] ([Intel XE#2312])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [DMESG-FAIL][271] ([Intel XE#3468]) -> [FAIL][272] ([Intel XE#2333]) +7 other tests fail
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [FAIL][273] ([Intel XE#2333]) -> [DMESG-FAIL][274] ([Intel XE#3468]) +2 other tests dmesg-fail
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [FAIL][275] ([Intel XE#2333]) -> [SKIP][276] ([Intel XE#2312]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][277] ([Intel XE#2312]) -> [SKIP][278] ([Intel XE#2313]) +7 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][279] ([Intel XE#2313]) -> [SKIP][280] ([Intel XE#2312]) +12 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-bmg:          [INCOMPLETE][281] ([Intel XE#1473] / [Intel XE#3468]) -> [TIMEOUT][282] ([Intel XE#1473])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-7/igt@xe_evict@evict-beng-mixed-threads-large.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_pm@s2idle-basic:
    - shard-bmg:          [DMESG-WARN][283] ([Intel XE#1727] / [Intel XE#3468]) -> [ABORT][284] ([Intel XE#3673])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-2/igt@xe_pm@s2idle-basic.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-bmg:          [ABORT][285] ([Intel XE#1616] / [Intel XE#3468]) -> [ABORT][286] ([Intel XE#1616]) +1 other test abort
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-bmg-3/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@xe_pm@s2idle-vm-bind-prefetch.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3673]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3766]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3766
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3783
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8149 -> IGTPW_12298

  IGTPW_12298: 1de50630e7e299db6545c809f7bfa7dfcba9b455 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8149: 1e3893ae48c972da2338a62477d74de0f7b26776 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2354-49199ebefcd6fc1e6dc38eafa23a2825bf39c27d: 49199ebefcd6fc1e6dc38eafa23a2825bf39c27d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/index.html

--===============8669659393003448297==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/xe_eu=
debug: Set NEEDS_VISIBLE_VRAM for &#x27;create_bind_list&#x27;</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142438/">https://patchwork.freedesktop.org/series/142438/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12298/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12298/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8149_full -&gt; XEIGTPW_12298_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12298_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12298_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
298_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_basic@twice-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-2/igt@xe_exec_basic@twice-null-defer-bind.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/s=
hard-bmg-2/igt@xe_exec_basic@twice-null-defer-bind.html">DMESG-WARN</a> +1 =
other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo_two_files:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-2/igt@xe_prime_self_import@basic-with_=
one_bo_two_files.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-ind=
fb-onoff.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-7/igt@kms_frontbuffer_tracking@=
fbc-1p-primscrn-spr-indfb-onoff.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12298_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-2/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-7/=
igt@core_hotunplug@hotreplug.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a=
>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@core_hotunplug@unbind-rebind.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3468">Intel XE#3468</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3783">Intel XE#3783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@kms_async_flips@test-cursor.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-8/igt@kms_big_fb@linear-32bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1407">Intel XE#1407</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-=
180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1428">Intel XE#1428</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1124">Intel XE#1124</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb-size-o=
ffset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2=
-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4=
-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4=
-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_ccs@bad-pixel-format-y-tiled=
-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-=
lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-yf-t=
iled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3432">Intel XE#3432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-6/igt@kms_cdclk@mode-transition@pipe-b=
-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/314">Intel XE#314</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-4/igt@kms_chamelium_audio.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
94">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@kms_chamelium_color@ctm-0-25.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2325">Intel XE#2325</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-7/igt@kms_chamelium_color@ctm-blue-to-=
red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/306">Intel XE#306</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-chang=
e-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-5/igt@kms_chamelium_hpd@dp-hpd.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373=
">Intel XE#373</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-4/igt@kms_color@ctm-0-50.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-2/igt@k=
ms_color@ctm-0-50.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +47 other tests dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_content_protection@atomic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@kms_content_protection@atomic-dp=
ms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1468">Intel XE#1468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-=
64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1424">Intel XE#1424</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-5=
12x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@kms_cursor_crc@cursor-random-32x=
32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cur=
sor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-6/igt@kms_cursor_legacy@2x-flip-vs-cur=
sor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/309">Intel XE#309</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12298/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-8/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-4/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1508">Intel XE#1508</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic@pipe-b-dp-2-pipe-c-hdmi-a-3:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-3/igt@kms_display_modes@extended-mode-basic@pipe-b-dp-=
2-pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12298/shard-bmg-4/igt@kms_display_modes@extended-mod=
e-basic@pipe-b-dp-2-pipe-c-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 oth=
er test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shar=
d-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-=
bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-1/igt@kms_dsc@dsc-with-bpc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">I=
ntel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-1/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-6/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1138">Intel XE#1138</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-7/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-2/igt@kms_feature_discovery@dp-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-=
modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vbla=
nk@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vbla=
nk@cd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2298/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
27">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2597">Intel XE#2597</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2=
-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12298/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptib=
le@ab-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 other tests dmesg-f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2=
-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12298/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptib=
le@ac-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +7 other=
 tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-7/igt@kms_flip@2x-flip-vs-wf_vblank.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-b=
mg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/sh=
ard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a=
>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recrea=
te-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-4/igt@kms_flip@bo-too-big-interruptibl=
e.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1504">Intel XE#1504</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@=
c-dp2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3468">Intel XE#3468</a>) +13 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#14=
01</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) =
+7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +4=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +32 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +23 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-=
offscren-pri-indfb-draw-render.html">DMESG-FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other =
test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-indfb-pgflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +16 other tests fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +62 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +29 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_getfb@getfb-reject-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
502">Intel XE#2502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-1/igt@kms_getfb@getfb2-accept-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2340">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-7/igt@kms_hdmi_inject@inject-4k.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
70">Intel XE#1470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-3/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@k=
ms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-1/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1503">Intel XE#1503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/sha=
rd-bmg-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-8/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2927">Intel XE#2927</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-8/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/346">Intel XE#346</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-4/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@kms_panel_fitting@atomic-fastset=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-=
crc@pipe-a-edp-1.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3673">Intel XE#3673</a>) +9 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-7/igt@kms_plane_lowres@tiling-y.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/59=
9">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-4/igt@kms_plane_lowres@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-4/igt@kms_plane_scaling@planes-downsca=
le-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +29 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_pm_backlight@bad-brightness.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-8/igt@kms_pm_dc@dc3co-vpb-simulation.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@kms_pm_dc@dc5-retention-flops.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-non-l=
psp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-6/igt@kms_pm_rpm@modeset-non-lpsp.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2893">Intel XE#2893</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_psr2_sf@pr-cursor-plane-move=
-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-8/igt@kms_psr@fbc-pr-dpms.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">In=
tel XE#1406</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-4/igt@kms_psr@pr-sprite-plane-onoff.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2850">Intel XE#2850</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_psr@psr2-primary-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-forma=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-2/igt@kms_rotation_crc@primary-rotatio=
n-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-f=
ull-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-6/igt@kms_setmode@clone-exclusive-crtc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@kms_vblank@wait-forked-busy@pipe=
-a-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@kms_vrr@flip-suspend.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">I=
ntel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@kms_vrr@negative-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499"=
>Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_writeback@writeback-check-ou=
tput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-6/igt@kms_writeback@writeback-fb-id-xr=
gb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-2/igt@xe_ccs@suspend-resume@linear-com=
pressed-compfmt0-system-vram01.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3673">Intel XE#3673</a>) +2 other tests=
 abort</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-6/igt@xe_compute@ccs-mode-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
47">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-3/igt@xe_copy_basic@mem-set-linear-0x369.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/sh=
ard-bmg-2/igt@xe_copy_basic@mem-set-linear-0x369.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-4/igt@xe_eudebug@basic-vms.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">I=
ntel XE#2905</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@exec-queue-placements:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-7/igt@xe_eudebug@exec-queue-placements=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-t=
hreads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-6/igt@xe_evict@evict-cm-threads-small.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/688">Intel XE#688</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-7/igt@xe_evict@evict-mixed-threads-lar=
ge.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-4/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#139=
2</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +10 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@xe_fault_injection@inject-fault-=
probe-function-xe_sriov_init.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a=
>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-2/igt@xe_fault_injection@inject-fault-=
probe-function-xe_uc_fw_init.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_vm_create_s=
cratch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12298/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_vm_c=
reate_scratch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +2 other tests dmesg-warn<=
/li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-5/igt@xe_live_ktest@xe_bo@xe_bo_shrink=
_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@xe_live_ktest@xe_bo@xe_ccs_migra=
te_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-1/igt@xe_media_fill@media-fill.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/560=
">Intel XE#560</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@xe_media_fill@media-fill.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/245=
9">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-7/igt@xe_mmap@vram.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#=
1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8149/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8149/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-4/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8149/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8149/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8149/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8149/shard-lnl-5/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-ln=
l-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8149/shard-lnl-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard=
-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-6/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/sh=
ard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-6/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149=
/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
149/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-2/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8149/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-3/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8149/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8149/shard-lnl-3/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12298/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12298/shard-lnl-7/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/s=
hard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12298/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-5/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12298/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-5/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12298/shard-lnl-4/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-l=
nl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-1/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1229=
8/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12298/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12298/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-7/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12298/shard-lnl-6/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shar=
d-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2298/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-2/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12298/shard-lnl-1/igt@xe_module_load@load.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-5/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12298/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Inte=
l XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-4/igt@xe_pat@pat-index-xehpc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420"=
>Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2838">Intel XE#2838</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-5/igt@xe_pat@pat-index-xelp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">I=
ntel XE#977</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-4/igt@xe_pat@pat-index-xelp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">=
Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236"=
>Intel XE#2236</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-8/igt@xe_pat@pat-index-xelpg.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">=
Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-6/igt@xe_pm@d3cold-mmap-vram.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"=
>Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-5/igt@xe_pm@d3hot-basic.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@x=
e_pm@d3hot-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@xe_pm@d3hot-mmap-vram.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948">=
Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-7/igt@xe_pm@s2idle-vm-bind-prefetch.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1616">Intel XE#1616</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1694">Intel XE#1694</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3766">Intel XE#3766</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@xe_pm@s3-mocs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#=
584</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-7/igt@xe_pm@s3-multiple-execs.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-2/i=
gt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel=
 XE#569</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-lnl-2/=
igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12298/shard-lnl-3/igt@xe_query@multigpu-query-invalid-=
size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-18=
0-async-flip.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_big_fb@4-ti=
led-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +47 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_bw@connecte=
d-linear-tiling-2-displays-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12298/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb=
-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316=
">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12298/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.ht=
ml">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_flip@2x-flip-v=
s-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-3/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/172=
7">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12298/shard-bmg-7/igt@kms_flip@flip-vs-suspend@a-=
hdmi-a3.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-3/igt@kms_flip@flip-vs-suspend@c-dp2.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">I=
ntel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12298/shard-bmg-7/igt@kms_flip@flip-vs-suspend@c-dp2.=
html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-l=
inear-downscaling.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-8/=
igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html"=
>PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap=
-wc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_frontbuffer_tracking=
@fbc-rgb101010-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-3/igt@kms_rotation_crc@multiplane-rotation.html">DMESG=
-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12298/shard-bmg-5/igt@kms_rotation_crc@multiplane-rotation.ht=
ml">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-5/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-i=
nvalidate-race.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-7/igt@xe_exec_fault=
_mode@twice-bindexecqueue-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-x=
e_tile_init_early.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-4/=
igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html"=
>PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-x=
e_wopcm_init.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12298/shard-bmg-7/igt@xe_fault_injection@inject-fau=
lt-probe-function-xe_wopcm_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops=
_prepare.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@xe_fault_injection@=
vm-bind-fail-xe_pt_update_ops_prepare.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-8/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/sha=
rd-bmg-3/igt@xe_live_ktest@xe_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-lnl-4/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1229=
8/shard-lnl-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-4/igt@xe_pm@s3-basic.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Int=
el XE#3468</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/569">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12298/shard-bmg-6/igt@xe_pm@s3-basic.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#13=
58</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/160=
7">Intel XE#1607</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12298/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-4/igt@xe_wedged@wedged-mode-toggle.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3467">Intel XE#3467</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@xe_wedged@wedged-mode-toggle.html=
">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Int=
el XE#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12298/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">In=
tel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@kms_cursor_lega=
cy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE=
#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel =
XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12298/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695=
</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblan=
k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-5/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-sh=
rfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_frontbuffer_t=
racking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-ind=
fb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12298/shard-bmg-2/igt@kms_frontbuffer_tracking@f=
bc-2p-primscrn-cur-indfb-move.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-ind=
fb-onoff.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_frontbuffer_tra=
cking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-onoff.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@kms_frontbuffer_tra=
cking@fbc-2p-primscrn-spr-indfb-onoff.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +7 other=
 tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-m=
sflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-8/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-indfb-msflip-blt.html">DMESG-FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 oth=
er tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
gflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@kms_frontbuffer_tracki=
ng@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-6/igt@kms_frontbuffer_tracking=
@psr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-7/igt@xe_evict@evict-beng-mixed-threads-large.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1473">Intel XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12298/shard-bmg-3/igt@xe_evict@evict-beng-mi=
xed-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-2/igt@xe_pm@s2idle-basic.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"=
>Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12298/shard-bmg-6/igt@xe_pm@s2idle-basic.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673">Intel XE#3673=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8149/shard-bmg-3/igt@xe_pm@s2idle-vm-bind-prefetch.html">ABORT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel X=
E#1616</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12298/shard-bmg-8/igt@xe_pm@s2idle-vm-bind-prefetch.html">A=
BORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/16=
16">Intel XE#1616</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8149 -&gt; IGTPW_12298</li>
</ul>
<p>IGTPW_12298: 1de50630e7e299db6545c809f7bfa7dfcba9b455 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8149: 1e3893ae48c972da2338a62477d74de0f7b26776 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2354-49199ebefcd6fc1e6dc38eafa23a2825bf39c27d: 49199ebefcd6fc1e6dc38ea=
fa23a2825bf39c27d</p>

</body>
</html>

--===============8669659393003448297==--
