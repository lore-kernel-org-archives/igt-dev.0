Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF636C28B2F
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 06:37:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABD910E129;
	Tue, 11 Mar 2025 06:37:51 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6ED10E0C5;
 Tue, 11 Mar 2025 06:37:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4191694521682612857=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_tests/amdgpu/amd=5Fhotplug?=
 =?utf-8?q?=3A_Check_the_suspend_state_after_resume?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tom Chung" <chiahsuan.chung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 11 Mar 2025 06:37:49 -0000
Message-ID: <174167506940.16928.10427634028175373800@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250310091440.2045-1-chiahsuan.chung@amd.com>
In-Reply-To: <20250310091440.2045-1-chiahsuan.chung@amd.com>
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

--===============4191694521682612857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_hotplug: Check the suspend state after resume
URL   : https://patchwork.freedesktop.org/series/146067/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8267_full -> XEIGTPW_12736_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_12736_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-lnl:          NOTRUN -> [SKIP][1] ([Intel XE#3157])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          NOTRUN -> [FAIL][2] ([Intel XE#3719] / [Intel XE#911]) +3 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#873])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#873])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#3768])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2327]) +4 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1407]) +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#316]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +11 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#607])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1477])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#607])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +9 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1124]) +13 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [PASS][15] -> [SKIP][16] ([Intel XE#2191])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2314] / [Intel XE#2894])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#2191]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2191]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-4/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#367])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#367])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#367])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#787]) +89 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#2907]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2887]) +15 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#3432]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#455] / [Intel XE#787]) +35 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#3432]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2887]) +13 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][31] -> [DMESG-WARN][32] ([Intel XE#1727] / [Intel XE#3113])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][33] -> [INCOMPLETE][34] ([Intel XE#3124])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#4417]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#306]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#306]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-8/igt@kms_chamelium_color@ctm-red-to-blue.html
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2325]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2252]) +8 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#373]) +7 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#373]) +6 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][42] ([Intel XE#1178]) +1 other test fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][43] ([Intel XE#1178]) +2 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1468])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-5/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#3278]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-5/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2320]) +5 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#2321]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#308]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1424]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2321])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [PASS][51] -> [SKIP][52] ([Intel XE#309]) +5 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#309]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2291])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [PASS][55] -> [SKIP][56] ([Intel XE#2291]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#323])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#323])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2286])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#4354])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#4354])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#4354])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2-set2:     [PASS][63] -> [SKIP][64] ([Intel XE#4331])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2244]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#2244]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#776])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#776])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#1138])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_feature_discovery@display-4x.html
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1138])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-8/igt@kms_feature_discovery@display-4x.html
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#1138])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1135])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#310]) +7 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][74] -> [FAIL][75] ([Intel XE#3321]) +3 other tests fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1421]) +8 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2316]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][78] ([Intel XE#2049]) +1 other test incomplete
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-dg2-set2:     [PASS][79] -> [SKIP][80] ([Intel XE#310]) +5 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@kms_flip@2x-plain-flip-interruptible.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][81] -> [SKIP][82] ([Intel XE#2316])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][83] ([Intel XE#2882])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check@ab-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][84] -> [FAIL][85] ([Intel XE#301]) +1 other test fail
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][86] -> [FAIL][87] ([Intel XE#301])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][88] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][89] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-dg2-set2:     [PASS][90] -> [FAIL][91] ([Intel XE#2882])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][92] -> [FAIL][93] ([Intel XE#886])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a6.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1397]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2293]) +5 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#1401]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2293] / [Intel XE#2380]) +5 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#651]) +22 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#651]) +16 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#656]) +25 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#4141]) +14 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [PASS][104] -> [SKIP][105] ([Intel XE#656]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2312]) +8 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2311]) +28 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2313]) +27 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#4439])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#656]) +42 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#653]) +18 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#4328])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#2934])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-4/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#2927])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#346])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-6/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#346])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2934]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2486])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][119] ([Intel XE#324]) +11 other tests dmesg-warn
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][120] ([Intel XE#616]) +1 other test fail
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][121] -> [FAIL][122] ([Intel XE#616]) +1 other test fail
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2393])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#455]) +20 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_plane_multiple@tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#2493])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-3/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2763]) +19 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#2763] / [Intel XE#455]) +7 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#2763]) +23 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#2763]) +11 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#870])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          NOTRUN -> [FAIL][131] ([Intel XE#718])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          NOTRUN -> [FAIL][132] ([Intel XE#1430])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2392])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#1129])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#1439] / [Intel XE#836])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     [PASS][136] -> [SKIP][137] ([Intel XE#836])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#1439] / [Intel XE#3141])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#1489]) +10 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#2893]) +4 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#1489]) +7 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#1122])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#2850] / [Intel XE#929]) +14 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#2234] / [Intel XE#2850]) +14 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#1406]) +4 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2234])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2414])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#3414] / [Intel XE#3904])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#3414]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#2413]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][152] -> [FAIL][153] ([Intel XE#2883]) +6 other tests fail
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-2/igt@kms_setmode@basic.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][154] -> [FAIL][155] ([Intel XE#2883]) +2 other tests fail
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html

  * igt@kms_setmode@basic@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][156] ([Intel XE#2883]) +1 other test fail
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_setmode@basic@pipe-b-dp-4.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][157] -> [FAIL][158] ([Intel XE#2883]) +2 other tests fail
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#1435])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#1435]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-dg2-set2:     [PASS][161] -> [SKIP][162] ([Intel XE#455]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#2426])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#330])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#330])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-1/igt@kms_tv_load_detect@load-detect.html
    - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#2450])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][167] ([Intel XE#899]) +3 other tests fail
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#1499]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#756])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#756])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-3/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:
    - shard-lnl:          [PASS][171] -> [DMESG-WARN][172] ([Intel XE#2932]) +1 other test dmesg-warn
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-7/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-4/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][173] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][174] ([Intel XE#1123]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][175] ([Intel XE#1126]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eu_stall@blocking-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#4497]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug@basic-connect:
    - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#2905]) +13 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#2905] / [Intel XE#3889]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-lnl:          NOTRUN -> [SKIP][179] ([Intel XE#2905] / [Intel XE#3889]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#2905] / [Intel XE#3889]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-bmg:          NOTRUN -> [SKIP][181] ([Intel XE#2905]) +12 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][182] ([Intel XE#2905]) +11 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-dg2-set2:     NOTRUN -> [SKIP][183] ([Intel XE#4518])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][184] ([Intel XE#688]) +4 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][185] ([Intel XE#1392]) +12 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][186] ([Intel XE#2322]) +11 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][187] ([Intel XE#288]) +25 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][188] ([Intel XE#2229])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][189] ([Intel XE#1999]) +2 other tests fail
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][190] ([Intel XE#560])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_media_fill@media-fill.html
    - shard-lnl:          NOTRUN -> [SKIP][191] ([Intel XE#560])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-lnl:          NOTRUN -> [SKIP][192] ([Intel XE#4045]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-1/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217]) -> ([PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [SKIP][242], [PASS][243]) ([Intel XE#378])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-4/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-4/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-8/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-8/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-7/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-7/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-5/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-1/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-7/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-8/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-1/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-4/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-3/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-1/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-6/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-5/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-5/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-1/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-4/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-6/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-8/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-7/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-6/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-3/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-3/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-3/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-3/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-3/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-3/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-6/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-4/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-5/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-8/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-8/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-5/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-5/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-6/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-4/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-8/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-1/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-1/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-1/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-4/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-1/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-6/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-3/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262]) -> ([PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [SKIP][281], [PASS][282]) ([Intel XE#2457])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-4/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-4/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-4/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-2/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-8/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-8/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-7/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-7/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-7/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-2/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-2/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-2/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-7/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-8/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-4/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-8/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-4/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-4/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-8/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306], [PASS][307]) -> ([PASS][308], [PASS][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319], [SKIP][320], [PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330], [PASS][331], [PASS][332]) ([Intel XE#378])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_module_load@load.html

  * igt@xe_oa@blocking:
    - shard-dg2-set2:     NOTRUN -> [SKIP][333] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_oa@blocking.html

  * igt@xe_oa@syncs-userptr-wait:
    - shard-dg2-set2:     NOTRUN -> [SKIP][334] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_oa@syncs-userptr-wait.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][335] ([Intel XE#977])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][336] ([Intel XE#2838] / [Intel XE#979])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html
    - shard-lnl:          NOTRUN -> [SKIP][337] ([Intel XE#1420] / [Intel XE#2838])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-1/igt@xe_pat@pat-index-xehpc.html
    - shard-bmg:          NOTRUN -> [SKIP][338] ([Intel XE#1420])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][339] ([Intel XE#977])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-4/igt@xe_pat@pat-index-xelp.html
    - shard-bmg:          NOTRUN -> [SKIP][340] ([Intel XE#2245])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@xe_pat@pat-index-xelp.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][341] ([Intel XE#2427])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][342] ([Intel XE#2284])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     NOTRUN -> [SKIP][343] ([Intel XE#2284] / [Intel XE#366])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][344] ([Intel XE#584]) +2 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-5/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-bmg:          NOTRUN -> [ABORT][345] ([Intel XE#4268]) +1 other test abort
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][346] ([Intel XE#944]) +2 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_query@multigpu-query-cs-cycles.html
    - shard-lnl:          NOTRUN -> [SKIP][347] ([Intel XE#944]) +3 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][348] ([Intel XE#944]) +2 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-lnl:          NOTRUN -> [SKIP][349] ([Intel XE#4130])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@xe_sriov_auto_provisioning@fair-allocation.html
    - shard-bmg:          NOTRUN -> [SKIP][350] ([Intel XE#4130])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][351] ([Intel XE#4130]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#309]) -> [PASS][353] +6 other tests pass
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [SKIP][354] ([Intel XE#2291]) -> [PASS][355] +2 other tests pass
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-dg2-set2:     [SKIP][356] ([Intel XE#310]) -> [PASS][357] +4 other tests pass
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [SKIP][358] ([Intel XE#2316]) -> [PASS][359]
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [FAIL][360] ([Intel XE#2882]) -> [PASS][361] +1 other test pass
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a6:
    - shard-dg2-set2:     [FAIL][362] ([Intel XE#886]) -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a6.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-lnl:          [FAIL][364] ([Intel XE#886]) -> [PASS][365] +1 other test pass
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
    - shard-bmg:          [FAIL][366] ([Intel XE#3321]) -> [PASS][367] +1 other test pass
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#656]) -> [PASS][369] +5 other tests pass
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][370] ([Intel XE#1435]) -> [PASS][371]
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#455]) -> [PASS][373]
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@kms_vrr@negative-basic.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_vrr@negative-basic.html

  * igt@testdisplay:
    - shard-dg2-set2:     [ABORT][374] ([Intel XE#2705]) -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@testdisplay.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@testdisplay.html

  
#### Warnings ####

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#787]) -> [SKIP][377] ([Intel XE#455] / [Intel XE#787]) +8 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][379] ([Intel XE#787]) +7 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][380] ([Intel XE#2705]) -> [INCOMPLETE][381] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#455]) -> [FAIL][383] ([Intel XE#1178])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][384] ([i915#3804]) -> [SKIP][385] ([Intel XE#455] / [i915#3804])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [SKIP][386] ([Intel XE#2316]) -> [FAIL][387] ([Intel XE#2882])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][388] ([Intel XE#2311]) -> [SKIP][389] ([Intel XE#2312]) +6 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][390] ([Intel XE#656]) -> [SKIP][391] ([Intel XE#651]) +12 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-lnl:          [SKIP][392] ([Intel XE#656]) -> [ABORT][393] ([Intel XE#4520])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][394] ([Intel XE#2312]) -> [SKIP][395] ([Intel XE#4141]) +3 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][396] ([Intel XE#4141]) -> [SKIP][397] ([Intel XE#2312]) +8 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#651]) -> [SKIP][399] ([Intel XE#656]) +8 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][400] ([Intel XE#2312]) -> [SKIP][401] ([Intel XE#2311]) +10 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][402] ([Intel XE#2312]) -> [SKIP][403] ([Intel XE#2313]) +6 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][404] ([Intel XE#656]) -> [SKIP][405] ([Intel XE#653]) +16 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][406] ([Intel XE#653]) -> [SKIP][407] ([Intel XE#656]) +13 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][408] ([Intel XE#2313]) -> [SKIP][409] ([Intel XE#2312]) +7 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4439
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4520
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8267 -> IGTPW_12736

  IGTPW_12736: 3d53622493160177e5e6e98b5a64e00e376273c3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8267: 3ad1299396859b88c0938d93b38f42e2169cdf41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2786-0457c65354c6dfa0e81d9acb5e39e03b59b82d7a: 0457c65354c6dfa0e81d9acb5e39e03b59b82d7a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/index.html

--===============4191694521682612857==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_hotplug: Check the suspend =
state after resume</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/146067/">https://patchwork.freedesktop.org/series/146067/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12736/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12736/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8267_full -&gt; XEIGTPW_12736_full<=
/h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12736_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-5/igt@kms_addfb_basic@invalid-smem-bo-=
on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-4/igt@kms_async_flips@async-flip-with-=
page-flip-events-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3719">Intel XE#3719</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other t=
ests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_async_flips@invalid-async-=
flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/873">Intel XE#873</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@kms_async_flips@invalid-async-fl=
ip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_async_flips@invalid-async-fl=
ip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1124">Intel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-=
offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-str=
ide-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +13 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-1920=
x1080p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12736/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3=
-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_bw@connected-linear-tiling=
-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-4/igt@kms_bw@connected-linear-tiling-3=
-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_bw@linear-tiling-1-display=
s-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-=
1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-=
1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled=
-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +89 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-5/igt@kms_ccs@ccs-on-another-bo-y-tile=
d-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-=
tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +35 other tests ski=
p</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-a-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-b-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe=
-c-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to=
-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/306">Intel XE#306</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-8/igt@kms_chamelium_color@ctm-red-to-b=
lue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/306">Intel XE#306</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-b=
lue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2325">Intel XE#2325</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_chamelium_frames@hdmi-aspect=
-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2252">Intel XE#2252</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-=
enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd-with=
out-ddc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@kms_content_protection@legacy.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_content_protection@legacy@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-5/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1468">Intel XE#1468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-5/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3278">Intel XE#3278</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-=
128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_cursor_crc@cursor-offscree=
n-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-1=
28x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1424">Intel XE#1424</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12736/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
9">Intel XE#309</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cur=
sor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2736/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">In=
tel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_cursor_legacy@short-busy-f=
lip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-4/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-=
mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4354">Intel XE#4354</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@kms_dp_link_training@non-uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4354">Intel XE#4354</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-433/igt@kms_dp_linktrain_fallback@dp-fallback.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_127=
36/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel =
XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-formats.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2244">Intel XE#2244</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@kms_dsc@dsc-with-output-formats-=
with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2244">Intel XE#2244</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/77=
6">Intel XE#776</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_feature_discovery@display-=
4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1138">Intel XE#1138</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-8/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1138">Intel XE#1138</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_feature_discovery@psr2.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-rac=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/310">Intel XE#310</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@ad-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other tests=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-4/igt@kms_flip@2x-flip-vs-rmfb-interru=
ptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1421">Intel XE#1421</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recrea=
te-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test incomplet=
e</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-433/igt@kms_flip@2x-plain-flip-interruptible.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1273=
6/shard-dg2-464/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#=
310</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12736/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check@a=
b-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12736/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
a-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-inte=
rruptible@a-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interru=
ptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incom=
plete</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_flip@flip-vs-suspend-inter=
ruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test inc=
omplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-464/igt@kms_flip@plain-flip-fb-recreate-interruptible.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12736/shard-dg2-464/igt@kms_flip@plain-flip-fb-recreate-interruptible.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-464/igt@kms_flip@plain-flip-fb-recreate-interruptible@=
a-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_flip@plain-flip-fb-recreate-inte=
rruptible@a-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-x=
tile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-x=
tile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2=
293</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1=
401</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) =
+5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-=
1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +22 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-=
2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +25 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-=
offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +14 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb=
-plflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +28 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-=
rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_frontbuffer_tracking@plane=
-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4439">Intel XE#4439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +42 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-i=
ndfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/653">Intel XE#653</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_joiner@basic-force-big-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4328">Intel XE#4328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-4/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_joiner@basic-ultra-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-6/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/346">Intel XE#346</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2934">Intel XE#2934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_panel_fitting@atomic-fastset=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-4/igt@kms_plane@plane-position-hole-dp=
ms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +11 other tests dmesg-wa=
rn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-=
a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-433/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size=
-64.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12736/shard-dg2-464/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-=
size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_plane_lowres@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_plane_multiple@tiling-y.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/455">Intel XE#455</a>) +20 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-3/igt@kms_plane_multiple@tiling-y.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@kms_plane_scaling@plane-downscal=
e-factor-0-25-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +19 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_plane_scaling@plane-downsc=
ale-factor-0-25-with-modifiers@pipe-d.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-=
c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-1/igt@kms_plane_scaling@plane-downscal=
e-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +23 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25-upscale-20x20@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_pm_backlight@fade.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"=
>Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Inte=
l XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Inte=
l XE#1430</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Inte=
l XE#2392</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">In=
tel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/=
shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836<=
/a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-plane-u=
pdate-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +10 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-upd=
ate-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_psr@fbc-pr-no-drrs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/285=
0">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/929">Intel XE#929</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_psr@fbc-psr-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234=
">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@kms_psr@pr-no-drrs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@kms_psr@psr2-primary-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_rotation_crc@bad-pixel-forma=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@kms_rotation_crc@sprite-rotation=
-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-n=
one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2413">Intel XE#2413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-bmg-2/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@k=
ms_setmode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2883">Intel XE#2883</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-464/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/s=
hard-dg2-433/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883=
</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_setmode@basic@pipe-b-dp-4.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2883">Intel XE#2883</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-=
lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 ot=
her tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1435">Intel XE#1435</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-1/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc-stealing=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12736/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealin=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_tv_load_detect@load-detect=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/330">Intel XE#330</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-1/igt@kms_tv_load_detect@load-detect.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/330">Intel XE#330</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@kms_tv_load_detect@load-detect.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-3/igt@kms_universal_plane@cursor-fb-le=
ak@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/899">Intel XE#899</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_vrr@max-min.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel =
XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_writeback@writeback-check-=
output-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-3/igt@kms_writeback@writeback-check-ou=
tput-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-lnl-7/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0=
-system-system.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12736/shard-lnl-4/igt@xe_ccs@suspend-resume@tile64-comp=
ressed-compfmt0-system-system.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>) +1 other t=
est dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_compute_preempt@compute-pre=
empt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-=
0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1123">Intel XE#1123</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0=
xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_eu_stall@blocking-read.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4497">Intel XE#4497</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@xe_eudebug@basic-connect.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/290=
5">Intel XE#2905</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ufenc=
e-delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-ufence-=
reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence-=
sigint-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@xe_eudebug_online@breakpoint-man=
y-sessions-single-tile.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +12 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_eudebug_online@interrupt-ot=
her-debuggable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2905">Intel XE#2905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_eudebug_sriov@deny-sriov.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-st=
andalone-nofree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#139=
2</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +11 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_exec_fault_mode@twice-binde=
xecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +25 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-8/igt@xe_live_ktest@xe_migrate@xe_vali=
date_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_live_ktest@xe_mocs@xe_live_=
mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_media_fill@media-fill.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
60">Intel XE#560</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@xe_media_fill@media-fill.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/560=
">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-1/igt@xe_mmap@pci-membarrier-parallel.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4045">Intel XE#4045</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8267/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8267/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-8/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8267/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8267/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8267/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8267/shard-lnl-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-ln=
l-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8267/shard-lnl-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard=
-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-6/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/sh=
ard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267=
/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
267/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8267/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-6/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8267/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-lnl-3/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12736/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12736/shard-lnl-3/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/s=
hard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-6/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12736/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-5/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12736/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-8/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12736/shard-lnl-5/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-l=
nl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-6/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1273=
6/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12736/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12736/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-8/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12736/shard-lnl-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shar=
d-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2736/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-1/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12736/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@x=
e_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12736/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Inte=
l XE#378</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8267/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8267/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-2/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8267/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8267/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8267/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8267/shard-bmg-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bm=
g-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8267/shard-bmg-7/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard=
-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-4/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/sh=
ard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-bmg-8/igt@xe_module_load@load=
.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12736/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12736/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bm=
g-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12736/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12736/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard=
-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
736/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12736/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12736/shard-bmg-4/igt@xe_module_load@load.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8267/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGT_8267/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-=
dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267=
/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_8267/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8267/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8267/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-46=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard=
-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_826=
7/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8267/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-464/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8267/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8267/shard-dg2-433/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8267/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/s=
hard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12736/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shar=
d-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12736/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2=
-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
736/shard-dg2-464/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12736/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/s=
hard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12736/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shar=
d-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12736/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_oa@blocking:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_oa@blocking.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel=
 XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_oa@syncs-userptr-wait.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_pat@pat-index-xe2.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">=
Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/283=
8">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/979">Intel XE#979</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420"=
>Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2838">Intel XE#2838</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420"=
>Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-4/igt@xe_pat@pat-index-xelp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">I=
ntel XE#977</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@xe_pat@pat-index-xelp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">=
Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@xe_peer2peer@write.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Int=
el XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@xe_pm@d3cold-basic-exec.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284=
">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_pm@d3cold-mmap-system.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-5/igt@xe_pm@s3-vm-bind-prefetch.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
4">Intel XE#584</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-7/igt@xe_pm@s4-multiple-execs.html">AB=
ORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/426=
8">Intel XE#4268</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@xe_query@multigpu-query-cs-cyc=
les.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@xe_query@multigpu-query-cs-cycle=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@xe_query@multigpu-query-mem-usag=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-lnl-7/igt@xe_sriov_auto_provisioning@fair-=
allocation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4130">Intel XE#4130</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@xe_sriov_auto_provisioning@fair-=
allocation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@xe_sriov_auto_provisioning@sel=
fconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other tes=
t skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cu=
rsor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/309">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_cursor_legacy@2x-n=
onblocking-modeset-vs-cursor-atomic.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa=
-varying-size.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/310">Intel XE#310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_flip@2x-dpms-vs-vblank-race-in=
terruptible.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE=
#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12736/shard-bmg-8/igt@kms_flip@2x-flip-vs-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-464/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">=
Intel XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12736/shard-dg2-464/igt@kms_flip@flip-vs-absolute-wf_vblank.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-464/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a6.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/886">Intel XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_flip@flip-vs-absolute-wf_vblan=
k@a-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Int=
el XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12736/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-=
dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible@c-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_frontbuffer_trac=
king@fbc-2p-scndscrn-pri-indfb-draw-blt.html">PASS</a> +5 other tests pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1435">Intel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_setmode@invalid-clone-single-cr=
tc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-464/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/=
shard-dg2-433/igt@kms_vrr@negative-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-464/igt@testdisplay.html">ABORT</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg=
2-464/igt@testdisplay.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@p=
ipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_ccs@bad-rotatio=
n-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787=
</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-cc=
s-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt=
@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787=
">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2705">Intel XE#2705</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">In=
tel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12736/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">=
Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a=
-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3804">i915#3804</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel X=
E#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12736/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2=
882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-=
indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-ind=
fb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12736/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-cur-indfb-move.html">ABORT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4520">Intel XE#4520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shr=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_frontbuf=
fer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#6=
56</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-8/igt@kms_frontbuffe=
r_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#23=
11</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indf=
b-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-2/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-i=
ndfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-433/igt@kms_frontbuffer_t=
racking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1=
6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12736/shard-dg2-464/igt@kms_frontbuffer_trac=
king@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +13 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8267/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12736/shard-bmg-4/igt@kms_frontbuffer_tracking=
@psr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tes=
ts skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8267 -&gt; IGTPW_12736</li>
</ul>
<p>IGTPW_12736: 3d53622493160177e5e6e98b5a64e00e376273c3 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8267: 3ad1299396859b88c0938d93b38f42e2169cdf41 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2786-0457c65354c6dfa0e81d9acb5e39e03b59b82d7a: 0457c65354c6dfa0e81d9ac=
b5e39e03b59b82d7a</p>

</body>
</html>

--===============4191694521682612857==--
